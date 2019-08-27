package com.lqh.dao;

import entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface CategoryDao {
    @Select("select * from category_info order by p_cgy_id, weight")
    public List<Category> getAll();
}