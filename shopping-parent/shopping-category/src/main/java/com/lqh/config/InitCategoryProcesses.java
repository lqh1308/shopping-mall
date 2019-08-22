package com.lqh.config;

import com.lqh.api.service.CategoryService;
import com.lqh.base.ResponseBase;
import com.lqh.dao.CategoryDao;
import com.lqh.entity.Category;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * 专门初始化所有类目数据到redis服务器缓存着
 */
@Component
@Order(1)
@Slf4j
public class InitCategoryProcesses implements CommandLineRunner {
    public static final String CATEGORY_REDIS_KEY = "ALL_CATEGORY_CACHE";
    @Autowired
    private CategoryDao dao;
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public void run(String... strings) throws Exception {
        log.info("================ 开始 初始化类目数据 ==================");
        try {
            initCategory();
            log.info("================ 结束 初始化类目数据 ==================");
        } catch (Exception e) {
            log.error("================ 初始化类目数据失败！=======================", e);
        }
    }
    /**
     * 把数据变成Map<int, List<Category>>形式，key是父id，value是这个父id拥有的下级Category
     * 所以要找全部等级的
     * @throws Exception
     */
    public void initCategory() throws Exception {
        List<Category> categorys = dao.getAll();
        TreeMap<Integer, List<Category>> map = coreProcesses(categorys);
        log.info("所有数据:{}", map);
        putMap(CATEGORY_REDIS_KEY, map);
        log.info("使用RedisTemplate缓存到Redis服务器，key值为:{}", CATEGORY_REDIS_KEY);
    }

    public static TreeMap<Integer, List<Category>> coreProcesses(List<Category> categorys) {
        TreeMap<Integer, List<Category>> map = new TreeMap<>();
        Iterator<Category> i = categorys.iterator();
        while (i.hasNext()) {
            Category temp = i.next();
            Integer pId = temp.getP_cgy_id();
            List<Category> list = map.get(pId);
            if (null == list) {
                list = new ArrayList<>();
                list.add(temp);
                map.put(pId, list);
            } else {
                list.add(temp);
                map.replace(pId, list);
            }
        }
        return map;
    }

    public void putMap(String tableKey, Map map) {
        redisTemplate.opsForHash().putAll(tableKey, map);
    }

    public Map getMap(String tableKey) {
        return redisTemplate.opsForHash().entries(tableKey);
    }
}
