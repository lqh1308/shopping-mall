package com.lqh.base;

import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

@Component
public class BaseRedisService {
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	@Autowired
	private RedisTemplate redisTemplate;
	
	public void setString(String key, String value) {
		setString(key, value, null);
	}
	
	public void setString(String key, String value, Long timeout) {
		if(value instanceof String) {
			stringRedisTemplate.opsForValue().set(key, value);
		}
		if(timeout != null) {
			stringRedisTemplate.expire(key, timeout, TimeUnit.SECONDS);
		}
	}
	
	public String getString(String key) {
		return stringRedisTemplate.opsForValue().get(key);
	}
	
	public void dealKey(String key) {
		stringRedisTemplate.delete(key);
	}

	public void putMap(String key, Map map) {
		redisTemplate.opsForHash().putAll(key, map);
	}

	public Map getMap(String key) {
		return redisTemplate.opsForHash().entries(key);
	}
}
