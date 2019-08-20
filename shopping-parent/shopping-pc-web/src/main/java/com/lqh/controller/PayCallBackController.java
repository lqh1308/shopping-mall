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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alipay.api.AlipayApiException;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.PayCallBackServiceFeign;


@Controller
@RequestMapping("/alibaba")
public class PayCallBackController{
	@Autowired
	private PayCallBackServiceFeign payCallBackServiceFeign;
	
	private static final String PAY_SUCCESS = "pay_success";


	/**
	 * 同步回调
	 * @param map
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/returnUrl")
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
		
		ResponseBase responseBase =  payCallBackServiceFeign.syncPayCallBack(params);
		if(!responseBase.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			request.setAttribute("errorMsg", responseBase.getMsg());
			return;
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		@SuppressWarnings("rawtypes")
		LinkedHashMap data = (LinkedHashMap) responseBase.getData();
		
		String htmlFrom = "<form name='punchout_form'"
                + " method='post' action='http://127.0.0.1/alibaba/synSuccessPage' >"
                + "<input type='hidden' name='outTradeNo' value='" + data.get("outTradeNo") + "'>"
                + "<input type='hidden' name='tradeNo' value='" + data.get("tradeNo") + "'>"
                + "<input type='hidden' name='totalAmount' value='" + data.get("totalAmount") + "'>"
                + "<input type='submit' value='立即支付' style='display:none'>"
                + "</form><script>document.forms[0].submit();" + "</script>";
		writer.println(htmlFrom);
		writer.close();
	}
	
	@RequestMapping(value="/synSuccessPage", method=RequestMethod.POST)
	public String syncSuccessPage(HttpServletRequest request, String outTradeNo, String tradeNo, String totalAmount) {
		request.setAttribute("outTradeNo", outTradeNo);
		request.setAttribute("tradeNo", tradeNo);
		request.setAttribute("totalAmount", totalAmount);
		
		return PAY_SUCCESS;
	}
	
	

	/**
	 * 异步回调
	 * @param map
	 * @return
	 * @throws AlipayApiException 
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/notifyUrl")
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
		
		return payCallBackServiceFeign.asyncPayCallBack(params);
	}

	


}
