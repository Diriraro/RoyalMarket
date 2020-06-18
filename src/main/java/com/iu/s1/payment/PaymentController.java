package com.iu.s1.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/payment/**")
public class PaymentController {

	@GetMapping("pay")
	public String pay() throws Exception{
		return "/payment/pay";
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
	
}
