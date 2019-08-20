package com.lqh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.PayServiceFeign;

@Controller
public class PayController {
	@Autowired
	private PayServiceFeign payServiceFeign;
	
	@RequestMapping("/alipay")
	public void alipay(@RequestParam("payToken") String payToken, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer =  response.getWriter();
		//1.验证参数
		if(StringUtils.isEmpty(payToken))
			return;
		//2.远程调用支付服务
		ResponseBase result = payServiceFeign.findPayToken(payToken);
		if(!result.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			String msg = result.getMsg();
			writer.println(msg);
			return;
		}
		@SuppressWarnings("rawtypes")
		LinkedHashMap map = (LinkedHashMap) result.getData();
		String payHtml = (String) map.get("payHtml");
		if(StringUtils.isEmpty(payHtml)) {
			writer.println("调用支付接口失败！");
			return;
		}
		writer.println(payHtml);
		writer.close();
	}
}
