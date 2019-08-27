package com.lqh.api.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.dao.GoodDao;

import api.service.GoodService;
import entity.Banner;

@RestController
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

}
