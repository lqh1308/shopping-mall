package com.lqh.feign;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Component;

import com.lqh.api.service.PayService;

@FeignClient("pay")
@Component
public interface PayServiceFeign extends PayService{

}
