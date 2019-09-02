package api.service;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;

import entity.Order;

@RequestMapping("/orderService")
public interface OrderService {
	
	@RequestMapping("/updateOrder")
	public ResponseBase updateOrder(@RequestParam("payStatus") Integer payStatus, @RequestParam("payId") String payId, 
			@RequestParam("orderNumber") String orderNumber, @RequestParam("state") Integer state);
	
	@RequestMapping("/createOrder")
	public ResponseBase createOrder(@RequestBody Order order);
	
	@RequestMapping("/getOrderByOrderId")
	public ResponseBase getOrderByOrderId(@RequestParam("orderId") String orderId);
	
	@RequestMapping("/getOrderByState")
	public ResponseBase getOrderByState(@RequestBody Order order, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="pageSize", required=false) Integer pageSize);
	
	//使订单失效
	@RequestMapping("/orderInvalid")
	public ResponseBase orderInvalid(@RequestParam("orderId") String orderId);
}
