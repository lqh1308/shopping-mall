package com.lqh.feign;

import api.service.GoodEsService;
import org.springframework.cloud.openfeign.FeignClient;

@FeignClient("good")
public interface GoodEsServiceFeign extends GoodEsService {
}
