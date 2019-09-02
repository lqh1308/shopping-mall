package api.service;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;

import entity.Cart;

@RequestMapping("/cart")
public interface CartService {
	
	@RequestMapping("/addIntoCart")
	public ResponseBase addIntoCart(@RequestBody Cart cart);
	
	@RequestMapping("/getCartsByUserId")
	public ResponseBase getCartsByUserId(@RequestParam("userId") String userId);
	
	@RequestMapping("/getCartsByCartIds")
	public ResponseBase getCartsByCartIds(@RequestParam("ids") String ids);
	
	@RequestMapping("/updateGoodPurchaseNum")
	public ResponseBase updateGoodPurchaseNum(@RequestBody Cart cart);
	
	@RequestMapping("/deleteGood")
	public ResponseBase deleteGood(@RequestParam("cids") String ids);

	@RequestMapping("/addIntoCollector")
	public ResponseBase addIntoCollector(@RequestBody Cart cart);
	
	@RequestMapping("/getCollector")
	public ResponseBase getCollector(@RequestParam("userId") String userId);
	
	@RequestMapping("/delFromCollector")
	public ResponseBase delFromCollector(@RequestBody Cart cart);
	
	
}
