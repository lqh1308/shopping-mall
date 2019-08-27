package api.service;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lqh.base.ResponseBase;

@RequestMapping("/good")
public interface GoodService {
	//获取推荐展示墙
	@RequestMapping("/getBrandWall")
	public ResponseBase getBrandWall();
	
	@RequestMapping("/getBrand")
	public ResponseBase getBrand(@RequestParam("num") Integer num, @RequestParam("topCategory") String topCategory);
	
	@RequestMapping("/getGood")
	public ResponseBase getGood(@RequestParam("num") Integer num, @RequestParam("topCategory") String topCategory);
	
	
}
