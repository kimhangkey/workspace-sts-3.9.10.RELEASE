package com.kimhangkey.thelimited.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;

public interface MypageController {
	public ResponseEntity deleteMember(@RequestParam("member_id")  String member_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyMyInfo(
			@RequestParam("member_pw")  String member_pw,
			@RequestParam("hp1")  String hp1,
			@RequestParam("zipcode")  String zipcode,
			@RequestParam("member_address")  String member_address,
			@RequestParam("subaddress")  String subaddress,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
