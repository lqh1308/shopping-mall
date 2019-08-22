package com.lqh.feign;

import com.lqh.api.service.CategoryService;
import org.springframework.cloud.netflix.feign.FeignClient;

@FeignClient("category")
public interface CategoryServiceFeign extends CategoryService {
}
