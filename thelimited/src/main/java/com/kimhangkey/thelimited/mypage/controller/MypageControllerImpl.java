package com.kimhangkey.thelimited.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kimhangkey.thelimited.common.base.BaseController;
import com.kimhangkey.thelimited.member.vo.MemberVO;
import com.kimhangkey.thelimited.mypage.service.MyPageService;
import com.kimhangkey.thelimited.order.vo.OrderVO;

@Controller("myPageController")
@RequestMapping("/mypage")
public class MypageControllerImpl extends BaseController implements MypageController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private MemberVO memberVO;

	// 주문목록
	@Override
	@RequestMapping(value = "/listMyOrderHistory.do", method = RequestMethod.GET)
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		
		// memberInfo의 member_id get
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();

		// 조회기간 fixedSearchPeriod get
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		// 조회 기간 초기화
		String beginDate = null, endDate = null;
		String[] tempDate = calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate = tempDate[0];
		endDate = tempDate[1];

		// 조회기간과 member_id를 dateMap에 put해 조회
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		dateMap.put("member_id", member_id);
		List<OrderVO> myOrderHistList = myPageService.listMyOrderHistory(dateMap);

		// 검색일자를 년,월,일로 분리해서 화면에 전달
		String beginDate1[] = beginDate.split("-");
		String endDate1[] = endDate.split("-");
		mav.addObject("beginYear", beginDate1[0]);
		mav.addObject("beginMonth", beginDate1[1]);
		mav.addObject("beginDay", beginDate1[2]);
		mav.addObject("endYear", endDate1[0]);
		mav.addObject("endMonth", endDate1[1]);
		mav.addObject("endDay", endDate1[2]);
		mav.addObject("myOrderHistList", myOrderHistList);
		return mav;
	}

	
	
	// 주문목록에서 삭제
	@Override
	@RequestMapping(value = "/deleteMyOrder.do", method = RequestMethod.POST)
	public ModelAndView deleteMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		myPageService.deleteOrder(order_id);
		mav.setViewName("redirect:/mypage/listMyOrderHistory.do");
		return mav;
	}
	
	
//	// 주문취소
//	@Override
//	@RequestMapping(value = "/cancelMyOrder.do", method = RequestMethod.POST)
//	public ModelAndView cancelMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		// 주문 id order_id로 주문 취소로 delivery_status 변경 후 cancel_order message 리턴
//		myPageService.cancelOrder(order_id);
//		mav.addObject("message", "cancel_order");
//		mav.setViewName("redirect:/mypage/listMyOrderHistory.do");
//		return mav;
//	}
//	
//	
//	// 반품
//	@Override
//	@RequestMapping(value = "/returnMyOrder.do", method = RequestMethod.POST)
//	public ModelAndView returnMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		// 주문 id order_id로 db삭제 후 returning_goods message 리턴
//		myPageService.returnOrder(order_id);
//		mav.addObject("message", "returning_goods");
//		mav.setViewName("redirect:/mypage/listMyOrderHistory.do");
//		return mav;
//	}
//
//	
//	
//	// 교환
//	@Override
//	@RequestMapping(value = "/exchangeMyOrder.do", method = RequestMethod.POST)
//	public ModelAndView exchangeMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		// 주문 id order_id로 db삭제 후 exchange_goods message 리턴
//		myPageService.exchangeOrder(order_id);
//		mav.addObject("message", "exchange_goods");
//		mav.setViewName("redirect:/mypage/listMyOrderHistory.do");
//		return mav;
//	}
	
	// 주문상태 수정 통합
	@Override
	@RequestMapping(value = "/modifyMyOrder.do", method = RequestMethod.POST)
	public ModelAndView modifyMyOrder(@RequestParam Map<String, String> orderMap,
			HttpServletRequest request,	HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		myPageService.modifyOrder(orderMap);
		mav.setViewName("redirect:/mypage/listMyOrderHistory.do");
		return mav;
	}

	
	
	// 내 정보 수정
	@Override
	@RequestMapping(value = "/modifyMyInfo.do", method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam Map<String, String> memberMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();

		// 세션의 회원id memberMap에 put
		memberMap.put("member_id", member_id);

		// memberMap을 가지고 db수정
		memberVO = (MemberVO) myPageService.modifyMyInfo(memberMap);

		// 수정된 회원 정보를 다시 세션에 저장한다.
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();

		// 완료후 message mod_success 리턴
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	
	
	// 회원탈퇴
	@Override
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
	public ResponseEntity deleteMember(@RequestParam("member_id") String member_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// @RequestParam받은 member_id를 db에서 삭제
		myPageService.deleteMember(member_id);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();

		// 완료 후 message delete_success 리턴
		message = "delete_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}
