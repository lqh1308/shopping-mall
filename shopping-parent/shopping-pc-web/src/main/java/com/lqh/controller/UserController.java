package com.lqh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final String USER = "user";
	
	@RequestMapping("/toUserPage")
	public String toUser() {
		return USER;
	}
	
}
