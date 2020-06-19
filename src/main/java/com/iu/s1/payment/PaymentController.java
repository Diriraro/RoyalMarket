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
		memberVO.setMem_point(Long.parseLong(httpServletRequest.getParameter("mem_point")));
		memberVO.setMem_id((String)httpServletRequest.getSession().getAttribute("member"));
		
		paymentService.pointUpdate(memberVO);
		
		return("payment/paySuccess");
	}
	
	@GetMapping("pointCharge")
	public String pointCharge()throws Exception{
		
		return "/payment/pointCharge";  
	}
	
	@PostMapping("pointCharge")
	public ModelAndView pointCharge(long point)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	@GetMapping("productPay")
	public String productPay()throws Exception{
		return "/payment/productPay";
	}
	
	
	
	
	
}
