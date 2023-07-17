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
	   // preHandle 메서드에서 false를 반환하면 해당 요청은 
	   // Interceptor 체인에서 중단되고 컨트롤러에 도달하지 않음.
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
	   
	   // postHandle: false를 반환하면 후속 처리인 뷰 렌더링 및 Response 전송을 중단합니다.
	   // 이는 컨트롤러의 실행 결과에 따라 특정 조건에서만 중단해야 하는 경우에 활용될 수 있습니다.
	   
	   // afterCompletion: false를 반환하면 후속 처리인 Interceptor 체인의 이후 단계인 
	   // afterCompletion 메서드들이 실행되지 않습니다. 
	   // 이는 특정 조건에서만 Interceptor 체인의 완전한 실행을 중단하고자 할 때 사용될 수 있습니다.
	   
	   // 일반적으로 대부분의 경우에는 true를 반환하여 Interceptor 체인의 실행을 계속하도록 함.
	}
