package com.lqh.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;

import api.service.GoodService;

@FeignClient("good")
@Component
public interface GoodServiceFeign extends GoodService{

}