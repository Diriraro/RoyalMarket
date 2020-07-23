package com.iu.s1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s1.member.MemberVO;

@Component
public class FollowInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		long give_storeNum = Long.parseLong(request.getParameter("give_storeNum"));
		boolean check1 = false;
		long session = memberVO.getMem_storeNum();
		// setinsertFollow
		// session 번호와 followVO.give_storeNum 이 일치하지 않을떄
		if (session != give_storeNum) {
			request.setAttribute("result", "잘못된 접근입니다.");
			request.setAttribute("path", "../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
			check1 = false;
		}
		if (session == give_storeNum) {
			check1 = true;
		}
		System.out.println(check1);
		return check1;

	}
}
