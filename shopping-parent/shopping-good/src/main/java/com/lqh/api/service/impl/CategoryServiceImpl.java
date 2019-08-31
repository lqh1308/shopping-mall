package com.lqh.api.service.impl;

import api.service.CategoryService;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.config.InitCategoryProcesses;
import com.lqh.config.SystemContext;
import com.lqh.config.SystemContextHolder;
import com.lqh.dao.CategoryDao;
import entity.Category;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
@Slf4j
public class CategoryServiceImpl extends BaseApiService implements CategoryService {
	@Autowired
	private CategoryDao dao;

	@Override
	public ResponseBase getCategoryMap() {
		// 从Redis服务器去除 （category和goods合并后没必要放到Redis服务器）
//		Map<Long, List<Category>> map = baseRedisService.getMap(InitCategoryProcesses.CATEGORY_REDIS_KEY);
//		Map<Long, List<Category>> map = SystemContextHolder.getInstance().getContext().getCategoryMap();
		//从SystemContext取出
		TreeMap<Long, List<Category>> result = SystemContextHolder.getInstance().getContext().getCategoryMap();
		// 如果为空则重新查询并放入SystemContext
		if(null == result) {
//			log.info("redis类目缓存没了，重新缓存启动。");
			List<Category> categorys = dao.getAll();
			result = InitCategoryProcesses.coreProcesses(categorys);
//			log.info("所有数据:{}", result);
//    （category和goods合并后没必要放到Redis服务器）
//			baseRedisService.putMap(InitCategoryProcesses.CATEGORY_REDIS_KEY, result);
//			log.info("使用RedisTemplate缓存到Redis服务器，key值为:{}", InitCategoryProcesses.CATEGORY_REDIS_KEY);
			SystemContextHolder.getInstance().getContext().setCategoryMap(result);
		} else {
//			result = new TreeMap<Long, List<Category>>(new Comparator<Long>() {
//				@Override
//				public int compare(Long o1, Long o2) {
//					return o1.compareTo(o2);
//				}
//			});
		}
//		result.putAll(map);
//		return setResponseSuccess(result);
		return setResponseSuccess(result);
	}

	@Override
	public ResponseBase findAllLinksById(@RequestParam("id") final Long id) {
		// 获取SystemContext里面的CategoryMap
		TreeMap<Long, List<Category>> map = SystemContextHolder.getInstance().getContext().getCategoryMap();
		// 这是结果队列，里面从index：0为最上层父节点的title
		List<String> result = new ArrayList<>();
		// copy一个id副本
		Long temp = id;
		// 这个作为栈存储最下层子节点，一直压栈，栈顶是高层节点
		LinkedList<Long> array = new LinkedList<>();
        // 1234 4321 1234
		while(temp > 10000000) {
			// 压栈
			array.push(temp);
            try {
            	// 这个方法返回temp（n位数）的前 n - 4 位数，即temp的父id
                temp = getFatherId(temp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		// 最后这个temp是最高层节点的id，没有压栈。直接处理
		Long topFId = temp;
		// 找到temp的title，存到结果队列里面
		Category topCategory = dao.findCategoryById(topFId);
		result.add(topCategory.getTitle());

		List<Category> list = null;
		// 当栈非空
		while(!array.isEmpty()) {
			// 出栈
            Long fid = array.pop();
            // 获取最高层节点下面的一级节点队列
            List<Category> tList = map.get(topFId);

            if(tList != null) {
				list = tList;
				// 遍历
				for(Category cgy: list) {
					if(fid.equals(cgy.getCgy_id())) {
						topCategory = cgy;
						break;
					}
				}
				// 交换
				topFId = fid;
				result.add(topCategory.getTitle());
			}
        }

		return setResponseSuccess(result);
	}

	public Long getFatherId(Long id) throws Exception {
		if(id < 10000000)
			throw new Exception("id小于8位，没有父节点");
		// 向下转型变成long，忽略小数
		long fid = id / 10000;
		return fid;
	}

}
