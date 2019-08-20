package com.lqh.api.service;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;

import com.lqh.base.ResponseBase;

@RequestMapping("/member")
public interface MemberServiceTest {
	@RequestMapping("/getMember")
	public Map<String, Object> getMember(Integer id, String name);
	
	@RequestMapping("/getMemberBase")
	public ResponseBase getMemberBase();
	
	@RequestMapping("/setRedisTest")
	public ResponseBase setRedisTest(String key, String value);
}
