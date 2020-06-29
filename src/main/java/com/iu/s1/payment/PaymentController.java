package com.iu.s1.payment;


import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.member.MemberVO;
import com.iu.s1.paycheck.PayCheckVO;
import com.iu.s1.paymentHistory.Buy_HistoryVO;
import com.iu.s1.paymentHistory.Sell_HistoryVO;
import com.iu.s1.trading.TradingVO;

@Controller
@RequestMapping("/payment/**")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	//결제로 들어가는 페이지
	@GetMapping("pay")
	public ModelAndView pay(long amount,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		String key =UUID.randomUUID().toString();	
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		
		//결제창 들어갈 때 UUID로 paycheckID 생성 
		PayCheckVO payCheckVO = new PayCheckVO();
		payCheckVO.setMem_id(memberVO.getMem_id());
		payCheckVO.setPay_checkId(key);
		paymentService.paycheckInsert(payCheckVO);
		
		mv.addObject("key", key);
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
		String key = httpServletRequest.getParameter("key");
		String checkKey=paymentService.paycheckSelect(httpServletRequest.getParameter("mem_id"));
		
		if(key.equals(checkKey)) {

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
			
			paymentService.pointUpdate(memberVO);
	
			//paycheckId 삭제
			paymentService.paycheckDel(httpServletRequest.getParameter("mem_id"));
			
			return("payment/paySuccess");
		}else {
			//paycheckId 삭제
			paymentService.paycheckDel(httpServletRequest.getParameter("mem_id"));
			return "payment/payFail";
	
		}
	}
	
	@GetMapping("payFail")
	public String payFail()throws Exception{
		System.out.println("test");
		return "payment/payFail"; 
	}
	
	// 포인트 충전 
	@GetMapping("pointCharge")
	public ModelAndView pointCharge(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
	
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
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		String sell_product = request.getParameter("sell_product");
		long sell_price = Long.parseLong(request.getParameter("sell_price"));
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		
		//맴버테이블에서 포인트 조회
		String mem_id = memberVO.getMem_id();
		long point = paymentService.pointSelect(mem_id);
	
		
		mv.addObject("point", point);
		mv.addObject("sell_product", sell_product);
		mv.addObject("sell_price", sell_price);
		mv.addObject("sell_num",sell_num);
		
		mv.setViewName("/payment/productPay");
		
		return mv;
	}
	
	// 상풀결제 중간 페이지
	@GetMapping("productTrading")
	public ModelAndView productTrading(HttpServletRequest request)throws Exception{
		// 상품의 가격만큼 포인트 차감
		ModelAndView mv = new ModelAndView();
		
		//productSelect에서 넘길때 파라미터 값으로 sell넘을 넘겨 받아서 상품에 대한 정보 조회
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		long sell_price = Long.parseLong(request.getParameter("sell_price"));
		
		// 결제 진행 테이블 입력
		paymentService.product_sell_statusUp(sell_num);
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		TradingVO tradingVO = new TradingVO();
		tradingVO.setSell_price(sell_price);
		tradingVO.setSell_num(sell_num);
		tradingVO.setBuyer_id(memberVO.getMem_id());
		String seller_id=paymentService.seller_id_select(sell_num);
		
		tradingVO.setSeller_id(seller_id);
		
		paymentService.tradingInsert(tradingVO);
		
		
		// payment 업데이트
		PayVO payVO = new PayVO();
		long nowPoint = paymentService.pointSelect(memberVO.getMem_id());
		System.out.println(nowPoint);
		payVO.setMem_id(memberVO.getMem_id());
		payVO.setPay_price(sell_price);
		payVO.setPoint_rest(nowPoint-sell_price); 
		paymentService.paymentOut(payVO);
		
		// member point 업데이트
		memberVO.setMem_point(nowPoint-sell_price);
		paymentService.pointUpdate(memberVO);
		
		// 구매내역 입력 
		Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
		
		// 상품이름 검색
		String sell_product = paymentService.productName(sell_num);
		
		buy_HistoryVO.setMem_id(memberVO.getMem_id());
		buy_HistoryVO.setSell_num(sell_num);
		buy_HistoryVO.setSell_price(sell_price);
		buy_HistoryVO.setSell_product(sell_product);
		paymentService.buy_his(buy_HistoryVO);
		
		// 판매 내역 입력 
		Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
		sell_HistoryVO.setMem_id(seller_id);
		sell_HistoryVO.setSell_num(sell_num);
		sell_HistoryVO.setSell_price(sell_price);
		sell_HistoryVO.setSell_product(sell_product);
		paymentService.sell_his(sell_HistoryVO);
		
		mv.addObject("tradingVO", tradingVO);
		mv.setViewName("/payment/productTrading");
		
		return mv;
	}
	// 회원 포인트 관리 
	@GetMapping("pointManage")
	public ModelAndView pointManage(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
	
		
		List<PayVO> ar =paymentService.pointManage(memberVO.getMem_id());
		mv.addObject("payVO", ar);
		mv.setViewName("/payment/pointManage");
		
		return mv;
	}
	
	// 구매내역 관리
	@GetMapping("buy_History")
	public ModelAndView buy_History(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		
		List<Buy_HistoryVO> vo = paymentService.buy_hisSelect(memberVO.getMem_id());
		
		mv.addObject("buy", vo);
		mv.setViewName("/payment/buy_History");
		
		return mv;
	}
	
	// 판매 내역 관리
	@GetMapping("sell_History")
	public ModelAndView sell_History(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		
		List<Sell_HistoryVO> ar = paymentService.sell_hisSelect(memberVO.getMem_id());
	
		
		mv.addObject("sell", ar);
		mv.setViewName("/payment/sell_History");
		
		return mv;
	}
	
	// 인수 버튼을 눌렀을 때
	@GetMapping("productTake")
	public ModelAndView productTake(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		long sell_num=Long.parseLong(request.getParameter("sell_num"));
		String seller_id=paymentService.seller_id_select(sell_num);
		long curPoint = paymentService.pointSelect(seller_id);
		
		TradingVO tradingVO = new TradingVO();
		tradingVO.setReceive(1);
		tradingVO.setSell_num(sell_num);
		
		// trading의 recieve 업데이트
		paymentService.tradingReceiveUp(tradingVO);
		// buy_history status 업데이트
		Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
		buy_HistoryVO.setSell_num(sell_num);
		buy_HistoryVO.setStatus(1);
		paymentService.buy_statusUp(buy_HistoryVO);
		
		tradingVO = paymentService.tradingSelect(sell_num);
		
		long receive = tradingVO.getReceive();
		long give = tradingVO.getGive();
		
		//인수 인계가 모두 1이면 판매자 포인트 업데이트
		if(receive==1 && give==1) {		
			long total=curPoint+tradingVO.getSell_price();
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_id(seller_id);
			long profit = (total/10);
			memberVO.setMem_point(total-profit);
			buy_HistoryVO.setSell_num(sell_num);
			buy_HistoryVO.setStatus(2);
			paymentService.buy_statusUp(buy_HistoryVO);
			Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
			sell_HistoryVO.setSell_num(sell_num);
			sell_HistoryVO.setStatus(2);
			paymentService.sell_statusUp(sell_HistoryVO);
			
			paymentService.pointUpdate(memberVO);
			paymentService.tradingDelete(sell_num);
		}		
		
		mv.setViewName("redirect:/payment/buy_History");
		
		return mv;
	}
	
	// 인계 버튼 인수 버튼 눌렀을떄
	@GetMapping("productGive")
	public ModelAndView productGive(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		long sell_num=Long.parseLong(request.getParameter("sell_num"));
		System.out.println(sell_num);
		String seller_id=paymentService.seller_id_select(sell_num);
		long curPoint = paymentService.pointSelect(seller_id);
		
		TradingVO tradingVO = new TradingVO();
		tradingVO.setGive(1);
		tradingVO.setSell_num(sell_num);
		
		// trading의 recieve 업데이트
		paymentService.tradingGiveUp(tradingVO);
		// buy_history status 업데이트
		Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
		sell_HistoryVO.setSell_num(sell_num);
		sell_HistoryVO.setStatus(1);
		
		paymentService.sell_statusUp(sell_HistoryVO);
		
		tradingVO = paymentService.tradingSelect(sell_num);
		
		long receive = tradingVO.getReceive();
		long give = tradingVO.getGive();
		
		//인수 인계가 모두 1이면 판매자 포인트 업데이트
		if(receive==1 && give==1) {		
			long total=curPoint+tradingVO.getSell_price();
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_id(seller_id);
			long profit = (total/10);
			memberVO.setMem_point(total-profit);
			Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
			buy_HistoryVO.setSell_num(sell_num);
			buy_HistoryVO.setStatus(2);
			paymentService.buy_statusUp(buy_HistoryVO);
			sell_HistoryVO = new Sell_HistoryVO();
			sell_HistoryVO.setSell_num(sell_num);
			sell_HistoryVO.setStatus(2);
			paymentService.sell_statusUp(sell_HistoryVO);
			paymentService.pointUpdate(memberVO);
			paymentService.tradingDelete(sell_num);
		}		
		
		mv.setViewName("redirect:/payment/sell_History");
		
		return mv;
	}

	@GetMapping("buyer_page")
	public ModelAndView buyer_page(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		
		mv.addObject("sell_num", sell_num);
		mv.setViewName("/payment/buyer_page");
		return mv;
	}
	
	@GetMapping("seller_page")
	public ModelAndView seller_page(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		
		mv.addObject("sell_num", sell_num);
		mv.setViewName("/payment/seller_page");
		return mv;
	}
	
	@GetMapping("productCancel")
	public ModelAndView productCancel(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		String check= request.getParameter("check");
		
		Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
		buy_HistoryVO.setSell_num(sell_num);
		buy_HistoryVO.setStatus(3);
		paymentService.buy_statusUp(buy_HistoryVO);
		Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
		sell_HistoryVO.setSell_num(sell_num);
		sell_HistoryVO.setStatus(3);
		paymentService.sell_statusUp(sell_HistoryVO);
		
		// 트레이딩 테이블에서 가격과 판매자 아이디를 조회해서 다시 판매자에게 돈을 돌려줌
		TradingVO tradingVO =paymentService.tradingSelect(sell_num);
		String mem_id = tradingVO.getSeller_id();
		long price = tradingVO.getSell_price();
		
		//맴버에서 원래 아이디의 가격을 조회 후 취소된 거래의 가격만큼 더해줌
		long point = paymentService.pointSelect(mem_id);
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id(mem_id);
		memberVO.setMem_point(price+point);
		paymentService.pointUpdate(memberVO);
		
		if(check.equals("buy")) {
			mv.setViewName("redirect:./buy_History");
		}else {
			mv.setViewName("redirect:./sell_History");
		}
		return mv;
	}
	
	@GetMapping("sellDelete")
	public ModelAndView sellDelete(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_num= Long.parseLong(request.getParameter("sell_num"));
		paymentService.del_sellHistory(sell_num);
		
		mv.setViewName("redirect:./sell_History");
		
		return mv;
		
	}
	
	@GetMapping("buyDelete")
	public ModelAndView buyDelete(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_num= Long.parseLong(request.getParameter("sell_num"));
		paymentService.del_buyHistory(sell_num);
		
		mv.setViewName("redirect:./buy_History");
		
		return mv;
		
	}
	
}
