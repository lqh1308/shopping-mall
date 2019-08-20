package com.lqh.api.service;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;

@RequestMapping("/payCallBack")
public interface PayCallBackService {
	//同步回掉
	@RequestMapping("/syncPayCallBack")
	public ResponseBase syncPayCallBack(@RequestParam Map<String, String> map);
	
	//异步回掉
	@RequestMapping("/asyncPayCallBack")
	public String asyncPayCallBack(@RequestParam Map<String, String> map);
}
