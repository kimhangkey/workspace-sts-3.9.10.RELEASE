package com.kimhangkey.thelimited.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kimhangkey.thelimited.common.base.BaseController;
import com.kimhangkey.thelimited.member.vo.MemberVO;
import com.kimhangkey.thelimited.mypage.service.MyPageService;

@Controller("myPageController")
@RequestMapping("/mypage")
public class MypageControllerImpl extends BaseController  implements MypageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberVO memberVO;
	
	
	//내 정보 수정
	@Override
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(
			@RequestParam("member_pw")  String member_pw,
			@RequestParam("hp1")  String hp1,
			@RequestParam("zipcode")  String zipcode,
			@RequestParam("member_address")  String member_address,
			@RequestParam("subaddress")  String subaddress,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String  member_id=memberVO.getMember_id();
		
		//받아온 정보 memberMap에 put
		memberMap.put("member_pw",member_pw);
		memberMap.put("hp1",hp1);
		memberMap.put("zipcode",zipcode);
		memberMap.put("member_address",member_address);
		memberMap.put("subaddress",subaddress);
		memberMap.put("member_id", member_id);
		
		//memberMap을 가지고 db수정
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		
		//완료후 message mod_success 리턴
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	//회원탈퇴
	@Override
	@RequestMapping(value="/deleteMember.do" ,method = RequestMethod.POST)
	public ResponseEntity deleteMember(@RequestParam("member_id")  String member_id, HttpServletRequest request, HttpServletResponse response)  throws Exception{
		
		//@RequestParam받은 member_id를 db에서 삭제
		myPageService.deleteMember(member_id);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		
		//완료 후  message delete_success 리턴
		message  = "delete_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}
