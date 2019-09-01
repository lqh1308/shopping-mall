package entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderGood {
	private Integer id;
	private String orderId;
	private Integer goodId;
	private Integer price;
	private Integer num;
	private Date crateTime;
	
	private String goodName;
	private String goodLogo;
}
