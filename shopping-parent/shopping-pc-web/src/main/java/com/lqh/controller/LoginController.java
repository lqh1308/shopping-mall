package com.lqh.controller;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.entity.User;
import com.lqh.feign.MemberServiceFeign;
import com.lqh.utils.CookieUtil;
import com.qq.connect.QQConnectException;
import com.qq.connect.oauth.Oauth;

@Controller
public class LoginController {
	@Autowired
	private MemberServiceFeign memberServiceFeign;
	
	private static final String LOGIN = "login";
	
	private static final String INDEX = "redirect:/";
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return LOGIN;
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPost(User user, HttpServletRequest request, HttpServletResponse response) {
		//验证参数
		if(user == null) {
			request.setAttribute("error", "账号和密码不能为空");
			return LOGIN;
		}
		//调用会员服务登陆
		ResponseBase result = memberServiceFeign.login(user);
		if(!result.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			request.setAttribute("error", "账号或者密码错误");
			return LOGIN;
		}
		//获取token
		@SuppressWarnings("rawtypes")
		LinkedHashMap map = (LinkedHashMap) result.getData();
		String token = (String) map.get(Constans.MEMBER_TOKEN);
		if(StringUtils.isEmpty(token)) {
			request.setAttribute("error", "token不存在或者超时！");
			return LOGIN;
		}
		//登陆成功将token存到cookie
		CookieUtil.addCookie(response, Constans.COOKIE_MEMBER_TOKEN, token, Constans.COOKIE_TOKEN_TIMEOUT);
		//成功返回首页
		return INDEX;
	}
	
	
    // 生成qq授权登录链接
    @RequestMapping("/locaQQLogin")
    public String locaQQLogin(HttpServletRequest reqest) throws QQConnectException {
        String authorizeURL = new Oauth().getAuthorizeURL(reqest);
        return "redirect:" + authorizeURL;
    }
    
    
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logOut(HttpServletRequest request, HttpServletResponse response) {
    	//1.获取token
    	String token = CookieUtil.getUid(request, Constans.COOKIE_MEMBER_TOKEN);
    	//2.redis删除token
    	ResponseBase responseBase = memberServiceFeign.logout(token);
    	if(!responseBase.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
    		request.setAttribute("error", "退出失败");
    		return INDEX;
    	}
    	//3.删除浏览器的cookie
    	CookieUtil.removeCookie(response, Constans.COOKIE_MEMBER_TOKEN);
    	request.setAttribute("isLogin", false);
    	request.setAttribute("username", null);
    	return INDEX;
    }
}
