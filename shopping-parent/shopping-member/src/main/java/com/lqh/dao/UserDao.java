package com.lqh.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lqh.entity.User;

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
}
