package entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Cart {
	private Integer id;
	private Integer userId;
	private Integer goodId;
	private Integer purchaseNum;
	private Integer purchasePrice;
	private Integer isCollected;
	private Date createTime;
	private Date lastUpdateTime;
	
	private String goodName;
	private String goodLogoUrl;
}
