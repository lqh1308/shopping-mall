package entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Address {
	private Integer id;
	private Integer userId;			//用户id
	private String username;		//收货人名字
	private String phone;			//手机号码
	private String fixPhone;		//固定电话
	private String location;		//所在地区
	private String detailAddress;	//详细地址
	private Integer isDefault;		//是否默认地址（0：不是默认地址， 1：是默认地址）
	private Date createTime;		//创建时间
}
