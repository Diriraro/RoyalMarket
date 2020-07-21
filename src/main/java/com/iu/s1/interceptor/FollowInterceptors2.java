package com.iu.s1.interceptor;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s1.member.MemberVO;
import com.iu.s1.shop.follow.StoreFollowService;
import com.iu.s1.shop.follow.StoreFollowVO;

@Component
public class FollowInterceptors2 extends HandlerInterceptorAdapter {


	@Autowired
	private StoreFollowService storeFollowService;
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		// delete follw
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		long follow_Num = Long.parseLong(request.getParameter("follow_Num"));
		long mem_storeNum = Long.parseLong(request.getParameter("mem_storeNum"));
		boolean check1 = false; // false 팅김
		long session = memberVO.getMem_storeNum();
		
		// 쿼리문 /setDeleteFollow?follow_Num=239&mem_storeNum=2
		
//		 1 followNum 파라미터 받아 저장 
//		 2 followNum 검색하는 쿼리로 mem_storeNum session 번호 집어넣어서 출력
//		 3  파라미터 followNum == storeFollowService.selectnum(session, mem_storeNum) 검색 결과 일치하면 지우기
		StoreFollowVO storeFollowVO = new StoreFollowVO();
		storeFollowVO = storeFollowService.selectnum(session, mem_storeNum);
			if (follow_Num != storeFollowVO.getFollow_Num()) {
						request.setAttribute("result", "잘못된 접근입니다.");
						request.setAttribute("path", "../");
						RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
						view.forward(request, response);			
						check1 = false;
				}
				if (follow_Num == storeFollowVO.getFollow_Num()) {
					check1 = true;			
				}
				System.out.println(check1);
				return check1;

	}
}
