package com.lqh.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;

import api.service.OrderGoodService;

@FeignClient("good")
@Component
public interface OrderGoodServiceFeign extends OrderGoodService{

}
