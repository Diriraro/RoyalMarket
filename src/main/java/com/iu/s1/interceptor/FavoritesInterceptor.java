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
		boolean check1 = false;
		long session = memberVO.getMem_storeNum();
		// shop/favorites
		// session 번호가 상점번호와 일치하지 않을때
		if (session != mem_storeNum) {
			check1 = false;
			request.setAttribute("result", "내것만 볼수 있어요.");
			request.setAttribute("path", "../shop/myshop/?mem_storeNum=" + session);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		if (session == mem_storeNum) {
			check1 = true;
		}
		return check1;
	}
}
