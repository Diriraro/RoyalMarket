package com.iu.s1.interceptor;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s1.member.MemberVO;

@Component
public class FavoritesInterceptor extends HandlerInterceptorAdapter {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		long mem_storeNum = Long.parseLong(request.getParameter("mem_storeNum"));
		boolean check1 = false; // false 팅김

		long session = memberVO.getMem_storeNum();
		
		System.out.println(session);
		System.out.println(mem_storeNum);
		
		// 아닐떄 
		if (session != mem_storeNum) {
			 check1 = false;
				request.setAttribute("result", "내것만 볼수 있어요.");
				request.setAttribute("path", "../");
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
				view.forward(request, response);			
		}
		if (session == mem_storeNum) {
			check1 = true;			
		}
		System.out.println(check1);
		return check1;

	}
}
