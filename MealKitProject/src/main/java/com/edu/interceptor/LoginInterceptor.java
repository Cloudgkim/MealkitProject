package com.edu.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@SuppressWarnings("deprecation")
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	throws Exception{
		
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("member");
		
		if(obj == null) {
			// 로그인이 안되어 있는 상태이므로 로그인 페이지로 다시 돌려 보낸다(redirect)
			response.sendRedirect("/mealkit/login");
			
			
			return false;	// 더 이상 컨트롤러의 요청으로 가지 않도록 false로 반환한다.
		}
		
		return true;
	}
}
