package com.teamrun.runbike.user.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws IOException {
		HttpSession session = request.getSession(false);
		System.out.println("세션? "+session.getAttribute("loginInfo"));
		if(session!=null && session.getAttribute("loginInfo")!=null) {
			return true;
		}
		
		response.sendRedirect(request.getContextPath());
		System.out.println("인터셉터 동작?");
		
		return false;
	}
}
