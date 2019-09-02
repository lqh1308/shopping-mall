package com.lqh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import entity.OrderGood;

@Mapper
@Component
public interface OrderGoodDao {
	
	@Insert("insert into order_goods(orderId, goodId, price, num) values(#{orderId}, #{goodId}, #{price}, #{num})")
	public void insertOrderGood(OrderGood orderGood);
	
	@Insert({"<script> insert into order_goods ",
			"(orderId, goodId, price, num) ",
			"values ",
			"<foreach collection='orderGoods' item='orderGood' separator=','> ", 
			"( #{orderGood.orderId}, ", 
			"#{orderGood.goodId}, ", 
			"#{orderGood.price}, ", 
			"#{orderGood.num} )",
			"</foreach>	</script> "})
	public void insertOrderGoods(@Param("orderGoods") List<OrderGood> orderGoods);
	
	@Select("select * from order_goods where orderId = #{orderId}")
	public List<OrderGood> getGoodsByOrderId(@Param("orderId") String orderId);
	
	@Select("select o.goodId, g.name as goodName, g.logo as goodLogo, o.price, o.num " + 
			"from order_goods o left join good g on o.goodId = g.id where orderId = #{orderId}")
	public List<OrderGood> getDetailOrderGoodsByOrderId(@Param("orderId") String orderId);
	
}
