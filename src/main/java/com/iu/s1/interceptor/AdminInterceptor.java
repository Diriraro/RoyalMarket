package com.iu.s1.interceptor;

<<<<<<< HEAD
import javax.servlet.RequestDispatcher;
=======
>>>>>>> S_Hwan
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s1.member.MemberVO;

@Component
<<<<<<< HEAD
public class AdminInterceptor extends HandlerInterceptorAdapter{
=======
public class AdminInterceptor extends HandlerInterceptorAdapter {
>>>>>>> S_Hwan
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
<<<<<<< HEAD
		boolean check =false;
		
		if(memberVO!=null && memberVO.getMem_id().equals("admin")) {
			check=true;
		}else {
			request.setAttribute("result", "접근 권한이 없습니다.");
			request.setAttribute("path", "../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		return check;
	
	}

=======
		boolean result = false;
		if(memberVO == null || !memberVO.getMem_id().equals("admin")) {
			response.sendRedirect("/");
		} else if (memberVO.getMem_id().equals("admin")) {
			result = true;
		}
		return result;
	}
>>>>>>> S_Hwan
}
