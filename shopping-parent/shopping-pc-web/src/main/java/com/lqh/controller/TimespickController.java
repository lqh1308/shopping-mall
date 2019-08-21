package com.lqh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TimespickController {
	
	private static final String TIMESPICK = "timespick";
	
	@RequestMapping("/toTimespick")
	public String toTimespick() {
		return TIMESPICK;
	}
}
