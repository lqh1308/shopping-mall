package com.lqh.feign;

import api.service.CategoryService;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;

@FeignClient("good")
@Component
public interface CategoryServiceFeign extends CategoryService {
}
