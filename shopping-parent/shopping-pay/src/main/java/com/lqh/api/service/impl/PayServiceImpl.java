package com.lqh.api.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import api.service.PayService;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.dao.PayDao;
import entity.PaymentInfo;
import com.lqh.utils.TokenUtil;

@RestController
public class PayServiceImpl extends BaseApiService implements PayService {
	@Autowired
	private PayDao payDao;

	@Value("${alipay.gatewayUrl}")
	private String gatewayUrl;
	@Value("${alipay.app_id}")
	private String app_id;
	@Value("${alipay.merchant_private_key}")
	private String merchant_private_key;
	@Value("${alipay.charset}")
	private String charset;
	@Value("${alipay.alipay_public_key}")
	private String alipay_public_key;
	@Value("${alipay.sign_type}")
	private String sign_type;
	@Value("${alipay.return_url}")
	private String return_url;
	@Value("${alipay.notify_url}")
	private String notify_url;

	@Override
	public ResponseBase createToken(@RequestBody PaymentInfo paymentInfo) {
		//创建支付订单
		Integer id = payDao.savePaymentInfo(paymentInfo);
		if(id <= 0)
			return setResponseError("插入订单信息失败！");
		//获取token
		String token = TokenUtil.getPayToken();
		//将token存储进redis
		baseRedisService.setString(token, id + "", Constans.PAY_TOKEN_TIMEOUT);
		//返回token
		JSONObject obj = new JSONObject();
		obj.put("payToken", token);
		return setResponseSuccess(obj);
	}

	@Override
	public ResponseBase findPayToken(@RequestParam("payToken") String payToken) {
		//验证参数
		if(StringUtils.isEmpty(payToken))
			return setResponseError("token参数不能为空！");
		//判断token有效期
		String redisId = baseRedisService.getString(payToken);
		if(StringUtils.isEmpty(redisId))
			return setResponseError("支付信息失效");
		//使用token在redis中找到订单id
		Integer id = Integer.parseInt(redisId);
		//使用订单id查找订单消息
		PaymentInfo paymentInfo = payDao.getPaymentInfoById(id);
		//对接支付宝支付接口
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(gatewayUrl, app_id, merchant_private_key, "json", charset, alipay_public_key, sign_type);
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(return_url);
		alipayRequest.setNotifyUrl(notify_url);

		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = paymentInfo.getOrderId();
		//付款金额，必填
		String total_amount = paymentInfo.getPrice() + "";
		//订单名称，必填
		String subject = paymentInfo.getOrderTitle();
		//商品描述，可空
		String body = paymentInfo.getOrderDescription();

		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
				+ "\"total_amount\":\""+ total_amount +"\","
				+ "\"subject\":\""+ subject +"\","
				+ "\"body\":\""+ body +"\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求
		try {
			String payHtml = alipayClient.pageExecute(alipayRequest).getBody();
			JSONObject obj = new JSONObject();
			obj.put("payHtml", payHtml);
			return setResponseSuccess(obj);
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			return setResponseError("调用支付接口失败！");
		}

	}

}