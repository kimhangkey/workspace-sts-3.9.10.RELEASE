package com.kimhangkey.thelimited.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class ViewNameInterceptor extends HandlerInterceptorAdapter {
	
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
			
			//공통 viewName 리턴.
			try {
				String viewName = getViewName(request);
				request.setAttribute("viewName", viewName);
				System.out.println("viewName인터셉터 반환"+ viewName);
			} catch (Exception e) {e.printStackTrace();}
			
			return true;
		}

		//요청 url에서 viewName을 추출하는 메서드, fileName return
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
			
			//파라미터가 있을경우
			if (uri.indexOf(";") != -1) {
				end = uri.indexOf(";");
			} else if (uri.indexOf("?") != -1) {
				end = uri.indexOf("?");
			} else {
				end = uri.length();
			}
			
			//경로안에 파일등이 있을경우
			String fileName = uri.substring(begin, end);
			if (fileName.indexOf(".") != -1) {
				fileName = fileName.substring(0, fileName.lastIndexOf("."));
			}
			if (fileName.lastIndexOf("/") != -1) {
				fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
			}
			
			return fileName;
		}
	
}
