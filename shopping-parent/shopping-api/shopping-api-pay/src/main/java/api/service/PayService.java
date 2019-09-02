package api.service;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;
import entity.PaymentInfo;

@RequestMapping("/pay")
public interface PayService {
	
	//创建支付信息
	@RequestMapping("/createToken")
	public ResponseBase createToken(@RequestBody PaymentInfo paymentInfo);
	
	//支付
	@RequestMapping("/findPayToken")
	public ResponseBase findPayToken(@RequestParam("payToken") String payToken);
	
	@RequestMapping("/getPaymentInfoByOrderId")
	public ResponseBase getPaymentInfoByOrderId(@RequestParam("orderId") String orderId);
	
	//同步回掉
	@RequestMapping("/syncPayCallBack")
	public ResponseBase syncPayCallBack(@RequestParam Map<String, String> map);
	
	//异步回掉
	@RequestMapping("/asyncPayCallBack")
	public String asyncPayCallBack(@RequestParam Map<String, String> map);
	
	@RequestMapping("/paymentInfoInvalid")
	public ResponseBase paymentInfoInvalid(@RequestParam("orderId") String orderId);
}
