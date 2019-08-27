package com.lqh.controller;

import com.lqh.base.ResponseBase;
import entity.Category;
import com.lqh.feign.CategoryServiceFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/category", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class CategoryController {
    @Autowired
    private CategoryServiceFeign cgyServFeign;

    @RequestMapping("/getAll")
    public Map<Long, List<Category>> getAll() {
        ResponseBase rb = cgyServFeign.getCategoryMap();

        return (Map<Long, List<Category>>) rb.getData();
    }
}
