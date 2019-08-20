package com.lqh.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface OrderDao {
 
    @Update("update _order set isPay=#{isPay} ,payId=#{aliPayId} where orderNumber=#{orderNumber};")
    public int updateOrder(@Param("isPay") Integer isPay, @Param("aliPayId") String aliPayId, @Param("orderNumber") String orderNumber);
 
}