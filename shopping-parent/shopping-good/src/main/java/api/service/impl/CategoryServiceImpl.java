package api.service.impl;

import api.service.CategoryService;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.config.InitCategoryProcesses;
import com.lqh.dao.CategoryDao;
import entity.Category;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@RestController
@Slf4j
public class CategoryServiceImpl extends BaseApiService implements CategoryService {
	@Autowired
	private CategoryDao dao;

	@Override
	public ResponseBase getCategoryMap() {
		Map<Long, List<Category>> map = baseRedisService.getMap(InitCategoryProcesses.CATEGORY_REDIS_KEY);
		TreeMap<Long, List<Category>> result = null;
		if(null == map) {
			log.info("redis类目缓存没了，重新缓存启动。");
			List<Category> categorys = dao.getAll();
			result = InitCategoryProcesses.coreProcesses(categorys);
			log.info("所有数据:{}", result);
			baseRedisService.putMap(InitCategoryProcesses.CATEGORY_REDIS_KEY, result);
			log.info("使用RedisTemplate缓存到Redis服务器，key值为:{}", InitCategoryProcesses.CATEGORY_REDIS_KEY);
		} else {
			result = new TreeMap<Long, List<Category>>(new Comparator<Long>() {
				@Override
				public int compare(Long o1, Long o2) {
					return o1.compareTo(o2);
				}
			});
		}
		result.putAll(map);
		return setResponseSuccess(result);
	}

}
