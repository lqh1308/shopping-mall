package com.lqh.api.service.impl;

import api.service.GoodEsService;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.dao.GoodDao;
import com.lqh.esdao.GoodEsDao;
import entity.Good;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.client.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Slf4j
@RestController
public class GoodEsServiceImpl extends BaseApiService implements GoodEsService {

    @Autowired
    private GoodEsDao esDao;

    @Autowired
    private GoodDao dao;

    public ResponseBase getGoodByCategory(@RequestParam("categoryId") String categoryId, @RequestParam("page") int page, @RequestParam("size") int size) {
        Page<Good> goods = esDao.findByCategoryIdStartingWith(categoryId, PageRequest.of(page, size));

        return setResponseSuccess(goods.getContent());
    }

    @Override
    public ResponseBase getGoodByKeyword(@RequestParam("keyword") String keyword, @RequestParam("page") int page, @RequestParam("size") int size) {
        Page<Good> goods = esDao.findByCategoryOrNameOrSubNameOrderBySortWeightAsc(keyword, keyword, keyword, PageRequest.of(page, size));
        return setResponseSuccess(goods.getContent());
    }

    @RequestMapping("/get/all")
    public List<Good> getAllGoodInfo() {
        Page<Good> goods = esDao.findAll(PageRequest.of(0, 20));
//        List<Good> list = (List<Good>) esDao.findAll();

        for(Good good : goods.getContent()) {
            System.out.println(good);
        }
        return goods.getContent();
    }
    @RequestMapping("/init")
    public String init() {
        List<Good> daoGoods = dao.findAll();

        Good g1 = new Good().setId(1000)
                .setName("2019 华为 Huawei 最新 M6平板 实惠")
                .setSubName("华为M6")
                .setCategory("手机")
                .setCategoryId("100000010001")
                .setSalePrice(2000)
                .setSortWeight(20)
                .setStock(10);
        Good g2 = new Good().setId(1001)
                .setName("2019 小米巨能写水笔 xiaomi 小米 一支顶6支")
                .setSubName("小米巨能写水笔")
                .setCategory("水笔")
                .setCategoryId("100000010001")
                .setSalePrice(30)
                .setSortWeight(30)
                .setStock(60);
        Good g3 = new Good().setId(1002)
                .setName("蔻驰 COACH 女士黑色牛皮小号斜挎贝壳包 F27591IMBLK")
                .setSubName("蔻驰包")
                .setCategory("斜挎包")
                .setCategoryId("100000010001")
                .setSalePrice(799)
                .setSortWeight(20)
                .setStock(1000);
        Good g4 = new Good().setId(1003)
                .setName("MICHAEL KORS MK女包 MERCER系列女士小号牛皮手提斜挎单肩包 30F6GM9M2L 001 黑色 BLACK")
                .setSubName("蔻驰包")
                .setCategory("斜挎包")
                .setCategoryId("100000010001")
                .setSalePrice(1099)
                .setSortWeight(20)
                .setStock(1000);

        daoGoods.add(g1);
        daoGoods.add(g2);
        daoGoods.add(g3);
        daoGoods.add(g4);

        esDao.deleteAll();
        esDao.saveAll(daoGoods);

        return "OK";
    }

//    @RequestMapping("/{opt}/{index}/{type}/{id}")
//    public Good test(@PathVariable("opt") String opt,
//                     @PathVariable("index") String index,
//                     @PathVariable("type") String type,
//                     @PathVariable("id") Integer id) {
//        log.info("{} /{}/{}/{}", opt, index, type, id);
//        switch(StringUtils.upperCase(opt)) {
//            case "GET":
//                Good g1 = dao.findById(id).get();
//                return g1;
//            case "POST":
//                Good good = new Good();
//                good.setId(id);
//                good.setName("嘿哈！");
//                good.setCategory("一级分类");
//                good.setDescribe("ahisosdiiao积分");
//                good.setSalePrice(80);
//                good.setSubName("小名");
//                good.setOffSheltTime(new Date());
//                Good g2 = dao.save(good);
//                return g2;
//            case "ALL":
////                GetRequest gr = new GetRequest().index("goods").id("1");
////                GetResponse response = client.get(gr);
//                Iterable<Good> list = dao.findAll();
//                Iterator<Good> iterator = list.iterator();
//                for(; iterator.hasNext(); ) {
//                    Good g = iterator.next();
//                    System.out.println(g);
//                }
////            case "DELETE": return dao.findById(id).toString();
//            default:
//                return null;
//        }
//    }
}
