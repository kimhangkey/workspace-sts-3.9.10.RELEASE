package com.kimhangkey.thelimited.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kimhangkey.thelimited.cart.service.CartService;
import com.kimhangkey.thelimited.common.base.BaseController;
import com.kimhangkey.thelimited.goods.service.GoodsService;
import com.kimhangkey.thelimited.goods.vo.GoodsVO;
import com.kimhangkey.thelimited.member.vo.MemberVO;

@Controller("mainController")
public class MainController extends BaseController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = {"/main/main.do", "/"})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("memberInfo");
		
		if(vo != null) {
			String id = vo.getMember_id();
			
			String cartCount = cartService.countCart(id);
			
			session.setAttribute("cartCount", cartCount);
		}
		
		Map goodsMap=goodsService.listGoods();
		mav.addObject("goodsMap", goodsMap);
		
		
		return mav;
	}
	
}
