package com.iu.s1.interceptor;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s1.member.MemberVO;
import com.iu.s1.payment.PaymentService;
import com.iu.s1.paymentHistory.Buy_HistoryVO;
import com.iu.s1.paymentHistory.Sell_HistoryVO;

@Component
public class ProductCancelInterceptor extends HandlerInterceptorAdapter{

	
	@Autowired
	private PaymentService paymentService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		String check = request.getParameter("check");
		boolean check1 = false;


		if(check.equals("buy")) {
			
			long sell_num = Long.parseLong(request.getParameter("sell_num"));
			List<Buy_HistoryVO> buy_history = paymentService.buy_hisSelect(memberVO.getMem_id());
		
			if (memberVO != null) {
				for (int i = 0; i < buy_history.size(); i++) {

					System.out.println(buy_history.get(i).getSell_num());
					if (buy_history.get(i).getSell_num() == sell_num) {
						check1 = true;
						System.out.println(check1);
					}
				}

				if (check1 == false) {
					request.setAttribute("result", "잘못된 접근입니다.");
					request.setAttribute("path", "../");
					RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
					view.forward(request, response);

				}
			}
	
		}else {
			long sell_num =Long.parseLong(request.getParameter("sell_num"));		
			List<Sell_HistoryVO> sell_history = paymentService.sell_hisSelect(memberVO.getMem_id());
			
			if(memberVO!=null) {	
				for(int i=0;i<sell_history.size();i++) {
					
					System.out.println(sell_history.get(i).getSell_num());
					if(sell_history.get(i).getSell_num()==sell_num) {
						check1 = true;
			
					}
				}	
			}
			
			if(check1==false) {
				request.setAttribute("result", "잘못된 접근입니다.");
				request.setAttribute("path", "../");
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
				view.forward(request, response);
				
			}
			
		}
		return check1;

	}
}
