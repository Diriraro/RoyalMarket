package com.iu.s1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s1.member.MemberVO;
import com.iu.s1.product.ProductService;
import com.iu.s1.product.ProductVO;

@Component
public class ProductPayInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private ProductService productService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		long sell_num = Long.parseLong(request.getParameter("sell_name"));
		ProductVO productVO = productService.productSelect(sell_num);
		boolean check =false;
		
		if(memberVO!=null) {
			if(productVO.getSell_status()==0) {				
				check=true;
			}else {
				request.setAttribute("result", "현재 구매가능한 상품이 아닙니다.");
				request.setAttribute("path", "../");
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
				view.forward(request, response);
			}
		}else {
			request.setAttribute("result", "로그인 후 이용해 주세요.");
			request.setAttribute("path", "../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		return check;
	}

}
