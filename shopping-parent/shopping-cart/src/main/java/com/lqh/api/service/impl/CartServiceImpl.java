package com.lqh.api.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.lqh.CartService;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.dao.CartDao;

import entity.Cart;

@RestController
public class CartServiceImpl extends BaseApiService implements CartService{
	
	@Autowired
	private CartDao cartDao;

	@Override
	public ResponseBase getCartsByUserId(@RequestParam("userId") String userId) {
		if(StringUtils.isEmpty(userId)) {
			return setResponseError("userId不能为空");
		}
		List<Cart> carts = cartDao.getCartsByUserId(userId);
		JSONObject json = new JSONObject();
		json.put("carts", carts);
		
		return setResponseSuccess(json);
	}

	@Override
	public ResponseBase updateGoodPurchaseNum(Cart cart) {
		cartDao.updateCartCollected(cart);
		return setResponseSuccess();
	}

	@Override
	public ResponseBase deleteGood(Cart cart) {
		cartDao.deleteGood(cart);
		return setResponseSuccess();
	}

	@Override
	@Transactional
	public ResponseBase addIntoCollector(Cart cart) {
		if(cartDao.addIntoCollector(cart) <= 0) {
			return setResponseError("插入收藏夹失败!");
		}
		
		//收藏该商品
		cart.setIsCollected(1);
		cartDao.updateCartCollected(cart);
		return setResponseSuccess();
	}

	
}
