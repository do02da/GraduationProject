package com.user.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 로그인하지 않았을 때 글쓰기를 못하게 제한하는 로그인 인터셉터
 * @author	김도영
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		
		// login 처리를 담당하는 사용자 정보를 담고있는 객체를 가져옴
		Object obj = session.getAttribute("login");
		
		if (obj == null) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter pw = response.getWriter();
			
			pw.println("<script>alert('로그인 후 글쓰기가 가능합니다.'); location.href='" + request.getContextPath() + "/board/openBoard.do';</script>");
			 
			pw.flush();

			return false;
		}
		
		return true;
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		 super.postHandle(request, response, handler, modelAndView);
	}
}
