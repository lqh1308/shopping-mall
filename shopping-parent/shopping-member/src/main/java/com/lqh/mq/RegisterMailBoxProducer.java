package com.lqh.mq;

import javax.jms.Destination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

@Service
public class RegisterMailBoxProducer {
	@Autowired
	private JmsMessagingTemplate jmsMessagingTemplate;
	
	public void sendMsg(Destination destination, JSONObject json) {
		jmsMessagingTemplate.convertAndSend(destination, json.toJSONString());
	}
}
