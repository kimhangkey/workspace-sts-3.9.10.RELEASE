package com.kimhangkey.thelimited.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kimhangkey.thelimited.common.base.BaseController;
import com.kimhangkey.thelimited.goods.service.GoodsService;
import com.kimhangkey.thelimited.goods.vo.GoodsVO;

@Controller("mainController")
public class MainController extends BaseController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = {"/main/main.do", "/"})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/main");
		
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoods();
		mav.addObject("goodsMap", goodsMap);
		
		return mav;
	}
	
}
