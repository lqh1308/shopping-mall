package com.lqh;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;

import entity.Cart;

@RequestMapping("/cart")
public interface CartService {
	
	@RequestMapping("/getCartsByUserId")
	public ResponseBase getCartsByUserId(@RequestParam("userId") String userId);
	
	@RequestMapping("/updateGoodPurchaseNum")
	public ResponseBase updateGoodPurchaseNum(Cart cart);
	
	@RequestMapping("/deleteGood")
	public ResponseBase deleteGood(Cart cart);

	@RequestMapping("/addIntoCollector")
	public ResponseBase addIntoCollector(Cart cart);
	
}
