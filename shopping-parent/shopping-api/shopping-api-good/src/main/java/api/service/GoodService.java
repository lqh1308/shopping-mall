package api.service;

import org.springframework.http.MediaType;
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

	@RequestMapping("/searchByCategoryId")
    ResponseBase searchByCategoryId(@RequestParam("offset") Integer offset,
									@RequestParam("count") Integer count,
									@RequestParam("id1") Long c1,
									@RequestParam("id2") Long c2,
									@RequestParam("id3") Long c3);
	@RequestMapping("/searchByCategoryTitle")
	ResponseBase searchByCategoryTitle(@RequestParam("offset") Integer offset,
									   @RequestParam("count") Integer count,
									   @RequestParam("t1") String t1,
									   @RequestParam("t2") String t2,
									   @RequestParam("t3") String t3);

	@RequestMapping(value = "/searchById",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    ResponseBase searchById(@RequestParam("id") Long id);

}
