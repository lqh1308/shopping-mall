package com.lqh.config;

import entity.Category;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.TreeMap;

@Getter
@Setter
public class SystemContext {
    private TreeMap<Long, List<Category>> categoryMap;
}
