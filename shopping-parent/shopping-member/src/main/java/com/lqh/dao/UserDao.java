package com.lqh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Address;
import entity.User;

@Mapper
public interface UserDao {
	@Select("select * from user where id = #{id}")
	public User findUserById(@Param("id") Integer id);
	
	@Insert("insert into user(username, password, phone, email, created, updated) values (#{username}, #{password}, #{phone}, #{email}, #{created}, #{updated})")
	public Integer registUser(User user);
	
	@Select("select * from user where username = #{username} and password = #{password}")
	public User loginIn(@Param("username") String username, @Param("password") String password);
	
	@Select("select * from user where openId = #{openId}")
	public User findUserByOpenId(@Param("openId") String openId);
	
	@Update("update user set openId = #{openId} where id = #{id}")
	public void updateUserOpenId(@Param("openId") String openId, @Param("id") Integer id);
	
	@Insert("insert into receiving_address(userId, username, phone, fixPhone, location, detailAddress, isDefault) "
			+ "values(#{userId}, #{username}, #{phone}, #{fixPhone}, #{location}, #{detailAddress}, #{isDefault})")
	public Integer addAddress(Address address);
	
	@Update("update receiving_address set username = #{username}, phone = #{phone}, fixPhone = #{fixPhone}, location = #{location}, detailAddress = #{detailAddress}, "
			+ "isDefault = #{isDefault} where id = #{id} ")
	public void updateAddress( Address address);
	
	@Delete("delete from receiving_address where id = #{id}")
	public void delAddress(@Param("id") Integer id);
	
	@Select("select * from receiving_address where userId = #{userId}")
	public List<Address> getAddresses(@Param("userId") Integer userId);
	
	@Update("update receiving_address set isDefault = 0 where userId = #{userId}")
	public void setAllUnDefaultAddress(@Param("userId") Integer userId);
	
	@Select("select * from receiving_address where id = #{id}")
	public Address getAddressById(@Param("id") Integer id);
	
	@Update("update user set " + 
			"<when test='username != null'>" + 
			"username=#{username} , " + 
			"</when>" + 
			"<when test='phone != null'>" + 
			"phone=#{phone} , " + 
			"</when>" + 
			"<when test='email != null'>" + 
			"email=#{email} , " + 
			"</when>" + 
			"<when test='avator != null'>" + 
			"avator=#{avator} , " + 
			"</when>" + 
			"<when test='sex != null'>" + 
			"sex=#{sex} , " + 
			"</when>" + 
			"<when test='birth != null'>" + 
			"birth=#{birth} , " + 
			"</when>" + 
			"<when test='realname != null'>" + 
			"realname=#{realname} , " + 
			"</when>" + 
			"<when test='updated != null'>" + 
			"updated=#{updated} " + 
			"</when>" + 
			"where id = #{id}"
			)
	public void updateUserInfo(User user);
}
