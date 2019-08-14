package com.lqh.feign;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Component;

import com.lqh.api.service.OrderService;

@FeignClient("order")
@Component
public interface OrderServiceFeign extends OrderService{
	
}
