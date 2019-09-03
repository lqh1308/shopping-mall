package com.lqh.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;

import api.service.OrderGoodService;

@Component
@FeignClient("good")
public interface OrderGoodServiceFeign extends OrderGoodService{

}
