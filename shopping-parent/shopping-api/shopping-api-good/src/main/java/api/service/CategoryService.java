package api.service;

import com.lqh.base.ResponseBase;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/category")
public interface CategoryService {
    @RequestMapping(value = "/getCategoryMap", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    ResponseBase getCategoryMap();

    @RequestMapping(value = "/findAllLinksById")
    ResponseBase findAllLinksById(@RequestParam("id") Long id);
}
