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
	
	public ResponseBase() {
		// TODO Auto-generated constructor stub
	}
	public ResponseBase(Integer statusCode, String msg, Object data) {
		super();
		this.statusCode = statusCode;
		this.msg = msg;
		this.data = data;
	}
	
}
