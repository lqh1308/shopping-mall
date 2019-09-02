package com.lqh.controller;

import com.alibaba.fastjson.JSONObject;
import com.lqh.base.ResponseBase;
import com.lqh.feign.CategoryServiceFeign;
import com.lqh.feign.GoodServiceFeign;
import entity.Good;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/search")
@Slf4j
public class SearchController {
    private static final String YOUR_LIKE = "yourlike";
    private static final String GOOD = "good";
    @Autowired
    private GoodServiceFeign goodService;
    @Autowired
    private CategoryServiceFeign categoryService;

    // 默认分页查询每页20
    private static final Integer PAGE_COUNT = 20;

    @RequestMapping(path = {"/category/title/{levelOneTitle}"})
    public String searchGoodByCategoryTitle(HttpServletRequest request,
                                            @PathVariable("levelOneTitle") String t1,
                                            @RequestParam(value = "code1", required = false) Long c1) {
        ResponseBase resp = null;
        if(c1 == null)
            resp = goodService.searchByCategoryTitle(0, PAGE_COUNT, t1, null, null);
        else
            resp = goodService.searchByCategoryId(0, PAGE_COUNT, c1, null, null);
        List<Good> goods = (List<Good>) resp.getData();
        // 把商品队列传到页面
        request.setAttribute("goods", goods);
        // 设置面包屑导航
        setNavRightWithCategoryAndGood(request, t1);
        return YOUR_LIKE;
    }
    @RequestMapping(path = {"/category/title/{levelOneTitle}/{levelTwoTitle}"})
    public String searchGoodByCategoryTitle(HttpServletRequest request,
                                           @PathVariable("levelOneTitle") String t1,
                                           @PathVariable("levelTwoTitle") String t2,
                                            @RequestParam(value = "code1", required = false) Long c1,
                                            @RequestParam(value = "code2", required = false) Long c2) {
        ResponseBase resp = null;
        if(c1 == null)
            resp = goodService.searchByCategoryTitle(0, PAGE_COUNT, t1, t2, null);
        else
            resp = goodService.searchByCategoryId(0, PAGE_COUNT, c1, c2, null);
        List<Good> goods = (List<Good>) resp.getData();
        request.setAttribute("goods", goods);
        setNavRightWithCategoryAndGood(request, t1, t2);
        return YOUR_LIKE;
    }
    @RequestMapping(path = {"/category/title/{levelOneTitle}/{levelTwoTitle}/{levelThreeTitle}"})
    public String searchGoodByCategoryTitle(HttpServletRequest request,
                                           @PathVariable("levelOneTitle") String t1,
                                           @PathVariable("levelTwoTitle") String t2,
                                           @PathVariable("levelThreeTitle") String t3,
                                            @RequestParam(value = "code1", required = false) Long c1,
                                            @RequestParam(value = "code2", required = false) Long c2,
                                            @RequestParam(value = "code3", required = false) Long c3){
        ResponseBase resp = null;
        if(c1 == null)
            resp = goodService.searchByCategoryTitle(0, PAGE_COUNT, t1, t2, t3);
        else
            resp = goodService.searchByCategoryId(0, PAGE_COUNT, c1, c2, c3);
        List<Good> goods = (List<Good>) resp.getData();
        request.setAttribute("goods", goods);
        setNavRightWithCategoryAndGood(request, t1, t2, t3);
        return YOUR_LIKE;
    }

    @RequestMapping(path= "/good/id/{id}")
    public String toGoodDetailPage(HttpServletRequest request,
                                   @PathVariable(value = "id") Long id) {
        ResponseBase resp = goodService.searchById(id);
        List<Good> goods = (List<Good>) resp.getData();
        Good good = null;
        if(goods.isEmpty()) {
            good = new Good();
            good.setName("error");
        } else {
            // 一定要这样转成json再转回bean才能类型转换，，暂时不懂。。
            // 更新一下：在Spring Cloud Feign返回的是LinkedHashMap，不是List，所以如果直接转型会报类型转换错误。。这一个坑记录一下。
            goods = JSONObject.parseArray(JSONObject.toJSONString(goods), Good.class);
            good = goods.get(0);
        }
        request.setAttribute("good", good);
        setNavRightWithCategoryAndGood(request, Long.parseLong(good.getCategory()), good);
        return GOOD;
    }

    private void setNavRightWithCategoryAndGood(HttpServletRequest request, Nav... navs) {
        log.info("nav Right: {}", navs);
        List<Nav> list = new ArrayList<>(navs.length);
        for(Nav nav: navs) {
            list.add(nav);
        }
        log.info(JSONObject.toJSONString(list));
        request.setAttribute("navRightList", JSONObject.toJSONString(list));
    }

    /**
     * 接受各级title生成面包屑导航
     * @param request
     * @param titles 各级title字符串
     */
    private void setNavRightWithCategoryAndGood(HttpServletRequest request, String... titles) {
        Nav[] navs = new Nav[titles.length];
        StringBuilder url = new StringBuilder();
        url.append("/search/category/title");
        for(int i = 0; i < titles.length; i++) {
            url.append("/").append(titles[i]);
            navs[i] = new Nav(url.toString(), titles[i]);
        }
        setNavRightWithCategoryAndGood(request, navs);
    }

    /**
     * 根据最后一级类目id以及商品生成面包屑导航的分级
     * @param request
     * @param categoryId
     * @Param good
     */
    private void setNavRightWithCategoryAndGood(HttpServletRequest request, Long categoryId, Good... good) {
        ResponseBase resp = categoryService.findAllLinksById(categoryId);
        List<String> result = (List<String>)resp.getData();
        Nav[] navs = null;
        if(null != good && good.length > 0) {
            navs = new Nav[result.size() + 1];
        } else {
            navs = new Nav[result.size()];
        }
        StringBuilder url = new StringBuilder();
        url.append("/search/category/title");
        for(int i = 0; i < result.size(); i++) {
            url.append("/").append(result.get(i));
            navs[i] = new Nav(url.toString(), result.get(i));
        }
        if(navs.length > result.size()) {
            navs[navs.length - 1] = new Nav("/search/good/id/" + good[0].getId(), good[0].getName());
        }
        setNavRightWithCategoryAndGood(request, navs);
    }

    @Getter
    @Setter
    class Nav {
        private String url;
        private String name;

        Nav(String url, String name) {
            this.url = url;
            this.name = name;
        }
    }
}
