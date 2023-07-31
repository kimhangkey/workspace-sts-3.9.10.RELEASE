package com.kimhangkey.thelimited.mypage.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.kimhangkey.thelimited.member.vo.MemberVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	
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
		sqlSession.update("mapper.mypage.deleteMember", member_id);
	}
}
