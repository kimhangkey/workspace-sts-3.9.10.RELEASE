package com.kimhangkey.thelimited.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kimhangkey.thelimited.cart.service.CartService;
import com.kimhangkey.thelimited.cart.vo.CartVO;
import com.kimhangkey.thelimited.common.base.BaseController;
import com.kimhangkey.thelimited.goods.vo.GoodsVO;
import com.kimhangkey.thelimited.member.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value = "/cart")
public class CartControllerImpl extends BaseController implements CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	

	
	// 쇼핑카트 가져오기
	@Override
	@RequestMapping(value = "/shoppingCart.do", method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();

		// 회원정보에 맞는 쇼핑카트 리스트를 불러온다.
		cartVO.setMember_id(member_id);
		Map<String, List> cartMap = cartService.myCartList(cartVO);
		
		
		// 카트 개수를 갱신한다.(카트목록에서 직접 삭제, 관리자에 의한 상품 삭제 경우 대비)
		String cartCount = cartService.countCart(member_id);
		session.setAttribute("cartCount", cartCount);
		
		session.setAttribute("cartMap", cartMap);
		return mav;
	}

	// 쇼핑카트 추가
	@Override
	@RequestMapping(value = "/addGoodsInCart.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();

		// 회원정보와 추가하고자하는 상품id로 쇼핑카트 중복체크 후 boolean형 isAreadyExisted로 리턴값 저장
		cartVO.setMember_id(member_id);
		cartVO.setGoods_id(goods_id);
		boolean isAreadyExisted = cartService.findCartGoods(cartVO);

		// 중복될경우 already_existed return, 외의 경우 add_success return
		if (isAreadyExisted == true) {
			return "already_existed";
		} else {
			cartService.addGoodsInCart(cartVO);
			String cartCount = cartService.countCart(member_id);
			session.setAttribute("cartCount", cartCount);
			return "add_success";
		}
	}

	// 쇼핑카트 삭제
	@Override
	@RequestMapping(value = "/removeCartGoods.do", method = RequestMethod.POST)
	public ModelAndView removeCartGoods(@RequestParam("cart_id") int cart_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// @RequestParam받은 cart_id 상품을 삭제 후 shoppingCart로 redirect
		cartService.removeCartGoods(cart_id);
		
		mav.setViewName("redirect:/cart/shoppingCart.do");
		return mav;
	}

	// 쇼핑카트 수정
	@Override
	@RequestMapping(value = "/modifyCartQty.do", method = RequestMethod.POST)
	public @ResponseBody String modifyCartQty(@RequestParam("goods_id") int goods_id,
			@RequestParam("cart_goods_qty") int cart_goods_qty, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();

		// member_id의 @RequestParam받은 goods_id와 cart_goods_qty에 수정내용을 반영하고 결과값을 리턴받아
		// result에 저장
		cartVO.setMember_id(member_id);
		cartVO.setGoods_id(goods_id);
		cartVO.setCart_goods_qty(cart_goods_qty);
		boolean result = cartService.modifyCartQty(cartVO);

		// 완료시 modify_success, 외의 경우 modify_failed를 리턴.
		if (result == true) {
			return "modify_success";
		} else {
			return "modify_failed";
		}

	}
}
