package com.kimhangkey.thelimited.mypage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kimhangkey.thelimited.member.vo.MemberVO;
import com.kimhangkey.thelimited.mypage.dao.MyPageDAO;

@Service("myPageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;

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
