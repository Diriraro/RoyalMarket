package com.iu.s1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s1.member.MemberVO;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		boolean result = false;
		if(memberVO == null || !memberVO.getMem_id().equals("admin")) {
			response.sendRedirect("/");
		} else if (memberVO.getMem_id().equals("admin")) {
			result = true;
		}
		return result;
	}
}
