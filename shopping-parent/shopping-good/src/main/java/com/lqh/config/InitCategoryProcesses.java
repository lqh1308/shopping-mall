package com.lqh.config;

import com.lqh.dao.CategoryDao;
import entity.Category;
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

    public void initCategory() throws Exception {
        List<Category> categorys = dao.getAll();
        TreeMap<Long, List<Category>> map = coreProcesses(categorys);
        log.info("所有数据:{}", map);
        putMap(CATEGORY_REDIS_KEY, map);
        log.info("使用RedisTemplate缓存到Redis服务器，key值为:{}", CATEGORY_REDIS_KEY);
    }

    /**
     * 把数据变成Map&lt;int, List&lt;Category&gt;&gt;形式<br>
     *     key是父id，value是这个父id的Category以及拥有的下级Category，
     *     即 <br>Map = { <br>
     *     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;key: 0, <br>
     *     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value: [<br>
     *      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category:{0:父}, <br>
     *      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category:{1:子1}, <br>
     *      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category:{2:子2}<br>
     *      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;....<br>
     *     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;] <br>
     *     &nbsp;&nbsp;&nbsp;&nbsp;}
     * @throws Exception
     */
    public static TreeMap<Long, List<Category>> coreProcesses(List<Category> categorys) {
        TreeMap<Long, List<Category>> map = new TreeMap<>();
        Iterator<Category> i = categorys.iterator();
        while (i.hasNext()) {
            Category temp = i.next();
            //获取当前节点父id
            Long pId = temp.getP_cgy_id();
            if(pId == null)
                continue;
            //获取当前节点id
            Long id = temp.getCgy_id();
            //获取当前节点父id的下级list
            List<Category> list = map.get(pId);
            if (null == list) { // 如果不存在就创建一个
                list = new ArrayList<>();
//                // List index为0是父节点
//                list.add(getCategoryById(categorys, pId));
                // List index>0是子节点
                list.add(temp);
                map.put(pId, list);
            } else {
                list.add(temp);
                map.replace(pId, list);
            }
        }
        return map;
    }

    public static Category getCategoryById(List<Category> categorys, Long id) {
        for(Category c : categorys) {
            if(c.getCgy_id().equals(id))
                return c;
        }
        return null;
    }

    public void putMap(String tableKey, Map map) {
        redisTemplate.opsForHash().putAll(tableKey, map);
    }

    public Map getMap(String tableKey) {
        return redisTemplate.opsForHash().entries(tableKey);
    }
}
