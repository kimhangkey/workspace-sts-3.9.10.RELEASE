package com.kimhangkey.thelimited.common.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public abstract class BaseController {
	
	@RequestMapping(value = "*.do")
	public ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		System.out.println(viewName);
		return mav;
	}
}
