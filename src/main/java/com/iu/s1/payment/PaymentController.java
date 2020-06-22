package com.iu.s1.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.member.MemberVO;
import com.iu.s1.trading.TradingVO;

@Controller
@RequestMapping("/payment/**")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	//결제로 들어가는 페이지
	@GetMapping("pay")
	public ModelAndView pay(long amount) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("amount", amount);
		mv.setViewName("/payment/pay");
		
		return mv;
	}
	
	//결제 성공페이지
	@GetMapping("paySuccess")
	public String paySuccess(HttpServletRequest httpServletRequest,MemberVO memberVO)throws Exception{
		PayVO payVO = new PayVO();
		
		long amount = Long.parseLong(httpServletRequest.getParameter("amount"));
		long mem_point = Long.parseLong(httpServletRequest.getParameter("mem_point"));
		
		//완료페이지를 갈때 맴버 포인트 업데이트
		mem_point = mem_point + amount;
		memberVO.setMem_point(mem_point);
		memberVO.setMem_id(httpServletRequest.getParameter("mem_id"));
	
		//현재 포인트 조회
		long nowPoint = paymentService.pointSelect(httpServletRequest.getParameter("mem_id"));
		
		//충전 내역 업데이트
		payVO.setMem_id(httpServletRequest.getParameter("mem_id"));
		payVO.setPay_price(amount);
		payVO.setPoint_rest(nowPoint+amount);
		paymentService.paymentCharge(payVO);
		
		int result = paymentService.pointUpdate(memberVO);
		
		System.out.println(result);
		
		return("payment/paySuccess");
	}
	
	// 포인트 충전 
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
	
	// 상품 결제 페이지
	@GetMapping("productPay")
	public ModelAndView productPay(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
		
		//맴버테이블에서 포인트 조회
		String mem_id = memberVO.getMem_id();
		long point = paymentService.pointSelect(mem_id);
	
		
		mv.addObject("point", point);
	
		mv.setViewName("/payment/productPay");
		
		return mv;
	}
	
	// 상풀결제 중간 페이지
	@GetMapping("productTrading")
	public ModelAndView productTrading(HttpServletRequest request)throws Exception{
		// 상품의 가격만큼 포인트 차감
		ModelAndView mv = new ModelAndView();
		
		//productSelect에서 넘길때 파라미터 값으로 sell넘을 넘겨 받아서 상품에 대한 정보 조회
		
		// 결제 진행 테이블 입력
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
		TradingVO tradingVO = new TradingVO();
		tradingVO.setSell_price(10);
		tradingVO.setSell_num(10);
		tradingVO.setBuyer_id(memberVO.getMem_id());
		String seller_id=paymentService.seller_id_select(10);
		System.out.println(seller_id);
		tradingVO.setSeller_id(seller_id);
		
		paymentService.tradingInsert(tradingVO);
		
		
		// payment 업데이트
		PayVO payVO = new PayVO();
		long nowPoint = paymentService.pointSelect(memberVO.getMem_id());
		System.out.println(nowPoint);
		payVO.setMem_id(memberVO.getMem_id());
		payVO.setPay_price(10);
		payVO.setPoint_rest(nowPoint-10); //test용으로 10 상품가격을 받아와야함 !
		paymentService.paymentOut(payVO);
		
		// member point 업데이트
		memberVO.setMem_point(nowPoint-10);
		paymentService.pointUpdate(memberVO);
		
		mv.addObject("tradingVO", tradingVO);
		mv.setViewName("/payment/productTrading");
		
		return mv;
	}
	// 회원 포인트 관리 
	@GetMapping("pointManage")
	public ModelAndView pointManage(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
	
		
		List<PayVO> ar =paymentService.pointManage(memberVO.getMem_id());
		mv.addObject("payVO", ar);
		mv.setViewName("/payment/pointManage");
		
		return mv;
	}
	
}
