package com.myspring.pro30.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.pro30.member.vo.MemberVO;



public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public void addMember(MemberVO memberVO) throws DataAccessException;
	 public void removeMember(String id) throws DataAccessException;
	 public void modMember(MemberVO memberVO) throws DataAccessException;
	 public MemberVO selectMemberById(String id) throws DataAccessException;
	 public List searchMember(MemberVO memberVO) throws	DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws DataAccessException;
	 
}
