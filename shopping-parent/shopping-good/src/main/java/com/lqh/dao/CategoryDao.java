package com.lqh.dao;

import entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CategoryDao {
    @Select("select * from category_info order by p_cgy_id, weight")
    public List<Category> getAll();

    @Select("select * from category_info where cgy_id=#{id}")
    Category findCategoryById(@Param("id") Long topFId);

    @Select("<script>" +
            "select cgy_id from category_info " +
            "where " +
            "<choose>" +
                "<when test='t3!=null'>title=#{t3}</when>" +
                "<otherwise>" +
                    "<choose>" +
                        "<when test='t2!=null'>title=#{t2}</when>" +
                        "<otherwise>" +
                            "<when test='t1!=null'>title=#{t1}</when>" +
                        "</otherwise>" +
                    "</choose>" +
                "</otherwise>" +
            "</choose>" +
            "</script>")
    Long findIdByTitle(@Param("t1") String t1, @Param("t2") String t2, @Param("t3") String t3);
}