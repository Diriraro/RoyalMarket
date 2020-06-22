package com.iu.s1.payment;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.member.MemberVO;

@Controller
@RequestMapping("/payment/**")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	@GetMapping("pay")
	public ModelAndView pay(long amount) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("amount", amount);
		mv.setViewName("/payment/pay");
		
		return mv;
	}
	
	@GetMapping("paySuccess")
	public String paySuccess(HttpServletRequest httpServletRequest,MemberVO memberVO)throws Exception{
		PayVO payVO = new PayVO();
		
		long amount = Long.parseLong(httpServletRequest.getParameter("amount"));
		long mem_point = Long.parseLong(httpServletRequest.getParameter("mem_point"));
		
		//완료페이지를 갈때 맴버 포인트 업데이트
		mem_point = mem_point + amount;
		memberVO.setMem_point(mem_point);
		memberVO.setMem_id(httpServletRequest.getParameter("mem_id"));
	
		//충전 내역 업데이트
		payVO.setMem_id(httpServletRequest.getParameter("mem_id"));
		payVO.setPay_price(amount);
		paymentService.paymentCharge(payVO);
		
		int result = paymentService.pointUpdate(memberVO);
		
		System.out.println(result);
		
		return("payment/paySuccess");
	}
	
	@GetMapping("pointCharge")
	public ModelAndView pointCharge(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
	
		//맴버테이블에서 포인트 조회
		String mem_id = memberVO.getMem_id();
		long point = paymentService.pointSelect(mem_id);
		
		
		mv.addObject("point", point);
		mv.setViewName("/payment/pointCharge");
		
		return mv;  
	}
	
	@PostMapping("pointCharge")
	public ModelAndView pointCharge(long point)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/payment/pay");
		
		return mv;
	}
	@GetMapping("productPay")
	public String productPay()throws Exception{
		return "/payment/productPay";
	}
	
	
	
	
	
}
