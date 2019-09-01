package api.service;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;

import entity.Address;
import entity.User;

@RequestMapping("/member")
public interface MemberService {
	@RequestMapping("/findUserById")
	public ResponseBase findUserById(Integer id);
	
	@RequestMapping("/registUser")
	public ResponseBase registUser(@RequestBody User user);
	
	@RequestMapping("/login")
	public ResponseBase login(@RequestBody User user);
	
	@RequestMapping("/logout")
	public ResponseBase logout(@RequestParam("token") String token);
	
	@RequestMapping("/findByToken")
	public ResponseBase findByToken(@RequestParam("token") String token);
	
	//绑定qq的OpenId 和 账号
	@RequestMapping("/qqLogin")
	public ResponseBase qqLogin(@RequestBody User user);
	
	//qq 关联登陆
	@RequestMapping("/findByOpenIdUser")
	public ResponseBase findByOpenIdUser(@RequestParam("openId") String openId);
	
	
	/**
	 * 收获地址
	 */
	@RequestMapping("/addAddress")
	public ResponseBase addAddress(@RequestBody Address address);
	
	@RequestMapping("/updateAddress")
	public ResponseBase updateAddress(@RequestBody Address address);
	
	@RequestMapping("/delAddress")
	public ResponseBase delAddress(@RequestParam("addressId") Integer id);
	
	@RequestMapping("getAddresses")
	public ResponseBase getAddresses(@RequestParam("userId") Integer userId);
	
	@RequestMapping("/getAddressById")
	public ResponseBase getAddressById(@RequestParam("addressId") Integer id);
	
}
