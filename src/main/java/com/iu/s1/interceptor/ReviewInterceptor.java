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
import com.iu.s1.shop.review.StoreReviewService;

@Component
public class ReviewInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private StoreReviewService storeReviewService;
	@Autowired
	private PaymentService paymentService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		boolean check1 = false;
		// /shop/rei 리뷰작성
		if (memberVO != null) {
			List<Buy_HistoryVO> ar = paymentService.buy_hisSelect(memberVO.getMem_id());
			for (Buy_HistoryVO buy_HistoryVO : ar) {
				// 구매내역 번호, 구매완료 = status = 2 일때 리뷰작성
				if (buy_HistoryVO.getSell_num() == sell_num && buy_HistoryVO.getStatus() == 2L) {
					long num_check = storeReviewService.recheck2(sell_num);
					if (num_check == 0) {
						check1 = true;
					}
				}
			}
			if (check1 == false) {
				request.setAttribute("result", "잘못된 접근입니다.");
				request.setAttribute("path", "../");
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
				view.forward(request, response);
			}
		}
		return check1;
	}
}
