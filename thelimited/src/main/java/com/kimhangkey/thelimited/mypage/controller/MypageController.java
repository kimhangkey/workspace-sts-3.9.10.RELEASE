package com.kimhangkey.thelimited.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MypageController {

	// 주문목록
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

//	// 주문취소
//	public ModelAndView cancelMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
//			HttpServletResponse response) throws Exception;
//
//	// 반품
//	public ModelAndView returnMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
//			HttpServletResponse response) throws Exception;
//
//	// 교환
//	public ModelAndView exchangeMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
//			HttpServletResponse response) throws Exception;

	// 주문목록에서 삭제
	public ModelAndView deleteMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 주문상태 수정 테스트
	public ModelAndView modifyMyOrder(@RequestParam Map<String, String> orderMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 내 정보 수정
	public ResponseEntity modifyMyInfo(@RequestParam Map<String, String> memberMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	// 회원탈퇴
	public ResponseEntity deleteMember(@RequestParam("member_id") String member_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
