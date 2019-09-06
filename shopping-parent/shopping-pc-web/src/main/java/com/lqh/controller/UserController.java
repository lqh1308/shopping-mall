package com.lqh.controller;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.MemberServiceFeign;
import com.lqh.feign.OrderServiceFeign;
import com.lqh.utils.CookieUtil;

import entity.Order;
import entity.User;

@Controller
public class UserController {
	
	@Autowired
	private MemberServiceFeign memberServiceFeign;
	@Autowired
	private OrderServiceFeign orderServiceFeign;
	
	private static final String USER = "user";
	private static final String ORDER = "order";
	
	@RequestMapping("/user")
	public String toUser(HttpServletRequest request) {
		//加载用户信息
		User user = getUserInfo(request);
		request.setAttribute("isLogin", true);
		request.setAttribute("username", user.getUsername());
		
		//订单查询
		Order order = new Order();
		order.setUserId(user.getId());
		order.setState(0);
		ResponseBase unPaylist = orderServiceFeign.getOrderByState(order, null, null);
		order.setState(1);
		ResponseBase unDeliverlist = orderServiceFeign.getOrderByState(order, null, null);
		order.setState(2);
		ResponseBase unReceivelist = orderServiceFeign.getOrderByState(order, null, null);
		order.setState(3);
		ResponseBase unEvaluatelist = orderServiceFeign.getOrderByState(order, null, null);
		List<Order> unPayOrders = JSONArray.parseArray(JSONArray.toJSONString(unPaylist.getData()), Order.class); 
		List<Order> unDeliverOrders = JSONArray.parseArray(JSONArray.toJSONString(unDeliverlist.getData()), Order.class); 
		List<Order> unReceiveOrders = JSONArray.parseArray(JSONArray.toJSONString(unReceivelist.getData()), Order.class); 
		List<Order> unEvaluateOrders = JSONArray.parseArray(JSONArray.toJSONString(unEvaluatelist.getData()), Order.class); 
		request.setAttribute("unPay", unPayOrders);
		request.setAttribute("unDeliver", unDeliverOrders);
		request.setAttribute("unReceive", unReceiveOrders);
		request.setAttribute("unEvaluate", unEvaluateOrders);
		
		return USER;
	}
	
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest request) {
		User user = getUserInfo(request);
		request.setAttribute("userInfo", user);
		return ORDER;
	}
	
	//获取用户信息
	private User getUserInfo(HttpServletRequest request) {
		//获取用户信息
		String member_token = CookieUtil.getUid(request, Constans.COOKIE_MEMBER_TOKEN);
		if(StringUtils.isEmpty(member_token))
			return null;
		ResponseBase userResponse = memberServiceFeign.findByToken(member_token);
		if(!userResponse.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return null;
		@SuppressWarnings("rawtypes")
		LinkedHashMap userMap = (LinkedHashMap) userResponse.getData();
		User user = JSONObject.parseObject(JSONObject.toJSONString(userMap), User.class);
		return user;
	}
}
