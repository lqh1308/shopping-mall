package com.lqh.base;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//@Slf4j
public class ResponseBase {
	//返回状态值
	private Integer statusCode;
	//返回信息
	private String msg;
	//返回参数
	private Object data;
	//返回url
	private String url;
	
	public ResponseBase() {
		// TODO Auto-generated constructor stub
	}
	public ResponseBase(Integer statusCode, String msg, Object data, String url) {
		super();
		this.statusCode = statusCode;
		this.msg = msg;
		this.data = data;
		this.url = url;
	}
	
}
