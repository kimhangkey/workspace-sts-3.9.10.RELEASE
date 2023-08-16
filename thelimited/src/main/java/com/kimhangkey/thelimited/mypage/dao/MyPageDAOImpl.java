package com.kimhangkey.thelimited.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.kimhangkey.thelimited.member.vo.MemberVO;
import com.kimhangkey.thelimited.order.vo.OrderVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlSession;

	// 주문목록
	@Override
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException {
		List<OrderVO> myOrderHistList = (List) sqlSession.selectList("mapper.mypage.selectMyOrderHistoryList", dateMap);
		return myOrderHistList;
	}

	// 주문취소
	@Override
	public void updateMyOrderCancel(String order_id) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyOrderCancel", order_id);
	}

	// 반품
	@Override
	public void updateMyOrderReturn(String order_id) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyOrderReturn", order_id);
	}

	// 교환
	@Override
	public void updateMyOrderExchange(String order_id) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyOrderExchange", order_id);
	}
	
	// 주문목록에서 삭제
	@Override
	public void deleteMyOrder(String order_id) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deleteMyOrder", order_id);
	}

	// 내정보
	@Override
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException {
		MemberVO memberVO = (MemberVO) sqlSession.selectOne("mapper.mypage.selectMyDetailInfo", member_id);
		return memberVO;

	}

	// 내 정보 수정
	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyInfo", memberMap);
	}

	// 회원탈퇴
	@Override
	public void deleteMember(String member_id) throws DataAccessException {
		
		// 해당 아이디의 쇼핑카트 삭제
		sqlSession.delete("mapper.mypage.deleteCartByMemberId", member_id);
		
		// 해당 아이디의 주문목록 삭제
		sqlSession.delete("mapper.mypage.deleteOrderByMemberId", member_id);
		
		// 회원 목록에서 삭제
		sqlSession.delete("mapper.mypage.deleteMember", member_id);
	}
}
