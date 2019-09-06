package api.service;

import com.lqh.base.ResponseBase;
import entity.Good;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/esGood")
public interface GoodEsService {
    @RequestMapping("/get/goods/categoryid")
    public ResponseBase getGoodByCategory(@RequestParam("categoryId") String categoryId, @RequestParam("page") int page, @RequestParam("size") int size);

    @RequestMapping("/get/goods/keyword")
    ResponseBase getGoodByKeyword(@RequestParam("keyword") String keyword, @RequestParam("page") int page, @RequestParam("size") int size);
}
