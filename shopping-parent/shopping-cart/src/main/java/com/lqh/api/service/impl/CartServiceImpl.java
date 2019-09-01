package com.lqh.api.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.codingapi.tx.annotation.TxTransaction;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.dao.CartDao;
import com.lqh.feign.GoodServiceFeign;

import api.service.CartService;
import entity.Cart;
import entity.Good;

@RestController
public class CartServiceImpl extends BaseApiService implements CartService{
	
	@Autowired
	private CartDao cartDao;
	@Autowired
	private GoodServiceFeign goodServiceFeign;

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
	public ResponseBase updateGoodPurchaseNum(@RequestBody Cart cart) {
		System.out.println("cartId : " + cart.getId() + ", purchaseNum : " + cart.getPurchaseNum());
		cartDao.updateGoodPurchaseNum(cart);
		return setResponseSuccess();
	}

	@Override
	@TxTransaction
	@Transactional
	public ResponseBase deleteGood(@RequestParam("cids") String ids) {
		String[] idArr = ids.split(",");
		List<Integer> list = new ArrayList<Integer>();
		for(String id : idArr) {
			list.add(Integer.parseInt(id));
		}
		cartDao.deleteGood(list);
		return setResponseSuccess();
	}

	@Override
	@Transactional
	public ResponseBase addIntoCollector(@RequestBody Cart cart) {
		if(cartDao.addIntoCollector(cart) <= 0) {
			return setResponseError("插入收藏夹失败!");
		}
		
		//收藏该商品
		cart.setIsCollected(1);
		cartDao.updateCartCollected(cart);
		return setResponseSuccess();
	}

	@Override
	@Transactional
	public ResponseBase delFromCollector(@RequestBody Cart cart) {
		//从收藏夹删除
		cartDao.delFromCollector(cart);
		//修改购物车是否收藏
		cart.setIsCollected(0);
		cartDao.updateCartCollected(cart);
		return setResponseSuccess();
	}

	@Override
	public ResponseBase addIntoCart(Cart cart) {
		//查询商品是否已经加入到购物车
		Cart cartResult = cartDao.getCartByGoodId(cart.getGoodId());
		if(cartResult != null) {
			//购物车数量直接加一
			cartResult.setPurchaseNum(cartResult.getPurchaseNum() + 1);
			cartResult.setLastUpdateTime(new Date());
			cartDao.updateGoodPurchaseNum(cartResult);
			return setResponseSuccess();
		}
		//添加商品进购物车
		//获取商品信息
		@SuppressWarnings("rawtypes")
		LinkedHashMap goodMap = (LinkedHashMap) goodServiceFeign.getGoodById(cart.getGoodId()).getData();
		Good good = JSONObject.parseObject(JSONObject.toJSONString(goodMap.get("good")), Good.class);
		cart.setPurchasePrice(good.getSalePrice());
		//设置初始信息
		cartDao.insertCart(cart);
		return setResponseSuccess();
	}

	@Override
	public ResponseBase getCartsByCartIds(String ids) {
		if(StringUtils.isEmpty(ids))
			return setResponseError("id不能为空");
		String[] idArr = ids.split(",");
		List<Integer> cartIds = new ArrayList<Integer>();
		for(String id : idArr) {
			cartIds.add(Integer.parseInt(id));
		}
		List<Cart> carts = cartDao.getCartsByCartId(cartIds);
		return setResponseSuccess(carts);
	}
	

	
}
