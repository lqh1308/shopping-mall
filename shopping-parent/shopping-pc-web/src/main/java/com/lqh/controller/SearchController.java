package com.lqh.controller;

import com.lqh.base.ResponseBase;
import com.lqh.feign.GoodServiceFeign;
import entity.Good;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/search")
@Slf4j
public class SearchController {
    @Autowired
    private GoodServiceFeign goodService;

    @RequestMapping(path = {"/category/code/{levelOneCode}"}, method = RequestMethod.GET)
    public String searchGoodByCategoryCode(HttpServletRequest request,
                                           @PathVariable("levelOneCode") String l1) {
        log.info("search/category/code l1: {}", l1);
        ResponseBase resp = goodService.searchByCategoryCode(l1, null, null);
        List<Good> goods = (List<Good>) resp.getData();
        request.setAttribute("goods", goods);
        return "hl_test";
    }
    @RequestMapping(path = {"/category/code/{levelOneCode}/{levelTwoCode}"}, method = RequestMethod.GET)
    public String searchGoodByCategoryCode(HttpServletRequest request,
                                           @PathVariable("levelOneCode") String l1,
                                           @PathVariable("levelTwoCode") String l2) {
        log.info("search/category/code l1: {}\n l2: {}", l1, l2);
        ResponseBase resp = goodService.searchByCategoryCode(l1, l2, null);
        List<Good> goods = (List<Good>) resp.getData();
        request.setAttribute("goods", goods);
        return "hl_test";
    }
    @RequestMapping(path = {"/category/code/{levelOneCode}/{levelTwoCode}/levelThreeCode"}, method = RequestMethod.GET)
    public String searchGoodByCategoryCode(HttpServletRequest request,
                                           @PathVariable("levelOneCode") String l1,
                                           @PathVariable("levelTwoCode") String l2,
                                           @PathVariable("levelThreeCode") String l3){
        log.info("search/category/code l1: {}\n l2: {}\nl3: {}", l1, l3);
        ResponseBase resp = goodService.searchByCategoryCode(l1, l2, l3);
        List<Good> goods = (List<Good>) resp.getData();
        request.setAttribute("goods", goods);
        return "hl_test";
    }
}
