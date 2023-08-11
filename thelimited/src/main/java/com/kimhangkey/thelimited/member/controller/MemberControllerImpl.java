package com.kimhangkey.thelimited.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kimhangkey.thelimited.cart.service.CartService;
import com.kimhangkey.thelimited.common.base.BaseController;
import com.kimhangkey.thelimited.member.service.MemberService;
import com.kimhangkey.thelimited.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value = "/member")
public class MemberControllerImpl extends BaseController implements MemberController {

	@Autowired
	private MemberVO memberVO;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;

	// 로그인
	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);
		HttpSession session = request.getSession();
		
		String action = (String) session.getAttribute("action");
		

		// memberVO가 존재할 경우
		if (memberVO != null && memberVO.getMember_id() != null) {
			
			// 로그인 여부 isLogOn와 회원정보 memberInfo를 세션에 저장한다.
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);
			
			// 카트개수 바인딩
			String id = memberVO.getMember_id();
			String cartCount = cartService.countCart(id);
			session.setAttribute("cartCount", cartCount);
			
			if(action != null && action.equals("/order/orderEachGoods.do")) {
				mav.setViewName("forward:"+action);
			} else {
				// 메인페이지로 이동.
				mav.setViewName("redirect:/main/main.do");
			}

		} else { // memberVO가 존재하지않을 경우 message를 담아 return + login페이지로 이동
			String message = "아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}

	// 로그아웃
	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		// 세션 설정 초기화 및 메인페이지 이동.
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		session.removeAttribute("cartCount");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	// 회원가입
	@Override
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String id = vo.getMember_id();
		String pw = vo.getMember_pw();

		System.out.println(id + pw);

		try {
			// 회원가입을 try, addMember 성공시 안내문구와 함께 login페이지로 이동한다.
			memberService.addMember(vo);
			request.setAttribute("member_id", id);
			request.setAttribute("member_pw", pw);
			message = "<script>";
			message += " alert('THE LIMITED에 오신 걸 환영합니다!');";
			message += " location.href='" + request.getContextPath() + "/member/loginForm.do?id=" + id + "';";
			message += " </script>";

		} catch (Exception e) {
			// 오류발생시, 회원가입페이지로 재이동
			message = "<script>";
			message += " location.href='" + request.getContextPath() + "/member/memberForm.do';";
			message += " </script>";
			e.printStackTrace();
		}

		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);

		// 각 케이스에 따른 위 설정값 return
		return resEntity;

	}

	// 아이디 중복확인
	@Override
	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ResponseEntity resEntity = null;

		// overlapped의 결과를 매핑해 return 한다.
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

}
