package com.bogus.bogusgram.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class PermissionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		// /user/signin/view
		String uri = request.getRequestURI();
		
		// 로그인이 되었을때
		if(userId != null) {	
			
			// 회원 가입, 로그인 페이지 접근하려고 하면
			// /user 로 시작하는 페이지에 접근하려고 하면
			if(uri.startsWith("/user")) {
				
				// 리스트 페이지로 이동시켜라
				// 리다이렉트
				response.sendRedirect("/post/mainpage/view");
				return false;
			}
			
		// 로그인이 안되었을때
		} else {
			
			// 리스트, 글쓰기, 상세화면 페이지로 접근하려고 하면
			if(uri.startsWith("/post")) {
				
				// 로그인 페이지로 이동해라
				response.sendRedirect("/user/signin/view");
				return false;
			}
		}
		
		return true;
		
	}
	
	
}
