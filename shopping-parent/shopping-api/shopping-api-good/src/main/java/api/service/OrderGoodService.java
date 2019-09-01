package api.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;

import entity.OrderGood;

@RequestMapping("/orderGood")
public interface OrderGoodService {
	
	@RequestMapping("/insertOrderGoods")
	public ResponseBase insertOrderGoods(@RequestBody OrderGood orderGood);
	
	@RequestMapping("/batchInsertOrderGoods")
	public ResponseBase batchInsertOrderGoods(@RequestBody List<OrderGood> orderGoods);
	
	@RequestMapping("/getOrderGoods")
	public ResponseBase getOrderGoods(@RequestParam("orderId") String orderId);
	
	@RequestMapping("/getDetailOrderGoodsByOrderId")
	public ResponseBase getDetailOrderGoodsByOrderId(@RequestParam("orderId") String orderId);
}
