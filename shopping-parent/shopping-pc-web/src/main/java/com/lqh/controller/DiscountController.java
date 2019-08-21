package com.lqh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiscountController {
	
	private static final String DISCOUNT = "discount";
	
	@RequestMapping("/toDiscount")
	public String toDiscount() {
		return DISCOUNT;
	}
}
