package com.lqh.dao;

import java.util.List;

import entity.Good;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import entity.Banner;

@Mapper
public interface GoodDao {
	
	@Select("select * from banner_wall order by weight asc")
	public List<Banner> getBrandWall();

	@Select("<script>" +
			"select * from good a " +
			"<trim prefix='where'>" +
			"<choose> " +
			"<when test='code3!=null'>a.category=#{code3} </when>	 " +
			"<when test='code2!=null'>floor(a.category/10000)=#{code2} </when> " +
			"<when test='code1!=null'>floor(a.category/100000000)=#{code1} </when> " +
			"</choose>" +
			"order by a.sortWeight limit #{offset}, #{count}" +
			"</trim>" +
			"</script>")
	List<Good> searchGoodByCategoryId(@Param("code1") Long code1, @Param("code2") Long code2, @Param("code3") Long code3, @Param("offset") Integer offset, @Param("count") Integer count);

	@Select("<script>" +
			"select * from good a " +
			"<trim prefix='where'>" +
			"<choose> " +
			"<when test='t3!=null'>a.category in (select b.cgy_id from category_info b where b.level=3 and b.title=#{t3}) </when>	 " +
			"<when test='t2!=null'>floor(a.category/10000) in (select b.cgy_id from category_info b where b.level=2 and b.title=#{t2}) </when> " +
			"<when test='t1!=null'>floor(a.category/100000000) in (select b.cgy_id from category_info b where b.level=1 and b.title=#{t1}) </when> " +
			"</choose>" +
			"order by a.sortWeight limit #{offset}, #{count}" +
			"</trim>" +
			"</script>")
    List<Good> searchGoodByCategoryTitle(@Param("t1") String t1, @Param("t2") String t2, @Param("t3") String t3, @Param("offset") Integer offset, @Param("count") Integer count);

	@Select("select * from good a where a.id=#{id}")
    List<Good> searchGoodById(@Param("id") Long id);


	@Select("select * from good where id = #{goodId}")
	public Good getGoodById(Integer goodId);

	@Select("select * from good")
    List<Good> findAll();
}
