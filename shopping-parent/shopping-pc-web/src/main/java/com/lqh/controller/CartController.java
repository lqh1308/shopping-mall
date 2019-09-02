package com.lqh.controller;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.CartServiceFeign;
import com.lqh.feign.MemberServiceFeign;
import com.lqh.utils.CookieUtil;

import entity.Address;
import entity.Cart;
import entity.User;

@Controller
public class CartController extends BaseApiService {
	@Autowired
	private CartServiceFeign cartServiceFeign;
	@Autowired
	private MemberServiceFeign memberServiceFeign;
	
	private static final String CART = "cart";
	private static final String GORDER = "gorder";
	private static final String ORDER = "order";
	
	@RequestMapping("/toCart")
	public String toCart(HttpServletRequest request) {
		User user = getUserInfo(request);
		if(user == null) {
			request.setAttribute("isLogin", false);
		}else {
			request.setAttribute("isLogin", true);
			request.setAttribute("username", user.getUsername());
		}
			
		return CART;
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping("/getUserCart")
	@ResponseBody
	public ResponseBase getUserCart(HttpServletRequest request) {
		//获取用户信息
		User user = getUserInfo(request);
		
		//通过用户信息获取购物车信息
		ResponseBase cartResponse = cartServiceFeign.getCartsByUserId(user.getId() + "");
		if(!cartResponse.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return null;
		LinkedHashMap cartMap = (LinkedHashMap) cartResponse.getData();
		
		//将linkedHashMap转为list类型
		List<Cart> carts = JSONArray.parseArray(JSONObject.toJSONString(cartMap.get("carts")), Cart.class);
		//总价格
		Integer pmount = 0;
		//总商品件数
		Integer nmount = 0;
		for(Cart cart : carts) {
			cart.setTotalPrice((float)(Math.round(cart.getPurchasePrice() * cart.getPurchaseNum()))/100);
			pmount += cart.getPurchasePrice() * cart.getPurchaseNum();
			nmount += cart.getPurchaseNum();
			cart.setShowPrice((float)(Math.round(cart.getPurchasePrice()))/100);
		}
		float price = (float)(Math.round(pmount))/100;
		JSONObject json = new JSONObject();
		json.put("carts", carts);
		json.put("pmount", price);
		json.put("nmount", nmount);
		
		return setResponseSuccess(json);
	}
	
	@RequestMapping("/getCartsById")
	public ResponseBase getCartByCartId(@RequestParam("ids") String ids) {
		ResponseBase carts = cartServiceFeign.getCartsByCartIds(ids);
		return carts;
	}
	
	@RequestMapping("/addToCart")
	@ResponseBody
	public ResponseBase addToCart(Cart cart, HttpServletRequest request) {
		User user = getUserInfo(request);
		cart.setUserId(user.getId());
		ResponseBase cartResult = cartServiceFeign.addIntoCart(cart);
		
		return cartResult;
	}
	
	@RequestMapping("/changeCartGoodNum")
	@ResponseBody
	public ResponseBase changeCartGoodNum(Cart cart) {
		ResponseBase result = cartServiceFeign.updateGoodPurchaseNum(cart);
		if(!result.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return setResponseError("修改失败"); 
		return setResponseSuccess("修改成功");
	}
	
	@RequestMapping("/removeCart")
	@ResponseBody
	public ResponseBase removeCart(@RequestParam("id") String ids) {
		ids = ids.replace("@", ",");
		ResponseBase result = cartServiceFeign.deleteGood(ids);
		if(!result.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return setResponseError("修改失败"); 
		return setResponseSuccess("修改成功");
	}
	
	@RequestMapping("/addfav")
	@ResponseBody
	public ResponseBase addfav(HttpServletRequest request, Cart cart) {
		//获取用户信息
		User user = getUserInfo(request);
		cart.setUserId(user.getId());
		//加入收藏
		ResponseBase result = cartServiceFeign.addIntoCollector(cart);
		if(!result.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return setResponseError("修改失败"); 
		return setResponseSuccess("修改成功");
	}
	
	@RequestMapping("/delfav")
	@ResponseBody
	public ResponseBase delfav(HttpServletRequest request, Cart cart) {
		//获取用户信息
		User user = getUserInfo(request);
		cart.setUserId(user.getId());
		//取消收藏
		ResponseBase result = cartServiceFeign.delFromCollector(cart);
		if(!result.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return setResponseError("修改失败");
		return setResponseSuccess("修改成功");
	}
	
	@RequestMapping("/myfav")
	public String myfav(HttpServletRequest request) {
		User user = getUserInfo(request);
		ResponseBase fav = cartServiceFeign.getCollector(user.getId()+"");
		request.setAttribute("favs", fav.getData());
		
		return ORDER;
	}
	
	//结算商品
	@RequestMapping(value="/calculateCarts")
	@ResponseBody
	public ResponseBase calculateCarts(@RequestParam("cartIds") String cartIds, HttpServletRequest request) {
		if(StringUtils.isEmpty(cartIds))
			return setResponseUrl("");
		//获取用户信息
		User user = getUserInfo(request);
		//将待提交订单的商品放入redis
		baseRedisService.setString(Constans.USER_GOODS + "_" + user.getId(), cartIds);
		return setResponseUrl("http://localhost/confirmOrder");
	}
	
	//提交确认订单页面
	@RequestMapping(value="/confirmOrder")
	public String createOrder(HttpServletRequest request) {
		//获取用户信息
		User user = getUserInfo(request);
		String cartIds = baseRedisService.getString(Constans.USER_GOODS + "_" + user.getId());
		//获取需购买商品
		ResponseBase cartsResult = cartServiceFeign.getCartsByCartIds(cartIds);
		List<Cart> carts = JSONArray.parseArray(JSONArray.toJSONString(cartsResult.getData()), Cart.class);
		int pmount = 0;
		int nmount = 0;
		for(Cart cart : carts) {
			cart.setTotalPrice((float)(Math.round(cart.getPurchasePrice() * cart.getPurchaseNum()))/100);
			cart.setShowPrice((float)(Math.round(cart.getPurchasePrice()))/100);
			pmount += cart.getPurchasePrice() * cart.getPurchaseNum();
			nmount += cart.getPurchaseNum();
		}
		
		//获取用户收获地址
		ResponseBase addressResult = memberServiceFeign.getAddresses(user.getId());
		if(!addressResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			request.setAttribute("addressErr", "获取用户收获地址失败");
		}
		List<Address> addresslist = JSONArray.parseArray(JSONArray.toJSONString(addressResult.getData()), Address.class); 
		request.setAttribute("carts", carts);
		request.setAttribute("cartsNum", nmount);
		request.setAttribute("cartsTotalPrice", (float)(Math.round(pmount))/100);
		request.setAttribute("addresses", addresslist);
		return GORDER; 
	}
	
	@RequestMapping("/getUserAddress")
	@ResponseBody
	public ResponseBase getUserAddress(HttpServletRequest request) {
		//获取用户
		User user = getUserInfo(request);
		//获取用户收获地址
		ResponseBase addressResult = memberServiceFeign.getAddresses(user.getId());
		if(!addressResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			return setResponseError("获取收获地址失败！");
		}
		List<Address> addressList = JSONArray.parseArray(JSONArray.toJSONString(addressResult.getData()), Address.class);
		return setResponseSuccess(addressList);
	}
	
	@RequestMapping("/addAddress")
	@ResponseBody
	public ResponseBase addAddress(HttpServletRequest request, Address address) {
		//获取用户
		User user = getUserInfo(request);
		address.setUserId(user.getId());
		//判断是新增地址还是修改地址
		if(address.getId() != null) {
			//修改
			ResponseBase editResult = memberServiceFeign.updateAddress(address);
			if(!editResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
				return setResponseError("修改收货地址失败！");
			}
		}else {
			//添加收获地址
			ResponseBase addResult = memberServiceFeign.addAddress(address);
			if(!addResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
				return setResponseError("添加地址收获失败！");
			}
		}
		return setResponseSuccess();
	}
	
	@RequestMapping("delAddress")
	@ResponseBody
	public ResponseBase delAddress(@RequestParam("addressId") Integer id) {
		if(StringUtils.isEmpty(id+"")) {
			return setResponseError("id不能为空");
		}
		ResponseBase delResult =  memberServiceFeign.delAddress(id);
		if(!delResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			return setResponseError("删除收获地址失败！");
		}
		return setResponseSuccess();
	}
	
	@RequestMapping("/updateAddress")
	@ResponseBody
	public ResponseBase updateAddress(HttpServletRequest request, Address address) {
		//获取用户
		User user = getUserInfo(request);
		address.setUserId(user.getId());
		ResponseBase updateResult = memberServiceFeign.updateAddress(address);
		if(!updateResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) 
			return setResponseError("修改收获地址失败！");
		return setResponseSuccess();
	}
	
	@RequestMapping("/getAddress")
	@ResponseBody
	public ResponseBase getAddress(@RequestParam("addressId") Integer id) {
		if(StringUtils.isEmpty(id+"")) {
			return setResponseError("id不能为空");
		}
		ResponseBase addressResult =  memberServiceFeign.getAddressById(id);
		if(!addressResult.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			return setResponseError("查询地址失败！");
		}
		return setResponseSuccess(addressResult.getData());
	}
	
	//获取用户信息
	private User getUserInfo(HttpServletRequest request) {
		//获取用户信息
		String member_token = CookieUtil.getUid(request, Constans.COOKIE_MEMBER_TOKEN);
		if(StringUtils.isEmpty(member_token))
			return null;
		ResponseBase userResponse = memberServiceFeign.findByToken(member_token);
		if(!userResponse.getStatusCode().equals(Constans.HTTP_RES_CODE_200))
			return null;
		@SuppressWarnings("rawtypes")
		LinkedHashMap userMap = (LinkedHashMap) userResponse.getData();
		User user = JSONObject.parseObject(JSONObject.toJSONString(userMap), User.class);
		return user;
	}
}
