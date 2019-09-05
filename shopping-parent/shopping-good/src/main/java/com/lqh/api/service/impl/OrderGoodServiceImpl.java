package com.lqh.api.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingapi.txlcn.tc.annotation.LcnTransaction;
//import com.codingapi.tx.annotation.TxTransaction;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.dao.OrderGoodDao;

import api.service.OrderGoodService;
import entity.OrderGood;

@RestController
public class OrderGoodServiceImpl extends BaseApiService implements OrderGoodService{
	
	@Autowired
	private OrderGoodDao orderGoodDao;

	@Override
	@LcnTransaction
	@Transactional
	public ResponseBase insertOrderGoods(@RequestBody OrderGood orderGood) {
		if(orderGood == null) 
			return setResponseError("参数不能为空");
		orderGoodDao.insertOrderGood(orderGood);
		return setResponseSuccess();
	}
	
	@Override
	public ResponseBase getOrderGoods(@RequestParam("orderId") String orderId) {
		if(StringUtils.isEmpty(orderId))
			setResponseError("orderId不能为空");
		List<OrderGood> goods = orderGoodDao.getGoodsByOrderId(orderId);
		return setResponseSuccess(goods);
	}

	@Override
	@LcnTransaction
	@Transactional
	public ResponseBase batchInsertOrderGoods(@RequestBody List<OrderGood> orderGoods) {
		if(orderGoods == null || orderGoods.size() == 0) 
			return setResponseError("参数不能为空");
		orderGoodDao.insertOrderGoods(orderGoods);
		return setResponseSuccess();
	}

	@Override
	public ResponseBase getDetailOrderGoodsByOrderId(@RequestParam("orderId") String orderId) {
		if(StringUtils.isEmpty(orderId))
			setResponseError("orderId不能为空");
		List<OrderGood> goods = orderGoodDao.getDetailOrderGoodsByOrderId(orderId);
		return setResponseSuccess(goods);
	}

}
