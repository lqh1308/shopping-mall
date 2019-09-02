package com.lqh.feign;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Component;

import api.service.CartService;

@FeignClient("cart")
@Component
public interface CartServiceFeign extends CartService{

}
