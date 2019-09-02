package com.lqh.contants;

public interface Constans {
	//BASE
	String SUCCESS = "success";
	String ERROR = "error";
	
    // 响应请求成功
    String HTTP_RES_CODE_200_VALUE = "success";
    // 系统错误
    String HTTP_RES_CODE_500_VALUE = "fial";
    // 响应请求成功code
    Integer HTTP_RES_CODE_200 = 200;
    // 账号未绑定 qq OpenId
    Integer HTTP_RES_CODE_201 = 201;
    // 系统错误
    Integer HTTP_RES_CODE_500 = 500;
    
    // 消息
    // 消息报文头
    String MSG_HEADER = "header";
    // 消息报文体
    String MSG_CONTENT = "content";
    // 消息报文头 消息接口类型
    String MSG_INTERFACETYPE = "interfaceType";
    // 具体消息接口类型
    String MSG_EMAIL = "email";
    
    // 用户toke
    // redis member_token
    String MEMBER_TOKEN = "member_token";
    // redis token 保存期限
    Long MEMBER_TOKEN_TIMEOUT = (long) (60*60*24*90);
    // cookie member_token
    String COOKIE_MEMBER_TOKEN = "cookie_member_token";
    // cookie token 保存期限
    int COOKIE_TOKEN_TIMEOUT = 60*60*24*90;
    
    // 支付
    // 支付token pay_token
    String PAY_TOKEN = "pay_token";
    // 支付token 在redis保存期限 15分钟
    Long PAY_TOKEN_TIMEOUT = (long)15*60;
    // 用户创建订单时选中的商品
    String USER_GOODS = "user_goods";
    
}
