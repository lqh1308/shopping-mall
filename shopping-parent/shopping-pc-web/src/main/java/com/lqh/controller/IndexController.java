package com.lqh.controller;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.MemberServiceFeign;
import com.lqh.utils.CookieUtil;


@Controller
public class IndexController {
	private static final String LOGIN = "login";
	private static final String INDEX = "index";
	@Autowired
	private MemberServiceFeign memberServiceFeign;
	
	@RequestMapping(value={"/", "/index"}, method=RequestMethod.GET)
	public String toIndex(HttpServletRequest request) {
		/*
		////获取用户信息
		//1.获取token
		String token = CookieUtil.getUid(request, Constans.COOKIE_MEMBER_TOKEN);
		if(StringUtils.isEmpty(token)) {
			//返回登陆页面
			request.setAttribute("error", "没有登陆！请登陆");
			return LOGIN;
		}
		//2.token不为空则获取用户信息
		ResponseBase responseBase =  memberServiceFeign.findByToken(token);
		if(!responseBase.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			request.setAttribute("error", "没有查找到用户信息！");
			return LOGIN;
		}
		@SuppressWarnings("rawtypes")
		LinkedHashMap user = (LinkedHashMap) responseBase.getData();
		request.setAttribute("username", user.get("username"));
		return INDEX;
		
		*/
		//没有登陆可以进入首页
		String token = CookieUtil.getUid(request, Constans.COOKIE_MEMBER_TOKEN);
		ResponseBase responseBase = null;
		if(StringUtils.isEmpty(token)) {
			//直接返回成功
			request.setAttribute("isLogin", false);
			return INDEX;
		}
		//2.token不为空则获取用户信息
		responseBase =  memberServiceFeign.findByToken(token);
		if(!responseBase.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			request.setAttribute("error", "没有查找到用户信息！请重新登陆");
			return LOGIN;
		}
		@SuppressWarnings("rawtypes")
		LinkedHashMap user = (LinkedHashMap) responseBase.getData();
		request.setAttribute("username", user.get("username"));
		request.setAttribute("isLogin", true);
		
		return INDEX;
	}
}
