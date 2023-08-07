package com.kimhangkey.thelimited.mypage.service;

import java.util.List;
import java.util.Map;

import com.kimhangkey.thelimited.member.vo.MemberVO;
import com.kimhangkey.thelimited.order.vo.OrderVO;

public interface MyPageService {

	// 주문목록
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;

	// 주문취소
	public void cancelOrder(String order_id) throws Exception;

	// 반품
	public void returnOrder(String order_id) throws Exception;

	// 교환
	public void exchangeOrder(String order_id) throws Exception;
	
	// 주문목록에서 삭제
	public void deleteOrder(String order_id) throws Exception;

	// 내 정보 수정
	public MemberVO modifyMyInfo(Map memberMap) throws Exception;

	// 회원탈퇴
	public void deleteMember(String member_id) throws Exception;


}
