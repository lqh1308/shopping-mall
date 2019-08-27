package com.lqh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;


import entity.Cart;

@Mapper
@Component
public interface CartDao {
	
	@Select("select c.id, c.userId, c.goodId, c.purchaseNum, c.purchasePrice, c.isCollected, g.name as goodName, g.logo as goodLogoUrl " + 
			"from cart c left join good g on c.goodId = g.id where c.userId = #{userId} order by lastUpdateTime ")
	public List<Cart> getCartsByUserId(String userId);
	
	@Update("update cart set purchaseNum = #{purchaseNum} where id = #{id} ")
	public void updateGoodPurchaseNum(Cart cart);
	
	@Delete("delete from cart where id = #{id} ")
	public void deleteGood(Cart cart);
	
	@Update("update cart set isCollected where id = #{id}")
	public boolean updateCartCollected(Cart cart);
	
	@Insert("insert into collector(userId, goodId) value(#{userId}, #{goodId}) ")
	public Integer addIntoCollector(Cart cart);
}
