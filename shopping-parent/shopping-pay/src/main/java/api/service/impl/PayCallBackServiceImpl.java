package api.service.impl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.internal.util.AlipaySignature;
import com.codingapi.tx.annotation.TxTransaction;
import api.service.PayCallBackService;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.dao.PayDao;
import entity.PaymentInfo;
import com.lqh.feign.OrderServiceFeign;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class PayCallBackServiceImpl extends BaseApiService implements PayCallBackService{
	@Value("${alipay.alipay_public_key}")
	private String alipayPublicKey;
	@Value("${alipay.charset}")
	private String charset;
	@Value("${alipay.sign_type}")
	private String signType;
	
	@Autowired
	private OrderServiceFeign orderServiceFeign;
	@Autowired
	private PayDao payDao;
	
	
	//同步
	@Override
	public ResponseBase syncPayCallBack(@RequestParam Map<String, String> map) {
		log.info("##############开始调用syncPayCallBack 接口###########");
		try {
			//验签
			boolean signVerified = AlipaySignature.rsaCheckV1(map, alipayPublicKey, charset, signType); //调用SDK验证签名
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
	@TxTransaction
	@Transactional
	public String asyncPayCallBack(@RequestParam Map<String, String> map) {
		log.info("##############开始调用asyncPayCallBack 接口###########");
		try {
			//验签
			boolean signVerified = AlipaySignature.rsaCheckV1(map, alipayPublicKey, charset, signType); //调用SDK验证签名
			//——请在这里编写您的程序（以下代码仅作参考）——
			if(!signVerified)
				//验签失败
				return Constans.ERROR;
			//商户订单号
			String outTradeNo = map.get("out_trade_no");
			//支付宝交易号
			String tradeNo = map.get("trade_no");
			//付款金额
//			String totalAmount = map.get("total_amount");
			
			//修改支付信息
			PaymentInfo paymentInfo = payDao.getPaymentInfoByOrderId(outTradeNo);
			if(paymentInfo.getState() == 1) 
				//支付成功
				return Constans.SUCCESS;
			//没有支付成功则修改
			paymentInfo.setPlatformorderId(tradeNo);
			paymentInfo.setState(1);
			paymentInfo.setPayMessage(map.toString());
			paymentInfo.setUpdated(new Date());
			payDao.updatePaymentInfo(paymentInfo);
			
			//修改订单信息
			ResponseBase orderResult = orderServiceFeign.updateOrder(1, tradeNo, outTradeNo);
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

}
