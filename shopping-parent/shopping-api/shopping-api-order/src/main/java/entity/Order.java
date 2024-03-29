package entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Order {
	  private Integer id;
	  private String orderId;				//订单号
	  private String orderNumber;			//支付平台支付完返回的支付订单交易号
	  private Integer userId;				//用户id
	  private Integer isPay;				//是否支付
	  private String payId;					//支付平台支付完返回的支付交易号
	  private Integer addressId;			//收货地址id
	  private Integer payType;				//支付类型（0：支付宝， 1：微信， 2：银联， 3：货到付款）
	  private Integer distributeMode;		//配送方式（0：商家配送）
	  private Date created;
	  private Date updated;
	  private Integer state;				//订单状态（0:未支付 1:待发货 2:发货 3:已收货未评价 4:退换货 5:已评价 6:取消订单 7:超时失效订单）
	  private String remarks;				//备注
	  
	  @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	  private Date startDate;				//开始时间
	  @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	  private Date endDate;					//结束时间
	  private String keywords;				//搜索关键字
	  private Integer page;					//页数
}
