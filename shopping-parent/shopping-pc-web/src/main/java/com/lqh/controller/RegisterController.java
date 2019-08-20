package com.lqh.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.entity.User;
import com.lqh.feign.MemberServiceFeign;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RegisterController {
	@Autowired
	private MemberServiceFeign memberServiceFeign;
	
	private static final String REGISTER = "register";
	private static final String LOGIN = "login";
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register() {
		return REGISTER;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPost(User user, HttpServletRequest request) {
		//调用注册服务注册
		ResponseBase result =  memberServiceFeign.registUser(user);
		log.info("##############注册结果状态： {}", result.getStatusCode());
		//失败提示错误
		if(!result.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			log.info("##########注册失败！###########");
			request.setAttribute("error", "注册失败");
			return REGISTER;
		}
		log.info("###########注册成功！###############");
		//成功跳转到login页
		return LOGIN;
	}
}	
