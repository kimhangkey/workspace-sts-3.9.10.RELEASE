package com.kimhangkey.thelimited.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kimhangkey.thelimited.member.vo.MemberVO;

public interface MemberController {
	
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
