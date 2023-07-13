package com.myspring.pro27.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.pro27.member.service.MemberService;
import com.myspring.pro27.member.vo.MemberVO;


@Controller("memberController")
@RequestMapping("/member")
public class MemberControllerImpl implements MemberController {
	
	// @Autowired를 이용해 id가 memberService인 빈을 자동 주입(참조/할당).
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberVO memberVO;
	
	
	
	@Override
	@RequestMapping(value = "/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("listMembers메서드");
		String viewName = getViewName(request);
		List membersList = memberService.listMembers();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute MemberVO vo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		memberService.addMember(vo);
		
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam String id, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		memberService.removeMember(id);
		
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/modMember.do", method = RequestMethod.POST)
	public ModelAndView modMember(@ModelAttribute MemberVO vo, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		memberService.modMember(vo);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/searchMember.do", method = RequestMethod.POST)
	public ModelAndView searchMember(@ModelAttribute MemberVO vo, 
			@RequestParam(required = false) String option, String total, String id_email,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		if(option.equals("total")) {
			vo = new MemberVO(total, total, total, total);
		} else if(option.equals("id_email")) {
			vo = new MemberVO(id_email, null, null, id_email);
		}
		
		List list = memberService.searchMember(vo);
		System.out.println(vo.getId());
		ModelAndView mav = new ModelAndView("/member/listMembers");
		mav.addObject("membersList", list);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/*Form.do", method =  RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false) String id) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		if(viewName.equals("/member/modMemberForm")) {
			memberVO = memberService.selectMemberById(id);
			
			mav.addObject("member", memberVO);
		}
		
		return mav;
	}
	
	
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		System.out.println(viewName);
		return viewName;
	}

}
