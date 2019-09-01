package com.lqh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Order;

@Mapper
public interface OrderDao {
 
    @Update("update _order set isPay=#{isPay} ,payId=#{aliPayId}, state=#{state} where orderId=#{orderNumber} ")
    public int updateOrder(@Param("isPay") Integer isPay, @Param("aliPayId") String aliPayId, 
    		@Param("orderNumber") String orderNumber, @Param("state") Integer state);
    
    @Insert("insert into _order(orderId, userId, isPay, addressId, payType, distributeMode, remarks) "
    		+ "values(#{orderId}, #{userId}, #{isPay}, #{addressId}, #{payType}, #{distributeMode}, #{remarks} )")
    @Options(useGeneratedKeys=true, keyProperty="id")
    public Integer createOrder(Order order);
    
    @Select("select * from _order where orderId = #{orderId}")
    public Order getOrderByOrderId(@Param("orderId") String orderId);
    
    @Select({"<script>select * from _order where userId = #{userId} ",
    		"<when test='state != null'>",
    		"and state = #{state}",
    		"</when> order by updated desc ",
    		"<when test='start != null and pageSize != null'>",
    		"limit #{start}, #{pageSize}",
    		"</when></script>"
    		})
    public List<Order> getOrderByState(@Param("state") Integer state, @Param("userId") String userId, @Param("start") Integer start, @Param("pageSize") Integer pageSize);
    
    @Update("update _order set state = #{state} where orderId=#{orderId})")
    public void upateOrderState(@Param("state") Integer state, @Param("orderId") String orderId);
}