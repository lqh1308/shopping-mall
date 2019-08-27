package com.lqh.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/search")
@Slf4j
public class SearchController {
//        "/category/code/{levelOneCode}/{levelTwoCode}",
//        "/category/code/{levelOneCode}/{levelTwoCode}/levelThreeCode"
//@PathVariable(value = "levelTwoCode", required = false) String l2,
//    @PathVariable(value = "levelThreeCode", required = false) String l3
    @RequestMapping(path = {"/category/code/{levelOneCode}"}, method = RequestMethod.GET)
    public String searchCategoryByCode(@PathVariable("levelOneCode") String l1) {
        log.info("search/category/code l1: {}", l1);
        return "index";
    }
    @RequestMapping(path = {"/category/code/{levelOneCode}/{levelTwoCode}"}, method = RequestMethod.GET)
    public String searchCategoryByCode(@PathVariable("levelOneCode") String l1,
                                       @PathVariable("levelTwoCode") String l2) {
        log.info("search/category/code l1: {}\n l2: {}", l1, l2);
        return "index";
    }
    @RequestMapping(path = {"/category/code/{levelOneCode}/{levelTwoCode}/levelThreeCode"}, method = RequestMethod.GET)
    public String searchCategoryByCode(@PathVariable("levelOneCode") String l1,
                                       @PathVariable("levelTwoCode") String l2,
                                       @PathVariable("levelThreeCode") String l3){
        log.info("search/category/code l1: {}\n l2: {}\nl3: {}", l1, l3);
        return "index";
    }
}
