package com.lqh.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;

import api.service.PayService;

@FeignClient("pay")
@Component
public interface PayServiceFeign extends PayService {

}
