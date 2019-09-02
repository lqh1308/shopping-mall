package com.lqh.api.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.codingapi.tx.annotation.ITxTransaction;
import com.codingapi.tx.annotation.TxTransaction;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.dao.OrderDao;
import com.lqh.feign.CartServiceFeign;
import com.lqh.feign.OrderGoodServiceFeign;
import com.lqh.feign.PayServiceFeign;
import com.lqh.utils.TokenUtil;

import api.service.OrderService;
import entity.Cart;
import entity.Order;
import entity.OrderGood;
import entity.PaymentInfo;

@RestController
public class OrderServiceImpl extends BaseApiService implements OrderService, ITxTransaction{
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private PayServiceFeign PayServiceFeign;
	@Autowired
	private OrderGoodServiceFeign orderGoodServiceFeign;
	@Autowired
	private CartServiceFeign cartServiceFeign;
	
	@Override
	@TxTransaction
	@Transactional
	public ResponseBase updateOrder(@RequestParam("payStatus") Integer payStatus, @RequestParam("payId") String payId, 
			@RequestParam("orderNumber") String orderNumber, @RequestParam("state") Integer state) {
		// TODO Auto-generated method stub
		int updateOrder = orderDao.updateOrder(payStatus, payId, orderNumber, state);
        if (updateOrder <= 0) {
            return setResponseError("系统错误!");
        }
        return setResponseSuccess();
	}
	
	@Override
	@TxTransaction
	@Transactional
	public ResponseBase createOrder(@RequestBody Order order) {
		//参数判断
		if(order == null) {
			return setResponseError("参数不能为空");
		}
		
		//创建订单信息
		String orderId = TokenUtil.getOrderId();
		order.setOrderId(orderId);
		order.setIsPay(0);
		orderDao.createOrder(order);
		
		//获取需要购买的购物车id
		String cartIds = baseRedisService.getString(Constans.USER_GOODS + "_" + order.getUserId());
		
		//创建订单商品信息
		Integer totalPrice = 0;
		List<OrderGood> orderGoods = new ArrayList<OrderGood>();
		ResponseBase cartBase = cartServiceFeign.getCartsByCartIds(cartIds);
		List<Cart> carts = JSONArray.parseArray(JSONArray.toJSONString(cartBase.getData()), Cart.class);
		for(Cart cart : carts) {
			OrderGood orderGood = new OrderGood();
			orderGood.setGoodId(cart.getGoodId());
			orderGood.setNum(cart.getPurchaseNum());
			orderGood.setOrderId(orderId);
			orderGood.setPrice(cart.getPurchasePrice());
			totalPrice += cart.getPurchasePrice() * cart.getPurchaseNum();
			
			orderGoods.add(orderGood);
		}
		totalPrice = totalPrice/100;
		ResponseBase orderGoodsResult = orderGoodServiceFeign.batchInsertOrderGoods(orderGoods);
		if(!orderGoodsResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return setResponseError("插入订单商品列表失败");
		
		//删除购买的购物车商品
		ResponseBase cartResult = cartServiceFeign.deleteGood(cartIds);
		if(!cartResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) 
			return setResponseError("删除购物车失败");
		
		//创建支付订单信息
		PaymentInfo paymentInfo = new PaymentInfo();
		paymentInfo.setTypeId(order.getPayType());
		paymentInfo.setOrderId(orderId);
		paymentInfo.setUserId(order.getUserId());
		paymentInfo.setOrderTitle("商品购买");
		paymentInfo.setOrderDescription(null);
		paymentInfo.setSource("支付宝");
		paymentInfo.setPrice(totalPrice);
		paymentInfo.setState(0);
		ResponseBase payResult = PayServiceFeign.createToken(paymentInfo);
		if(!payResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return setResponseError("创建订单失败！");
		
		return setResponseSuccess(payResult.getData());
	}

	@Override
	public ResponseBase getOrderByOrderId(@RequestParam("orderId") String orderId) {
		if(StringUtils.isEmpty(orderId))
			return setResponseError("参数不能为空");
		Order order = orderDao.getOrderByOrderId(orderId);
		return setResponseSuccess(order);
	}

	@Override
	public ResponseBase getOrderByState(@RequestBody Order order, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="pageSize", required=false) Integer pageSize) {
		Integer start = null;
		if(page != null) {
			start = (page - 1) * pageSize;
		}
		List<Order> orders = orderDao.getOrderByState(order, start, pageSize);
		return setResponseSuccess(orders);
	}

	@Override
	public ResponseBase orderInvalid(String orderId) {
		//0:未支付 1:待发货 2:发货 3:已收货未评价 4:退换货 5:已评价 6:取消订单 7:超时失效订单
		//标记为失效订单
		orderDao.upateOrderState(7, orderId);
		return setResponseSuccess();
	}
	

}
