package com.lqh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.MemberServiceFeign;
import com.lqh.feign.PayServiceFeign;
import com.lqh.utils.CookieUtil;

import entity.PaymentInfo;
import entity.User;

@Controller
public class PayController {
	@Autowired
	private PayServiceFeign payServiceFeign;
	@Autowired
	private MemberServiceFeign memberServiceFeign;
	
	//private static final String PAY_SUCCESS = "pay_success";
	private static final String PAY_RESULT = "pay_result";
	private static final String PAY = "pay";
	
	@RequestMapping("/alipay")
	public void alipay(@RequestParam("payToken") String payToken, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer =  response.getWriter();
		//1.验证参数
		if(StringUtils.isEmpty(payToken))
			return;
		//2.远程调用支付服务
		ResponseBase result = payServiceFeign.findPayToken(payToken);
		if(!result.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			String msg = result.getMsg();
			writer.println(msg);
			return;
		}
		@SuppressWarnings("rawtypes")
		LinkedHashMap map = (LinkedHashMap) result.getData();
		String payHtml = (String) map.get("payHtml");
		if(StringUtils.isEmpty(payHtml)) {
			writer.println("调用支付接口失败！");
			return;
		}
		writer.println(payHtml);
		writer.close();
	}
	
	/**
	 * 同步回调
	 * @param map
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/payReturnUrl")
	public void syncPayCallBack(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		ResponseBase responseBase =  payServiceFeign.syncPayCallBack(params);
		if(!responseBase.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			request.setAttribute("errorMsg", responseBase.getMsg());
			return;
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		@SuppressWarnings("rawtypes")
		LinkedHashMap data = (LinkedHashMap) responseBase.getData();
		
		String htmlFrom = "<form name='punchout_form'"
                + " method='post' action='http://localhost/payResult' >"
                + "<input type='hidden' name='outTradeNo' value='" + data.get("outTradeNo") + "'>"
                + "<input type='hidden' name='tradeNo' value='" + data.get("tradeNo") + "'>"
                + "<input type='hidden' name='totalAmount' value='" + data.get("totalAmount") + "'>"
                + "<input type='submit' value='立即支付' style='display:none'>"
                + "</form><script>document.forms[0].submit();" + "</script>";
		writer.println(htmlFrom);
		writer.close();
	}
	
	@RequestMapping(value="/payResult", method=RequestMethod.POST)
	public String syncSuccessPage(HttpServletRequest request, String outTradeNo, String tradeNo, String totalAmount) {
		User user = getUserInfo(request);
		request.setAttribute("username", user.getUsername());
		request.setAttribute("outTradeNo", outTradeNo);
		request.setAttribute("tradeNo", tradeNo);
		request.setAttribute("totalAmount", totalAmount);
		
		return PAY_RESULT;
	}
	
	//支付页面
	@RequestMapping("/pay")
	public String toPay(@RequestParam("oid") String orderId, @RequestParam("payType") String payType, HttpServletRequest request) {
		User user = getUserInfo(request);
		//获取金额
		ResponseBase responseBase = payServiceFeign.getPaymentInfoByOrderId(orderId);
		PaymentInfo paymentInfo = JSONObject.parseObject(JSONObject.toJSONString(responseBase.getData()), PaymentInfo.class);
		request.setAttribute("isLogin", true);
		request.setAttribute("username", user.getUsername());
		request.setAttribute("orderId", orderId);
		request.setAttribute("payType", payType);
		request.setAttribute("totolMoney", paymentInfo.getPrice());
		return PAY;
	}

	/**
	 * 异步回调
	 * @param map
	 * @return
	 * @throws AlipayApiException 
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/payNotifyUrl")
	public String asyncPayCallBack(HttpServletRequest request) throws AlipayApiException, UnsupportedEncodingException {
		//获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            params.put(name, valueStr);
        }
		
		return payServiceFeign.asyncPayCallBack(params);
	}
	
	//获取用户信息
	private User getUserInfo(HttpServletRequest request) {
		//获取用户信息
		String member_token = CookieUtil.getUid(request, Constans.COOKIE_MEMBER_TOKEN);
		if(StringUtils.isEmpty(member_token))
			return null;
		ResponseBase userResponse = memberServiceFeign.findByToken(member_token);
		if(!userResponse.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return null;
		@SuppressWarnings("rawtypes")
		LinkedHashMap userMap = (LinkedHashMap) userResponse.getData();
		User user = JSONObject.parseObject(JSONObject.toJSONString(userMap), User.class);
		return user;
	}

}
