package com.lqh.feign;

import api.service.CategoryService;
import org.springframework.cloud.netflix.feign.FeignClient;

@FeignClient("good")
public interface CategoryServiceFeign extends CategoryService {
}
