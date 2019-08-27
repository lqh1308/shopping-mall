package api.service;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;

@RequestMapping("/orderService")
public interface OrderService {
	
	@RequestMapping("/updateOrder")
	public ResponseBase updateOrder(@RequestParam("payStatus") Integer payStatus, @RequestParam("payId") String payId, @RequestParam("orderNumber") String orderNumber);
	
}
