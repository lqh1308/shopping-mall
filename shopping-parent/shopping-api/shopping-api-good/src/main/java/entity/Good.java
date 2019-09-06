package entity;

import java.util.Date;

import lombok.Getter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

@Getter
@Document(indexName = "goods", type = "good")
public class Good {
	@Id
	private Integer id;
//	@Field(type = FieldType.Text, analyzer = "ik-smart", searchAnalyzer = "ik-smart", store = true)
	private String name;
//	@Field(type = FieldType.Text, analyzer = "ik-smart", searchAnalyzer = "ik-smart", store = true)
	private String subName;			//副名称
	private String logo;			//主图片
	private String detailPic;		//详细图片
//	@Field(type = FieldType.Text, analyzer = "ik-smart", searchAnalyzer = "ik-smart", store = true)
	private String category;		//商品类目名字
	private String categoryId;		// 商品类目id
//	@Field(type = FieldType.Integer, analyzer = "ik-smart", searchAnalyzer = "ik-smart", store = true)
	private Integer brand;			//品牌id
	private Integer stock;			//库存
	private Integer warningStock;	//预警库存
	private Integer weight;			//重量
	private Integer customSales;	//自定义销量
//	@Field(type = FieldType.Integer, analyzer = "ik-smart", searchAnalyzer = "ik-smart", store = true)
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

	@Override
	public String toString() {
		return "Good{" +
				"id=" + id +
				", name='" + name + '\'' +
				", subName='" + subName + '\'' +
				", logo='" + logo + '\'' +
				", category='" + category + '\'' +
				", brand=" + brand +
				", weight=" + weight +
				", salePrice=" + salePrice +
				", onShelfTime=" + onShelfTime +
				", offSheltTime=" + offSheltTime +
				", sortWeight=" + sortWeight +
				'}';
	}

	public Good setId(Integer id) {
		this.id = id;
		return this;
	}

	public Good setName(String name) {
		this.name = name;
		return this;
	}

	public Good setSubName(String subName) {
		this.subName = subName;
		return this;
	}

	public Good setLogo(String logo) {
		this.logo = logo;
		return this;
	}

	public Good setDetailPic(String detailPic) {
		this.detailPic = detailPic;
		return this;
	}

	public Good setCategory(String category) {
		this.category = category;
		return this;
	}

	public Good setCategoryId(String categoryId) {
		this.categoryId = categoryId;
		return this;
	}

	public Good setBrand(Integer brand) {
		this.brand = brand;
		return this;
	}

	public Good setStock(Integer stock) {
		this.stock = stock;
		return this;
	}

	public Good setWarningStock(Integer warningStock) {
		this.warningStock = warningStock;
		return this;
	}

	public Good setWeight(Integer weight) {
		this.weight = weight;
		return this;
	}

	public Good setCustomSales(Integer customSales) {
		this.customSales = customSales;
		return this;
	}

	public Good setSalePrice(Integer salePrice) {
		this.salePrice = salePrice;
		return this;
	}

	public Good setOriginalPrice(Integer originalPrice) {
		this.originalPrice = originalPrice;
		return this;
	}

	public Good setCostPrice(Integer costPrice) {
		this.costPrice = costPrice;
		return this;
	}

	public Good setGiftIntegral(Integer giftIntegral) {
		this.giftIntegral = giftIntegral;
		return this;
	}

	public Good setIsOnShelf(Integer isOnShelf) {
		this.isOnShelf = isOnShelf;
		return this;
	}

	public Good setOnShelfTime(Date onShelfTime) {
		this.onShelfTime = onShelfTime;
		return this;
	}

	public Good setOffSheltTime(Date offSheltTime) {
		this.offSheltTime = offSheltTime;
		return this;
	}

	public Good setPromotionType(String promotionType) {
		this.promotionType = promotionType;
		return this;
	}

	public Good setKeyword(String keyword) {
		this.keyword = keyword;
		return this;
	}

	public Good setDescribe(String describe) {
		this.describe = describe;
		return this;
	}

	public Good setSortWeight(Integer sortWeight) {
		this.sortWeight = sortWeight;
		return this;
	}
}
