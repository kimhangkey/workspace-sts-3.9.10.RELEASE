package com.myspring.pro29.ex02;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//@RestController는 @Controller와 @ResponseBody 애노테이션을 합친 것으로, 
//컨트롤러의 모든 메서드에 @ResponseBody가 자동으로 적용된 상태입니다. 

// 즉 @RestController을 사용하면 각 메서드에는  @ResponseBody가 자동으로 적용.
@Controller
public class ResController {
	
	@RequestMapping("/res1")
	@ResponseBody
	public Map<String, Object> res1() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "hong");
		map.put("name", "홍길동");
		return map;
	}
	
	
	@RequestMapping(value = "/res2")
	public ModelAndView res2() {
		return new ModelAndView("home");
	}
	
}

