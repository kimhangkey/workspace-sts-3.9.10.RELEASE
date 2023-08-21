package com.kimhangkey.thelimited.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kimhangkey.thelimited.member.vo.MemberVO;
import com.kimhangkey.thelimited.mypage.dao.MyPageDAO;
import com.kimhangkey.thelimited.order.vo.OrderVO;

@Service("myPageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;

	// 주문목록
	@Override
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception {
		return myPageDAO.selectMyOrderHistoryList(dateMap);
	}

	// 주문취소
	@Override
	public void cancelOrder(String order_id) throws Exception {
		myPageDAO.updateMyOrderCancel(order_id);
	}

	// 반품
	@Override
	public void returnOrder(String order_id) throws Exception {
		myPageDAO.updateMyOrderReturn(order_id);
	}

	// 교환
	@Override
	public void exchangeOrder(String order_id) throws Exception {
		myPageDAO.updateMyOrderExchange(order_id);
	}
	
	// 주문상태 수정 테스트
	@Override
	public void modifyOrder(Map<String, String> orderMap) throws Exception {
		myPageDAO.updateMyOrder(orderMap);
	}
	
	// 주문목록에서 삭제
	@Override
	public void deleteOrder(String order_id) throws Exception {
		myPageDAO.deleteMyOrder(order_id);
	}

	// 내 정보 수정
	@Override
	public MemberVO modifyMyInfo(Map memberMap) throws Exception {
		String member_id = (String) memberMap.get("member_id");
		myPageDAO.updateMyInfo(memberMap);
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	// 회원탈퇴
	@Override
	public void deleteMember(String member_id) throws Exception {
		myPageDAO.deleteMember(member_id);
	}
}
