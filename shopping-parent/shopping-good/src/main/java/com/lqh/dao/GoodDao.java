package com.lqh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.lqh.entity.Banner;

@Mapper
public interface GoodDao {
	
	@Select("select * from banner_wall order by weight asc")
	public List<Banner> getBrandWall();
	
}
