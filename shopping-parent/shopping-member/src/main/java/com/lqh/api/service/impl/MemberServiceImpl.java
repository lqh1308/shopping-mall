package com.lqh.api.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.activemq.command.ActiveMQQueue;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.dao.UserDao;
import com.lqh.mq.RegisterMailBoxProducer;
import com.lqh.utils.MD5Util;
import com.lqh.utils.TokenUtil;

import api.service.MemberService;
import entity.Address;
import entity.User;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class MemberServiceImpl extends BaseApiService implements MemberService{
	@Autowired
	private UserDao userDao;
	@Autowired
	private RegisterMailBoxProducer registerMailBoxProducer;
	@Value("${message.queue}")
	private String MESSAGEQUEUE;
	
	@Override
	public ResponseBase findUserById(Integer id) {
		User user = userDao.findUserById(id);
		if(user == null) 
			return setResponseError("未找到该用户！");
		return setResponseSuccess(user);
	}

	@Override
	public ResponseBase registUser(@RequestBody User user) {
		//验证
		if(user.getPassword() == null)
			return setResponseError("密码不能为空");
		//对密码加密
		user.setPassword(MD5Util.MD5(user.getPassword()));
		Date now = new Date();
		user.setUpdated(now);
		user.setCreated(now);
		
		Integer result = userDao.registUser(user);
		if(result <= 0) 
			return setResponseError("注册失败！");
		log.info("###########给消息服务平台推送一条消息#########");
		sendMessage(getJson(user.getEmail()));
		
		return setResponseSuccess("注册成功！");
	}
	
	//封装消息报文JSON
	public JSONObject getJson(String email) {
		JSONObject root = new JSONObject();
		JSONObject header = new JSONObject();
		header.put(Constans.MSG_INTERFACETYPE, Constans.MSG_EMAIL);
		JSONObject content = new JSONObject();
		content.put(Constans.MSG_EMAIL, email);
		root.put(Constans.MSG_HEADER, header);
		root.put(Constans.MSG_CONTENT, content);
		
		return root;
	}
	
	//发送到消息队列
	public void sendMessage(JSONObject json) {
		ActiveMQQueue queue = new ActiveMQQueue(MESSAGEQUEUE);
		registerMailBoxProducer.sendMsg(queue, json);
	}

	@Override 
	public ResponseBase login(@RequestBody User user) {
		return setLogin(user);
	}

	@Override
	public ResponseBase findByToken(@RequestParam("token") String token) {
		//验证参数
		if(StringUtils.isEmpty(token))
			return setResponseError("token不能为空");
		//从reids 通过token查询userid
		String userid = baseRedisService.getString(token);
		if(StringUtils.isEmpty(userid))
			return setResponseError("token无效或者已经过期");
		//使用userid查询数据库查询用户信息
		User user = userDao.findUserById(Integer.parseInt(userid));
		if(user == null)
			return setResponseError("未查找到用户信息");
		user.setPassword(null);
		return setResponseSuccess(user);
		
	}
	
	//关联qq
	@Override
	public ResponseBase qqLogin(@RequestBody User user) {
		// TODO Auto-generated method stub
		//验证参数
		if(StringUtils.isEmpty(user.getOpenId()))
			return setResponseError("openId不能为空！");
		if(StringUtils.isEmpty(user.getUsername()))
			return setResponseError("账号不能为空！");
		if(StringUtils.isEmpty(user.getPassword()))
			return setResponseError("密码不能为空！");
		
		//验证openid是否绑定账号
		User openIdResult = userDao.findUserByOpenId(user.getOpenId());
		//没有绑定则绑定openid 并登陆
		if(openIdResult == null) {
			User result = userDao.loginIn(user.getUsername(), MD5Util.MD5(user.getPassword()));
			if(result == null)
				return setResponseError("账号或者密码错误");
			//绑定openId
			userDao.updateUserOpenId(user.getOpenId(), result.getId());
			return setLogin(user);
		}
		
		//绑定账号直接登陆
		return setLogin(openIdResult);
	}
	
	//qq登陆
	@Override
	public ResponseBase findByOpenIdUser(@RequestParam("openId") String openId) {
		// TODO Auto-generated method stub
		//验证参数
		if(StringUtils.isEmpty(openId))
			return setResponseError("openId不能为空！");
		//验证账号是否绑定qq的openId
		User user = userDao.findUserByOpenId(openId);
		if(user == null) 
			return setResponseQQUnBind("账号没有绑定QQ");
		//已经绑定直接登陆
		return setLogin(user);
	}
	
	//账号密码登陆
	public ResponseBase setLogin(User user) {
		//验证参数
		if(StringUtils.isEmpty(user.getUsername()))
			return setResponseError("用户名为空！");
		if(StringUtils.isEmpty(user.getPassword()))
			return setResponseError("密码不能为空！");
		
		//验证账号密码时候正确
		User result = userDao.loginIn(user.getUsername(), MD5Util.MD5(user.getPassword()));
		if(result == null)
			return setResponseError("账号密码错误");
		
		//生成Token
		String token = TokenUtil.getMemberToken();
		log.info("######将用户信息存放到redis中 key为" + token + ",value为" + result.getId() + "######");
		baseRedisService.setString(token, result.getId().toString(), Constans.MEMBER_TOKEN_TIMEOUT);
		
		//返回token
		JSONObject json = new JSONObject();
		json.put(Constans.MEMBER_TOKEN, token);
		return setResponseSuccess(json);
	}

	@Override
	public ResponseBase logout(@RequestParam("token") String token) {
		baseRedisService.dealKey(token);
		return setResponseSuccess();
	}

	@Override
	@Transactional
	public ResponseBase addAddress(@RequestBody Address address) {
		if(address == null) {
			return setResponseError("地址信息不能为空");
		}
		if(address.getIsDefault() == 1) {
			//将其它地址设置为非默认地址
			userDao.setAllUnDefaultAddress(address.getUserId());
		}
		if(userDao.addAddress(address) <= 0)
			return setResponseError("添加地址信息失败！");
		return setResponseSuccess();
	}

	@Override
	@Transactional
	public ResponseBase updateAddress(@RequestBody Address address) {
		if(address == null) {
			return setResponseError("地址信息不能为空");
		}
		if(address.getIsDefault() == 1) {
			//将其它地址设置为非默认地址
			userDao.setAllUnDefaultAddress(address.getUserId());
		}
		userDao.updateAddress(address);
		return setResponseSuccess();
	}

	@Override
	public ResponseBase delAddress(@RequestParam("addressId") Integer id) {
		userDao.delAddress(id);
		return setResponseSuccess();
	}

	@Override
	public ResponseBase getAddresses(@RequestParam("userId") Integer userId) {
		List<Address> addresses = userDao.getAddresses(userId);
		return setResponseSuccess(addresses);
	}

	@Override
	public ResponseBase getAddressById(@RequestParam("addressId") Integer id) {
		Address address = userDao.getAddressById(id);
		return setResponseSuccess(address);
	}



}
