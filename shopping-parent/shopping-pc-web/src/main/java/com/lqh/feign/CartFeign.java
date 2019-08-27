package com.lqh.feign;

import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.stereotype.Component;

import com.lqh.CartService;

@EnableFeignClients
@Component
public interface CartFeign extends CartService {

}
