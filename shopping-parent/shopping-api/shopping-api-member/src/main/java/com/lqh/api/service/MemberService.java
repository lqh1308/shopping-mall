package com.lqh.api.service;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;
import com.lqh.entity.User;

@RequestMapping("/member")
public interface MemberService {
	@RequestMapping("/findUserById")
	public ResponseBase findUserById(Integer id);
	
	@RequestMapping("/registUser")
	public ResponseBase registUser(@RequestBody User user);
	
	@RequestMapping("/login")
	public ResponseBase login(@RequestBody User user);
	
	@RequestMapping("/logOut")
	public ResponseBase logOut(@RequestParam("token") String token);
	
	@RequestMapping("/findByToken")
	public ResponseBase findByToken(@RequestParam("token") String token);
	
	//绑定qq的OpenId 和 账号
	@RequestMapping("/qqLogin")
	public ResponseBase qqLogin(@RequestBody User user);
	
	//qq 关联登陆
	@RequestMapping("/findByOpenIdUser")
	public ResponseBase findByOpenIdUser(@RequestParam("openId") String openId);
}
