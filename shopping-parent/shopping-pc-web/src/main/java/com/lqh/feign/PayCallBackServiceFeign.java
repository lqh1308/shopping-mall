package com.lqh.feign;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Component;

import api.service.PayCallBackService;

@FeignClient("pay")
@Component
public interface PayCallBackServiceFeign extends PayCallBackService{

}
