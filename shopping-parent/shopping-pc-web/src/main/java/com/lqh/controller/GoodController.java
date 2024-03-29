package com.lqh.controller;

import java.util.LinkedHashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lqh.base.BaseApiService;
import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.GoodServiceFeign;
import entity.Banner;

@Controller
public class GoodController extends BaseApiService {
	
	@Autowired
	private GoodServiceFeign goodServiceFeign;
	
	@RequestMapping("/getBrandWall")
	@ResponseBody
	public ResponseBase getBrandWall() {
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
		
		return setResponseSuccess(banners);
	}

	@RequestMapping("/good/toAddGoodPage")
	public String toAddGoodPage() {
		return "goods/addGoods";
	}
	
}
