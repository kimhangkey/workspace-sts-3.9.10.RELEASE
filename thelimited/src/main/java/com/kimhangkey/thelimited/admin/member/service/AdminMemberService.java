package com.kimhangkey.thelimited.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kimhangkey.thelimited.member.vo.MemberVO;

public interface AdminMemberService {

	// 회원관리
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception;

}
