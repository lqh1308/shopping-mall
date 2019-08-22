package com.lqh.api.service.impl;

import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.config.InitCategoryProcesses;
import com.lqh.dao.CategoryDao;
import com.lqh.api.service.CategoryService;
import com.lqh.entity.Category;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
@Slf4j
public class CategoryServiceImpl extends BaseApiService implements CategoryService{
	@Autowired
	private CategoryDao dao;

	@Override
	public ResponseBase getCategoryMap() {
		Map<Integer, List<Category>> map = baseRedisService.getMap(InitCategoryProcesses.CATEGORY_REDIS_KEY);
		TreeMap<Integer, List<Category>> result = null;
		if(null == map) {
			log.info("redis类目缓存没了，重新缓存启动。");
			List<Category> categorys = dao.getAll();
			result = InitCategoryProcesses.coreProcesses(categorys);
			log.info("所有数据:{}", result);
			baseRedisService.putMap(InitCategoryProcesses.CATEGORY_REDIS_KEY, result);
			log.info("使用RedisTemplate缓存到Redis服务器，key值为:{}", InitCategoryProcesses.CATEGORY_REDIS_KEY);
		} else {
			result = new TreeMap<Integer, List<Category>>(new Comparator<Integer>() {
				@Override
				public int compare(Integer o1, Integer o2) {
					return o1 - o2;
				}
			});
		}
		result.putAll(map);
		return setResponseSuccess(result);
	}

}
