package api.service.impl;

import api.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingapi.tx.annotation.ITxTransaction;
import com.codingapi.tx.annotation.TxTransaction;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.dao.OrderDao;

@RestController
public class OrderServiceImpl extends BaseApiService implements OrderService, ITxTransaction{
	@Autowired
	private OrderDao orderDao;
	
	@Override
	@TxTransaction
	@Transactional
	public ResponseBase updateOrder(@RequestParam("payStatus") Integer payStatus, @RequestParam("payId") String payId, @RequestParam("orderNumber") String orderNumber) {
		// TODO Auto-generated method stub
		int updateOrder = orderDao.updateOrder(payStatus, payId, orderNumber);
        if (updateOrder <= 0) {
            return setResponseError("系统错误!");
        }
        return setResponseSuccess();
	}
	

}
