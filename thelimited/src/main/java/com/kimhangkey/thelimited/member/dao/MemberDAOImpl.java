package com.kimhangkey.thelimited.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.kimhangkey.thelimited.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	// 로그인
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException {
		MemberVO member = (MemberVO) sqlSession.selectOne("mapper.member.login", loginMap);
		return member;
	}

	// 회원가입
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException {
		System.out.println(memberVO.getMember_id() + " dao에서 아이디");
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}

	// 아이디 중복확인
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectOverlappedID", id);
		return result;
	}
}
