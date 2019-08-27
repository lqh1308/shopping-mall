package com.lqh.api.service;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.lqh.adapter.MessageAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmailService implements MessageAdapter{
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Value("${msg.subject}")
	private String subject;
	@Value("${msg.text}")
	private String text;
	
	@Override
	public void sendMessage(JSONObject json) {
		// TODO Auto-generated method stub
		String email = json.getString("email");
		if(StringUtils.isEmpty(email))
			return;
		log.info("######消息服务平台处理消息{}", json);
		
		//创建邮件
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom(email);
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject(subject);
		simpleMailMessage.setText(text.replace("{}", email));
		
		//发送邮件
		javaMailSender.send(simpleMailMessage);
	}
	
}
