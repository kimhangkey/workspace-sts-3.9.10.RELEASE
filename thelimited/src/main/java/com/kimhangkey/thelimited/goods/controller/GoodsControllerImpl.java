package com.kimhangkey.thelimited.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kimhangkey.thelimited.common.base.BaseController;
import com.kimhangkey.thelimited.goods.service.GoodsService;
import com.kimhangkey.thelimited.goods.vo.GoodsVO;

import net.sf.json.JSONObject;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	//리스트페이지
	@Override
	@RequestMapping(value="menuGoods.do" ,method = RequestMethod.GET)
	public ModelAndView menuGoods(String menuGoods, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		System.out.println(menuGoods);
		List<GoodsVO> goodsList=goodsService.menuGoods(menuGoods);
		ModelAndView mav = new ModelAndView(viewName);
		//추출한 데이터와 카테고리명을 매핑하여 return.
		mav.addObject("goodsList", goodsList);
		mav.addObject("menuGoods", menuGoods);
		return mav;
	}
	

//	//추천키워드
//	@RequestMapping(value="/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
//	public @ResponseBody String  keywordSearch(@RequestParam("keyword") String keyword,
//			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
//		response.setContentType("text/html;charset=utf-8");
//		response.setCharacterEncoding("utf-8");
//		
//		//keyword가 null인경우는 아무것도 return하지않는다.
//		if(keyword == null || keyword.equals(""))
//		   return null ;
//	
//		//대소문자를 구분하지않고 검색하도록 한다.
//		keyword = keyword.toUpperCase();
//	    List<String> keywordList =goodsService.keywordSearch(keyword);
//	    
//	    //결과값 산출
//		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("keyword", keywordList);
//	    String jsonInfo = jsonObject.toString();
//	    
//	    //변환한 string jsonObject, jsonInfo 리턴
//	    return jsonInfo ;
//	}
	
	
	//검색
	@RequestMapping(value="/searchGoods.do" ,method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam String searchWord, String goods_sort,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		
		searchMap.put("goods_sort", goods_sort);
		searchMap.put("searchWord", searchWord);
		
		
		List<GoodsVO> goodsList=goodsService.searchGoods(searchMap);
		ModelAndView mav = new ModelAndView("/goods/menuGoods");
		mav.addObject("goodsList", goodsList);
		mav.addObject("menuGoods", "검색 단어  : " + searchWord);
		
		return mav;
	}
	
	
	//상품상세
	@RequestMapping(value="/goodsDetail.do" ,method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		//goods_id값에 맞는 상세정보 가져와 goodsMap 할당
		Map goodsMap=goodsService.goodsDetail(goods_id);
		mav.addObject("goodsMap", goodsMap);
		
		//뷰 + 상품상세 정보 리턴
		return mav;
	}
}
