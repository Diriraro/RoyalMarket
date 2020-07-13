package com.iu.s1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s1.member.MemberVO;

@Component
public class ProductInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		boolean check =false;
		
		if(memberVO!=null) {
			check=true;
		}else {
			request.setAttribute("result", "로그인 후 이용해 주세요.");
			request.setAttribute("path", "../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		return check;
	}

}
