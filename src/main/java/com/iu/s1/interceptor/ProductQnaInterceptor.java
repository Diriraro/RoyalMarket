//package com.iu.s1.interceptor;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//
//import com.iu.s1.member.MemberVO;
//import com.iu.s1.product.qna.ProductQnaMapper;
//import com.iu.s1.product.qna.ProductQnaVO;
//
//
//@Component
//public class ProductQnaInterceptor extends HandlerInterceptorAdapter {
//	
//	@Autowired
//	private ProductQnaMapper productQnaMapper;
//
//	
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse  response, Object handler ) throws Exception{
//		
//		String header = request.getHeader("AJAX");
//        if ("true".equals(header)){
//		
//		boolean check = false;
//		
//		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
//		ProductQnaVO productQnaVO = new ProductQnaVO();
//		
//		long pq_num = Long.parseLong(request.getParameter("pq_num"));
//		productQnaVO=productQnaMapper.qnaSelectOne(pq_num);
//
//		if(productQnaVO.getPq_storeNum()==memberVO.getMem_storeNum()) {
//			System.out.println("asd");
//			check = true;
//			
//		}else {
//			System.out.println("asd");
//			 request.setAttribute("result", "권한이 없음"); 
//			 request.setAttribute("path","../");
//			 RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
//			 view.forward(request, response);
//		}
//		return check;
//        }else{
//	         return false;
//	        }
//	}
//
//
//}
