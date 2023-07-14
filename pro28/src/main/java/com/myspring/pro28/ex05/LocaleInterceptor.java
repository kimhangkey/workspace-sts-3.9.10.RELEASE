package com.myspring.pro28.ex05;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

public class LocaleInterceptor extends HandlerInterceptorAdapter {
		
		
	   // preHandle: 요청이 컨트롤러에 도달하기 전에 호출되는 메서드
	   @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
	      HttpSession session=request.getSession();
	      
	      System.out.println("interceptor prehandle 실행");
	      String locale = request.getParameter("locale");
	      System.out.println(locale);
	      if(locale==null) {
	    	  locale="ko";
	      }
	      
	      session.setAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE", new Locale(locale));
	      
	      System.out.println("세션 바인딩 : "+session.getAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE"));
	      
	      return true;
	   }
	   
	   // postHandle: 컨트롤러가 요청을 처리한 후, View에 응답을 보내기 전에 호출되는 메서드
	   //  이 메서드에서는 주로 View에 전달할 데이터를 추가하거나 로그를 남기는 등의 작업을 수행.
	   @Override
	   public void postHandle(HttpServletRequest request, HttpServletResponse response,
	                           Object handler, ModelAndView modelAndView) throws Exception {
	   }
	   
	   
	   // afterCompletion: View의 응답을 전송한 후에 호출되는 메서드
	   //  요청의 전체 처리가 완료된 후에 마무리 작업을 수행. 예외 발생 여부와 상관없이 항상 호출.
	   @Override
	   public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
	                                    Object handler, Exception ex)    throws  Exception {
	   }
	}
