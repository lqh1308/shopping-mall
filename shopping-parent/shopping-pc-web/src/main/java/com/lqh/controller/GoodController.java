package com.lqh.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.GoodServiceFeign;

import entity.Banner;

@RestController
public class GoodController {
	
	@Autowired
	private GoodServiceFeign goodServiceFeign;
	
	@RequestMapping("/getBrandWall")
	public List<Banner> getBrandWall() {
		//获取背景墙
		ResponseBase responseBase = goodServiceFeign.getBrandWall();
		if(!responseBase.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
			//获取失败
			return null;
		}
		@SuppressWarnings("rawtypes")
		LinkedHashMap map = (LinkedHashMap) responseBase.getData();
		@SuppressWarnings("unchecked")
		List<Banner> banners = (List<Banner>) map.get("banners");
		
		return banners;
	}
	
}
