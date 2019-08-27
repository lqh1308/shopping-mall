package com.lqh.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Good {
	private Integer id;
	private String name;
	private String subName;			//副名称
	private Integer category;		//商品类目id
	private Integer brand;			//品牌id
	private Integer stock;			//库存
	private Integer warningStock;	//预警库存
	private Integer weight;			//重量
	private Integer customSales;	//自定义销量
	private Integer salePrice;		//出售价格
	private Integer originalPrice;	//原本价格
	private Integer costPrice;		//成本价格
	private Integer giftIntegral;	//赠送积分
	private Integer isOnShelf;		//是否上架 0、1
	private Date onShelfTime;		//上架时间
	private Date offSheltTime;		//下架时间
	private String promotionType;	//促销：0-热卖、1-新品、2-精品、3-推荐、4-包邮 
	private String keyword;			//关键字
	private String describe;		//描述
	private Integer sortWeight;		//排序权重
	
}
