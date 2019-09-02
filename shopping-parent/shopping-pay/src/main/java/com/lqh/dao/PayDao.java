package com.lqh.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.PaymentInfo;

@Mapper
public interface PayDao {
	@Select("select * from payment_info where id = #{id}")
	public PaymentInfo getPaymentInfoById(@Param("id") Integer id);
	
	@Insert("insert into payment_info(typeId, orderId, userId, orderTitle, orderDescription, source, state, price) "
			+ "values(#{typeId}, #{orderId}, #{userId}, #{orderTitle}, #{orderDescription}, #{source}, #{state}, #{price})")
	public Integer savePaymentInfo(PaymentInfo paymentInfo);
	
	@Select("select * from payment_info where orderId = #{orderId}")
	public PaymentInfo getPaymentInfoByOrderId(@Param("orderId") String orderId);
	
	@Select("update payment_info set state =#{state},payMessage=#{payMessage},platformorderId=#{platformorderId},updated=#{updated} where orderId=#{orderId}")
	public Integer updatePaymentInfo(PaymentInfo paymentInfo);
	
    @Update("update payment_info set state = #{state} where orderId=#{orderId})")
    public void upateOrderState(@Param("state") Integer state, @Param("orderId") String orderId);
}
