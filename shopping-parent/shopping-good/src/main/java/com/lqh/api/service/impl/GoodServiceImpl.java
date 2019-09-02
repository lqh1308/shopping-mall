package com.lqh.api.service.impl;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.dao.GoodDao;

import api.service.GoodService;
import entity.Banner;
import entity.Good;

@RestController
@Slf4j
public class GoodServiceImpl extends BaseApiService implements GoodService{
	
	@Autowired
	private GoodDao goodDao;

	@Override
	public ResponseBase getBrandWall() {
		//获取展示墙
		List<Banner> banners = goodDao.getBrandWall();
		JSONObject obj = new JSONObject();
		obj.put("banners", banners);
		
		return setResponseSuccess(obj);
	}

	@Override
	public ResponseBase getBrand(Integer num, String topCategory) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseBase getGood(Integer num, String topCategory) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseBase getGoodById(@RequestParam("goodId") Integer goodId) {
		Good good = goodDao.getGoodById(goodId);
		return setResponseSuccess(good);
	}

	@Override
	public ResponseBase searchByCategoryId(@RequestParam("offset") Integer offset,
										   @RequestParam("count") Integer count,
										   @RequestParam("id1") Long c1,
										   @RequestParam(value = "id2", required = false) Long c2,
										   @RequestParam(value = "id3", required = false) Long c3) {
//		log.info("c1: {} c2: {} c3: {}", c1, c2, c3);
		return setResponseSuccess(goodDao.searchGoodByCategoryId(c1, c2, c3, offset, count));
	}

	@Override
	public ResponseBase searchByCategoryTitle(@RequestParam("offset") Integer offset,
											  @RequestParam("count") Integer count,
											  @RequestParam("t1") String t1,
											  @RequestParam(value = "t2", required = false) String t2,
											  @RequestParam(value = "t3", required = false) String t3) {
		return setResponseSuccess(goodDao.searchGoodByCategoryTitle(t1, t2, t3, offset, count));
	}

	@Override
	public ResponseBase searchById(@RequestParam("id") Long id) {
		List<Good> goods = goodDao.searchGoodById(id);
		if (goods == null || goods.size() == 0) {
			Good good = new Good();
			good.setName("Error");
			goods.add(good);
		}
		return setResponseSuccess(goods);
	}
}
