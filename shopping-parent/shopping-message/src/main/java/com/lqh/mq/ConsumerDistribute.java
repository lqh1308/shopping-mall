package com.lqh.mq;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.lqh.adapter.MessageAdapter;
import com.lqh.contants.Constans;
import com.lqh.service.EmailService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ConsumerDistribute {
	@Autowired
	private EmailService emailService;
	private MessageAdapter messageAdapter;
	//接收消息队列
	@JmsListener(destination="message-queue")
	public void distribute(String json) {
		log.info("##############消息接收平台接收消息内容：" + json);
		//消息为空返回
		if(StringUtils.isEmpty(json))
			return;
		JSONObject jsonObject = JSONObject.parseObject(json);
		JSONObject header = jsonObject.getJSONObject("header");
		String interfaceType = header.getString("interfaceType");
		if(StringUtils.isEmpty(interfaceType))
			return;
		JSONObject content = jsonObject.getJSONObject("content");
		if(Constans.MSG_EMAIL.equals(interfaceType))
			//匹配消息类型是邮件类型
			messageAdapter = emailService;
		
		//没有匹配类型返回
		if(messageAdapter == null) 
			return;
		//发送消息
		messageAdapter.sendMessage(content);
		
	}
}
