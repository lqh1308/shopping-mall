package entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Banner {
	private Integer id;
	private Integer goodCategory;		//商品类目id	
	private Integer goodId;				//商品id
	private String imgUrl;				//图片地址
	private Integer weight;				//排序权重
}
