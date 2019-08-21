package com.lqh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class OrderController {
	
	private static final String ORDER = "order";
	
	@RequestMapping("/toMyOrder")
	public String toMyOrder() {
		return ORDER;
	}
}
