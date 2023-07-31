package com.kimhangkey.thelimited.mypage.service;

import java.util.Map;

import com.kimhangkey.thelimited.member.vo.MemberVO;

public interface MyPageService {
	
	public MemberVO modifyMyInfo(Map memberMap) throws Exception;
	
	public void deleteMember(String member_id) throws Exception;
	
}
