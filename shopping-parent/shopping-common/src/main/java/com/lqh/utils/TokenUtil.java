package com.lqh.utils;

import java.util.UUID;

import com.lqh.contants.Constans;

public class TokenUtil {
	public static String getMemberToken() {
		return Constans.MEMBER_TOKEN + "-" + UUID.randomUUID();
	}
	
	public static String getPayToken() {
		return Constans.PAY_TOKEN + "-" + UUID.randomUUID();
	}
}
