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

    @RequestMapping("/findIdByTitle")
    Long findIdByTitle(@RequestParam(value = "t1") String t1,
                       @RequestParam(value = "t2",required = false) String t2,
                       @RequestParam(value = "t3",required = false) String t3);
}
