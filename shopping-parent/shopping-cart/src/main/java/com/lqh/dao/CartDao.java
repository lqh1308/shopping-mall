package com.lqh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import entity.Cart;
import entity.Good;

@Mapper
@Component
public interface CartDao {
	
	@Insert("insert into cart(userId, goodId, purchaseNum, purchasePrice, isCollected) values "
			+ "(#{userId}, #{goodId}, #{purchaseNum}, #{purchasePrice}, #{isCollected}) ")
	public void insertCart(Cart cart);
	
	@Select("select c.id, c.userId, c.goodId, c.purchaseNum, c.purchasePrice, c.isCollected, g.name as goodName, g.logo as goodLogoUrl " + 
			"from cart c left join good g on c.goodId = g.id where c.userId = #{userId} order by lastUpdateTime ")
	public List<Cart> getCartsByUserId(String userId);
	
	@Select({"<script> select c.id, c.userId, c.goodId, c.purchaseNum, c.purchasePrice, g.name as goodName, g.logo as goodLogoUrl ", 
			"from cart c left join good g on c.goodId = g.id ",
			"where c.id in ",
			"<foreach collection='cartIds' item='id' open ='(' separator=',' close=')'> ", 
			"#{id}",
			"</foreach>", 
			"order by lastUpdateTime </script>"})
	public List<Cart> getCartsByCartId(@Param("cartIds") List<Integer> cartIds);

	@Update("update cart set purchaseNum = #{purchaseNum} where id = #{id} ")
	public void updateGoodPurchaseNum(Cart cart);
	
	@Delete({"<script>",
			"delete from cart where id in",
			"<foreach collection='ids' item='id' open='(' separator=',' close=')'>",
			"#{id} ",
			"</foreach> </script>"})
	public void deleteGood(@Param("ids") List<Integer> ids);
	
	@Update("update cart set isCollected = #{isCollected} where id = #{id}")
	public boolean updateCartCollected(Cart cart);
	
	@Insert("insert into collector(userId, goodId) value(#{userId}, #{goodId}) ")
	public Integer addIntoCollector(Cart cart);
	
	@Delete("delete from collector where userId = #{userId} and goodId = #{goodId}")
	public void delFromCollector(Cart cart);
	
	@Select("select c.goodId as id, g.name, g.logo, g.salePrice " + 
			"from collector c left join good g " + 
			"on c.goodId = g.id " + 
			"where userId = #{userId} " + 
			"order by c.createTime desc ")
	public List<Good> getCollectors(String userId);
	
	@Select("select * from cart where goodId = #{goodId}")
	public Cart getCartByGoodId(Integer goodId);
	
	
}
