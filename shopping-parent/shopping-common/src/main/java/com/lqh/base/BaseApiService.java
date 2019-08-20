package com.lqh.base;

import org.springframework.beans.factory.annotation.Autowired;

import com.lqh.contants.Constans;

public class BaseApiService {
	@Autowired
	protected BaseRedisService baseRedisService;
	
	//返回失败
	public ResponseBase setResponseError(String msg) {
		return new ResponseBase(Constans.HTTP_RES_CODE_500, msg, null);
	}
	
	//返回失败
	public ResponseBase setResponseQQUnBind(String msg) {
		return new ResponseBase(Constans.HTTP_RES_CODE_201, msg, null);
	}
	
	//返回成功，有返回参数
	public ResponseBase setResponseSuccess(Object data) {
		return new ResponseBase(Constans.HTTP_RES_CODE_200, Constans.HTTP_RES_CODE_200_VALUE, data);
	}
	
	//返回成功，没有返回参数
	public ResponseBase setResponseSuccess(String msg) {
		return new ResponseBase(Constans.HTTP_RES_CODE_200, msg, null);
	}
	
	//返回成功，没有返回参数
	public ResponseBase setResponseSuccess() {
		return new ResponseBase(Constans.HTTP_RES_CODE_200, Constans.HTTP_RES_CODE_200_VALUE, null);
	}
	
	//基本方法
	public ResponseBase setResponseBase(Integer statusCode, String msg, Object data) {
		return new ResponseBase(statusCode, msg, data);
	}
}
