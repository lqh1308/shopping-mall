package com.lqh.dao;

import java.util.List;

import entity.Good;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import entity.Banner;

@Mapper
public interface GoodDao {
	
	@Select("select * from banner_wall order by weight asc")
	public List<Banner> getBrandWall();

	@Select("<script>" +
			"select * from good " +
			"<trim prefix='where'>" +
			"<choose> " +
			"<when test='l3!=null'>a.category in (select b.cgy_id from category_info b where b.code=#{l3}) </when>	 " +
			"<when test='l2!=null'>floor(a.category/10000) in (select b.cgy_id from category_info b where b.code=#{l2}) </when> " +
			"<when test='l1!=null'>floor(a.category/100000000) in (select b.cgy_id from category_info b where b.code=#{l1}) </when> " +
			"</choose>" +
			"</trim>" +
			"</script>")
	List<Good> searchGoodByCategoryCode(String l1, String l2, String l3);
}
