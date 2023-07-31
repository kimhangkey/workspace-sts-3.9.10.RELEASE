package com.kimhangkey.thelimited.mypage.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.kimhangkey.thelimited.member.vo.MemberVO;

public interface MyPageDAO {
	
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	
	public void deleteMember(String member_id) throws DataAccessException;
}
