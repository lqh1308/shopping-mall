package com.lqh.utils;

import java.util.Date;
import java.util.UUID;

import com.lqh.contants.Constans;

public class TokenUtil {
	public static String getMemberToken() {
		return Constans.MEMBER_TOKEN + "-" + UUID.randomUUID();
	}
	
	public static String getPayToken() {
		return Constans.PAY_TOKEN + "-" + UUID.randomUUID();
	}
	
	public static String getOrderId() {
		return DateUtils.DateToString(new Date(), DateUtils.DATE_TO_NUMBER_DETAIL_PATTERN) + UUID.randomUUID();
	}
}
