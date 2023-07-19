package com.myspring.pro30.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.pro30.member.service.MemberService;
import com.myspring.pro30.member.vo.MemberVO;



@Controller("memberController")
@RequestMapping("/member")
public class MemberControllerImpl implements MemberController {
	
//	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	
	// @Autowired를 이용해 id가 memberService인 빈을 자동 주입(참조/할당).
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberVO memberVO;
	
	
//	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
//	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
//		String viewName = (String)request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		return mav;
//	}
	
	@Override
	@RequestMapping(value = "/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("listMembers메서드12");
		
		String viewName = (String) request.getAttribute("viewName");
		// 인터셉터를 통해 바인딩된 viewName을 가져옴.(Object 타입으로 가져오니 캐스팅 필요)
		
//		logger.info("info 레벨 : viewName = " + viewName);
//		logger.debug("debug 레벨@@@@@@@ : viewName = " + viewName);
		
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
		ModelAndView mav = new ModelAndView("/member/listMembers");
		mav.addObject("membersList", list);
		
		return mav;
	}
	
	
	@RequestMapping("/*Form.do")
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false) String id, String result, String action) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		System.out.println("액션"+action);
//		HttpSession session = request.getSession();
//		session.setAttribute("action", action);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("result", result);
		mav.addObject("action", action);
		
		if(viewName.equals("/member/modMemberForm")) {
			memberVO = memberService.selectMemberById(id);
			
			mav.addObject("member", memberVO);
		}
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, 
			@RequestParam(defaultValue = "/main.do") String action,
			RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("login 메서드 실행");
	ModelAndView mav = new ModelAndView();
	
	memberVO = memberService.login(member);
	
	System.out.println("로그인메서드 액션 : "+ action);
	
	if(memberVO != null) {
			HttpSession session = request.getSession();
		    session.setAttribute("member", memberVO);
		    session.setAttribute("isLogOn", true);
		    mav.setViewName("redirect:"+action);
	}else {
		    rAttr.addAttribute("result","loginFailed");
		    mav.setViewName("redirect:/member/loginForm.do");
	}
	
	return mav;
	}
	// RedirectAttributes rAttr에서, rAttr.addAttribute 하면, 리다이렉트 url에 쿼리파라미터로 바인딩 됨.
	// 즉 , /member/loginForm.do?result=loginFailed 이런 식. 리퀘스트에 바인딩.
	
	
	@Override
	@RequestMapping(value = "/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	

}
