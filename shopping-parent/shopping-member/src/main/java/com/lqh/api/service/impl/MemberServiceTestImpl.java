package com.lqh.api.service.impl;

import java.util.HashMap;
import java.util.Map;

import api.service.MemberServiceTest;
import org.springframework.web.bind.annotation.RestController;

import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;

@RestController
public class MemberServiceTestImpl extends BaseApiService implements MemberServiceTest {

	@Override
	public Map<String, Object> getMember(Integer id, String name) {
		// TODO Auto-generated method stub
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("statusCode", "200");
		result.put("msg", "success");
		result.put("data", new String[] {"123", "234"});

		return result;
	}

	@Override
	public ResponseBase getMemberBase() {
		// TODO Auto-generated method stub
		return setResponseSuccess();
	}

	@Override
	public ResponseBase setRedisTest(String key, String value) {
		// TODO Auto-generated method stub
		baseRedisService.setString(key, value);
		return setResponseSuccess();
	}

}
