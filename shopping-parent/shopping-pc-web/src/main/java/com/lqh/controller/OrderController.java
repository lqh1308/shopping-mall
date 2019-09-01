package com.lqh.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.MemberServiceFeign;
import com.lqh.feign.OrderGoodServiceFeign;
import com.lqh.feign.OrderServiceFeign;
import com.lqh.utils.CookieUtil;

import entity.Order;
import entity.User;

@Controller
public class OrderController extends BaseApiService{
	@Autowired
	private OrderServiceFeign orderServiceFeign;
	@Autowired
	private MemberServiceFeign memberServiceFeign;
	@Autowired
	private OrderGoodServiceFeign orderGoodServiceFeign;
	
	private static final String ORDER = "order";
	
	//不同类型的订单
	@RequestMapping("/myOrder")
	public String toMyOrder(@RequestParam(value="state", required=false) Integer state, @RequestParam(value="page", required=false) Integer page, HttpServletRequest request) {
		//获取用户信息
		User user = getUserInfo(request);
		//获取对应状态的订单
		ResponseBase orderResult = null;
		page = (page == null) ? 1 : page;	//当前页数
		Integer pageSize = 4;				//每次返回的条数
		orderResult = orderServiceFeign.getOrderByState(state, user.getId()+"", page, pageSize);
		List<Order> orderList = JSONArray.parseArray(JSONArray.toJSONString(orderResult.getData()), Order.class);
		List<JSONObject> result = new ArrayList<JSONObject>();
		//获取订单列表里面的购物商品信息
		for(Order order : orderList) {
			JSONObject json = new JSONObject();
			ResponseBase cartResult = orderGoodServiceFeign.getDetailOrderGoodsByOrderId(order.getOrderId());
			json.put("order", order);
			json.put("cart", cartResult.getData());
			result.add(json);
		}
		//获取对应状态的订单总条数
		ResponseBase totalOrderResult = orderServiceFeign.getOrderByState(state, user.getId()+"", null, null);
		List<Order> totalOrderList = JSONArray.parseArray(JSONArray.toJSONString(totalOrderResult.getData()), Order.class);
		
 		request.setAttribute("orderList", result);
 		request.setAttribute("totalOrderSize", totalOrderList.size());
 		request.setAttribute("state", state);
 		if(page != null)
 			request.setAttribute("page", page);
		
		return ORDER;
	}
	
	//创建待支付订单
	@RequestMapping("/createUnPayOrder")
	@ResponseBody
	public ResponseBase createUnPayOrder(HttpServletRequest request, HttpServletResponse response, Order order) {
		if(order == null)
			return setResponseUrl(ORDER);
		//获取用户信息
		User user = getUserInfo(request);
		order.setUserId(user.getId());
		//创建订单
		ResponseBase orderResult =  orderServiceFeign.createOrder(order);
		@SuppressWarnings("rawtypes")
		LinkedHashMap orderMap = (LinkedHashMap) orderResult.getData();
		String orderId = (String) orderMap.get("orderId");
		Integer payType = (Integer) orderMap.get("typeId");
		//String url = "/alipay?payToken=" + orderId;
		String url = "/pay?oid=" + orderId + "&payType=" + payType;
		
		return setResponseUrl(url);
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
