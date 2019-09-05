package com.lqh.api.service.impl;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
//import com.codingapi.tx.annotation.TxTransaction;
import com.codingapi.txlcn.tc.annotation.LcnTransaction;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.dao.PayDao;
import com.lqh.feign.OrderServiceFeign;

import api.service.PayService;
import entity.PaymentInfo;
import lombok.extern.slf4j.Slf4j;


@RestController
@Slf4j
public class PayServiceImpl extends BaseApiService implements PayService {
	@Autowired
	private PayDao payDao;
	@Autowired
	private OrderServiceFeign orderServiceFeign;
	
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
	@LcnTransaction
	@Transactional
	public ResponseBase createToken(@RequestBody PaymentInfo paymentInfo) {
		//创建支付订单
		Integer id = payDao.savePaymentInfo(paymentInfo);
		if(id <= 0) 
			return setResponseError("插入订单信息失败！");
		/*
		//获取token
		String token = TokenUtil.getPayToken();
		//将token存储进redis
		baseRedisService.setString(token, paymentInfo.getOrderId(), Constans.PAY_TOKEN_TIMEOUT);
		//返回token
		JSONObject obj = new JSONObject();
		obj.put("payToken", token);
		return setResponseSuccess(obj);
		*/
		//将订单号存储到redis(保证订单在规定时间内提交，超出时间则取消)
		baseRedisService.setString(paymentInfo.getOrderId(), "0", Constans.PAY_TOKEN_TIMEOUT);
		JSONObject obj = new JSONObject();
		obj.put("orderId", paymentInfo.getOrderId());
		obj.put("typeId", paymentInfo.getTypeId());
		return setResponseSuccess(obj);
	}

	@Override
	public ResponseBase findPayToken(@RequestParam("payToken") String payToken) {
		//验证参数
		if(StringUtils.isEmpty(payToken))
			return setResponseError("token参数不能为空！");
		//判断token有效期
		String redisOrderId = baseRedisService.getString(payToken);
		if(StringUtils.isEmpty(redisOrderId)) {
			//订单超时失效
			orderServiceFeign.orderInvalid(payToken);
			//支付信息失效
			payDao.upateOrderState(2, payToken);
			return setResponseError("支付信息失效");
		}
		//使用订单id查找订单消息
		//PaymentInfo paymentInfo = payDao.getPaymentInfoByOrderId(redisOrderId);
		PaymentInfo paymentInfo = payDao.getPaymentInfoByOrderId(payToken);
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
	
	
	//同步
	@Override
	public ResponseBase syncPayCallBack(@RequestParam Map<String, String> map) {
		log.info("##############开始调用syncPayCallBack 接口###########");
		try {
			//验签
			boolean signVerified = AlipaySignature.rsaCheckV1(map, alipay_public_key, charset, sign_type); //调用SDK验证签名
			//——请在这里编写您的程序（以下代码仅作参考）——
			if(!signVerified)
				//验签失败
				return setResponseError("验签失败！");
			//商户订单号
			String outTradeNo = map.get("out_trade_no");
			//支付宝交易号
			String tradeNo = map.get("trade_no");
			//付款金额
			String totalAmount = map.get("total_amount");
			
			JSONObject obj = new JSONObject();
			obj.put("outTradeNo", outTradeNo);
			obj.put("tradeNo", tradeNo);
			obj.put("totalAmount", totalAmount);
			
			return setResponseSuccess(obj);
			
		} catch (Exception e) {
			// TODO: handle exception
			log.info("##############调用syncPayCallBack 接口失败#####Error:," + e);
			return setResponseError("调用支付接口失败!");
		} finally {
			log.info("##############调用syncPayCallBack 接口结束###########");
		}
		
	}
	
	//异步
	@Override
	@LcnTransaction
	@Transactional
	public String asyncPayCallBack(@RequestParam Map<String, String> map) {
		log.info("##############开始调用asyncPayCallBack 接口###########");
		try {
			//验签
			boolean signVerified = AlipaySignature.rsaCheckV1(map, alipay_public_key, charset, sign_type); //调用SDK验证签名
			//——请在这里编写您的程序（以下代码仅作参考）——
			if(!signVerified)
				//验签失败
				return Constans.ERROR;
			//商户订单号
			String outTradeNo = map.get("out_trade_no");
			//支付宝交易号
			String tradeNo = map.get("trade_no");
			//付款金额
			//String totalAmount = map.get("total_amount");
			
			//修改支付信息
			PaymentInfo paymentInfo = payDao.getPaymentInfoByOrderId(outTradeNo);
			if(paymentInfo.getState() == 1) 
				//已经支付成功则返回
				return Constans.SUCCESS;
			//没有支付过则修改
			paymentInfo.setPlatformorderId(tradeNo);
			paymentInfo.setState(1);
			paymentInfo.setPayMessage(map.toString());
			paymentInfo.setUpdated(new Date());
			payDao.updatePaymentInfo(paymentInfo);
			
			//修改订单信息
			ResponseBase orderResult = orderServiceFeign.updateOrder(1, tradeNo, outTradeNo, 1);
			if(!orderResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
				//修改订单信息失败
				return Constans.ERROR;
			
			return Constans.SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			log.info("##############调用asyncPayCallBack 接口失败#####Error:," + e);
			return Constans.ERROR;
		} finally {
			log.info("##############调用asyncPayCallBack 接口结束###########");
		}
	}

	@Override
	public ResponseBase getPaymentInfoByOrderId(@RequestParam("orderId") String orderId) {
		PaymentInfo paymentInfo = payDao.getPaymentInfoByOrderId(orderId);
		return setResponseSuccess(paymentInfo);
	}

	@Override
	public ResponseBase paymentInfoInvalid(String orderId) {
		payDao.upateOrderState(2, orderId);
		return setResponseSuccess();
	}

}
