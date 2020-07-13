package com.iu.s1.payment;


import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.member.MemberVO;
import com.iu.s1.paycheck.PayCheckVO;
import com.iu.s1.paymentHistory.Buy_HistoryVO;
import com.iu.s1.paymentHistory.Sell_HistoryVO;
import com.iu.s1.product.ProductService;
import com.iu.s1.product.ProductVO;
import com.iu.s1.saveCash.SaveCashVO;
import com.iu.s1.shop.review.StoreReviewService;
import com.iu.s1.shop.review.StoreReviewVO;


import com.iu.s1.trading.TradingVO;

@Controller
@RequestMapping("/payment/**")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	@Autowired
	private ProductService productService;
	@Autowired
	private StoreReviewService storeReviewService;

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
	public ModelAndView paySuccess(HttpServletRequest httpServletRequest)throws Exception{
		PayVO payVO = new PayVO();
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)httpServletRequest.getSession().getAttribute("member");
		
		long amount = Long.parseLong(httpServletRequest.getParameter("amount"));
		String key = httpServletRequest.getParameter("key");
		String checkKey=paymentService.paycheckSelect(memberVO.getMem_id());
		
		if(key.equals(checkKey)) {

			//완료페이지를 갈때 맴버 포인트 업데이트
		
			memberVO.setMem_point(memberVO.getMem_point()+amount);
			
			memberVO.setMem_id(memberVO.getMem_id());
		
			//현재 포인트 조회
			long nowPoint = paymentService.pointSelect(memberVO.getMem_id());

			
			//충전 내역 업데이트
			payVO.setMem_id(memberVO.getMem_id());
			payVO.setPay_price(amount);
			payVO.setPoint_rest(nowPoint+amount);
			paymentService.paymentCharge(payVO);
			
			paymentService.pointUpdate(memberVO);
	
			//paycheckId 삭제
			paymentService.paycheckDel(memberVO.getMem_id());
			
			httpServletRequest.setAttribute("member", memberVO);
			
			mv.addObject("result", "포인트 충전이 완료 되었습니다.");
			mv.addObject("path", "/");
			mv.setViewName("common/result");
			return mv;
		}else {
			//paycheckId 삭제
			paymentService.paycheckDel(memberVO.getMem_id());
			mv.addObject("result", "포인트 충전을 실패 하였습니다.");
			mv.addObject("path", "/");
			mv.setViewName("common/result");
			return mv;
	
		}
	}
	
	@GetMapping("payFail")
	public ModelAndView payFail()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", "포인트 충전을 실패 하였습니다.");
		mv.addObject("path", "/");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	// 포인트 충전 
	@GetMapping("pointCharge")
	public ModelAndView pointCharge(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
	
		String check= paymentService.paycheckSelect(memberVO.getMem_id());
		
		
		if(check !=null) {
	
			paymentService.paycheckDel(memberVO.getMem_id());
		}
		
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
		
		//페이지 진입시 savecash에 아이디가 있는지 확인 / 없으면 생성후 cash 불러오기 / 있으면 cash 불러오기
		SaveCashVO saveCashVO = new SaveCashVO();
		saveCashVO = paymentService.selectSC(memberVO.getMem_id());
		if(saveCashVO==null) {
			paymentService.createSC(memberVO.getMem_id());
			saveCashVO = paymentService.selectSC(memberVO.getMem_id());
		}
		mv.addObject("cash", saveCashVO);
		
		
		//맴버테이블에서 포인트 조회
		String mem_id = memberVO.getMem_id();
		long point = paymentService.pointSelect(mem_id);
		
		String image = productService.selectFileName(sell_num);
		
		mv.addObject("image", image);
		mv.addObject("point", point);
		mv.addObject("sell_product", sell_product);
		mv.addObject("sell_price", sell_price);
		mv.addObject("sell_num",sell_num);
		
		mv.setViewName("/payment/productPay");
		
		return mv;
	}
	
	// 상풀결제 중간 페이지
	@PostMapping("productTrading")
	public ModelAndView productTrading(HttpServletRequest request, long sell_num, long sell_price, long cash)throws Exception{
		// 상품의 가격만큼 포인트 차감
		ModelAndView mv = new ModelAndView();
		
		//productSelect에서 넘길때 파라미터 값으로 sell넘을 넘겨 받아서 상품에 대한 정보 조회
//		long sell_num = Long.parseLong(request.getParameter("sell_num"));
//		long sell_price = Long.parseLong(request.getParameter("sell_price"));
		
		// 결제 진행 테이블 입력
		TradingVO tradingVO = paymentService.tradingSelect(sell_num);
		
		if(tradingVO==null) {
			
			tradingVO = new TradingVO();
			paymentService.product_sell_statusUp(sell_num);
			MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
			tradingVO.setSell_price(sell_price+cash);		// 이미 sell_price가 jsp에서 cash만큼 빠져서 넘어오기 때문에 더해줌 / 
			tradingVO.setSell_num(sell_num);
			tradingVO.setBuyer_id(memberVO.getMem_id());
			String seller_id=paymentService.seller_id_select(sell_num);
			
			tradingVO.setSeller_id(seller_id);
			
			paymentService.tradingInsert(tradingVO);
			
			// 사용한 적립금 빼기
			if(cash!=0) {
				SaveCashVO saveCashVO = new SaveCashVO();
				saveCashVO = paymentService.selectSC(memberVO.getMem_id());
				long nowCash = saveCashVO.getMem_cash()-cash;
				saveCashVO.setMem_cash(nowCash);
				paymentService.updateSC(saveCashVO);
			}
		
			// payment 업데이트
			PayVO payVO = new PayVO();
			long nowPoint = paymentService.pointSelect(memberVO.getMem_id());
			System.out.println(nowPoint);
			payVO.setMem_id(memberVO.getMem_id());
			payVO.setPay_price(sell_price);
			payVO.setPoint_rest(nowPoint-sell_price); 			// parameter로 넘어올때 sell_price = (sell_price+택배비)-cash 하고 넘어옴
			paymentService.paymentOut(payVO);
			
			// member point 업데이트
			memberVO.setMem_point(nowPoint-sell_price);			// parameter로 넘어올때 sell_price = (sell_price+택배비)-cash 하고 넘어옴
			paymentService.pointUpdate(memberVO);
			
			// 구매내역 입력 
			Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
			
			// 상품이름 검색
			ProductVO productVO = paymentService.productSelect(sell_num);
			String file_name=productService.selectFileName(sell_num);
			
			// 날짜 설정 
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date time = new Date();
			String time1 = format1.format(time);
		
			
			buy_HistoryVO.setMem_id(memberVO.getMem_id());
			buy_HistoryVO.setSell_num(sell_num);
			buy_HistoryVO.setSell_price(sell_price);
			buy_HistoryVO.setSell_product(productVO.getSell_product());
			buy_HistoryVO.setFile_name(file_name);
			buy_HistoryVO.setSeller_id(seller_id);
			buy_HistoryVO.setBuy_date(time1);
			paymentService.buy_his(buy_HistoryVO);
			
			// 판매 내역 입력 
			Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
			sell_HistoryVO.setMem_id(seller_id);
			sell_HistoryVO.setSell_num(sell_num);
			sell_HistoryVO.setSell_price(sell_price);
			sell_HistoryVO.setFile_name(file_name);
			sell_HistoryVO.setBuyer_id(memberVO.getMem_id());
			sell_HistoryVO.setSell_product(productVO.getSell_product());
			sell_HistoryVO.setSell_date(time1);
			paymentService.sell_his(sell_HistoryVO);
			
			mv.addObject("tradingVO", tradingVO);
			mv.addObject("productVO", productVO);
			mv.setViewName("/payment/productTrading");
		
		}else {
			
			/*
			 * MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
			 * tradingVO.setSell_price(sell_price); tradingVO.setSell_num(sell_num);
			 * tradingVO.setBuyer_id(memberVO.getMem_id()); String
			 * seller_id=paymentService.seller_id_select(sell_num);
			 * 
			 * tradingVO.setSeller_id(seller_id);
			 * 
			 * ProductVO productVO = paymentService.productSelect(sell_num);
			 * 
			 * mv.addObject("tradingVO", tradingVO); mv.addObject("productVO", productVO);
			 * mv.setViewName("/payment/productTrading");
			 */
			mv.addObject("result", "이미 구매중인 상품입니다.");
			mv.addObject("path", "../");
			mv.setViewName("./common/result");
			
		}
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
		long buy_history_num = Long.parseLong(request.getParameter("buy_history_num"));
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
			long total=curPoint+(tradingVO.getSell_price()-2500);
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_id(seller_id);
			PayStatsVO payStatsVO = new PayStatsVO();
			
			//판매자 아이디 조회 후 paystatus에 인서트
			MemberVO memberVO2 = paymentService.memberVOSel(seller_id);			
			payStatsVO.setSeller_address(memberVO2.getMem_address());
			
			//수익 계산
			long profit = (tradingVO.getSell_price()-2500)/10;
			long commition= (tradingVO.getSell_price()-2500)/10;
			memberVO.setMem_point(total-profit+2500);
			buy_HistoryVO.setSell_num(sell_num);
			buy_HistoryVO.setStatus(2);
			payStatsVO.setSell_commition(commition);
			System.out.println(total-profit+2500);
			// 판매통계 업데이트
			paymentService.paystatsInsert(payStatsVO);
			
			// buy상태 sell 상태 바꾸기
			paymentService.buy_statusUp(buy_HistoryVO);
			Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
			sell_HistoryVO.setSell_num(sell_num);
			sell_HistoryVO.setStatus(2);
			paymentService.sell_statusUp(sell_HistoryVO);
			
			// 1% 적립금 추가
			SaveCashVO saveCashVO = new SaveCashVO();
			ProductVO productVO =paymentService.productSelect(sell_num);
			int sc = productVO.getSell_price();
			sc= (int) (sc*0.01);
			saveCashVO.setMem_cash(sc);
			saveCashVO.setMem_id(tradingVO.getBuyer_id());
			paymentService.updateSC(saveCashVO);
			
			// 포인트 업데이트 및 trading에서 삭제
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
			
			long total=curPoint+(tradingVO.getSell_price()-2500);
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_id(seller_id);
			PayStatsVO payStatsVO = new PayStatsVO();
			
			// 판매자 아이디 조회후 paystatus에 인서트
			MemberVO memberVO2 = paymentService.memberVOSel(seller_id);			
			payStatsVO.setSeller_address(memberVO2.getMem_address());
			
			// 수익 계산
			long profit = (tradingVO.getSell_price()-2500)/10;
			long commition = (tradingVO.getSell_price()-2500)/10;
			payStatsVO.setSell_commition(commition);
			memberVO.setMem_point(total-profit+2500);
			System.out.println(total-profit+2500);
			//판매 통계 업데이트
			paymentService.paystatsInsert(payStatsVO);
			
			//buy상태 sell상태 바꾸기
			Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
			buy_HistoryVO.setSell_num(sell_num);
			buy_HistoryVO.setStatus(2);			
			buy_HistoryVO.setBuy_check(0);
			paymentService.buy_statusUp(buy_HistoryVO);
			
			sell_HistoryVO = new Sell_HistoryVO();
			sell_HistoryVO.setSell_num(sell_num);
			sell_HistoryVO.setStatus(2);
			sell_HistoryVO.setSell_check(0);	
			paymentService.sell_statusUp(sell_HistoryVO);
			
			// 1% 적립금 추가
			SaveCashVO saveCashVO = new SaveCashVO();
			saveCashVO = paymentService.selectSC(tradingVO.getBuyer_id());
			
			ProductVO productVO =paymentService.productSelect(sell_num);
			long sc = productVO.getSell_price();
			sc = (long) (sc*0.01);				//1%
			sc = Math.round(sc*0.1) *10;		//1원단위 반올림
			sc = sc+saveCashVO.getMem_cash();
			saveCashVO.setMem_cash(sc);
			paymentService.updateSC(saveCashVO);

			// 포인트 업데이트 및 trading에서 삭제
			paymentService.pointUpdate(memberVO);
			paymentService.tradingDelete(sell_num);
		}		
		
		mv.setViewName("redirect:/payment/sell_History");
		
		return mv;
	}

	@GetMapping("buyer_page")
	public ModelAndView buyer_page(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		long buy_history_num = Long.parseLong(request.getParameter("buy_history_num"));
		
		// productVo 가져오기
		ProductVO productVO =paymentService.productSelect(sell_num);
		// 이미지 불러오기
		String image =productService.selectFileName(sell_num);
		// status(주문상태 가져오기 )
		long status = paymentService.buy_status(buy_history_num);
		// 주문자추가
		String mem_id=memberVO.getMem_id();
		//날짜 가져오기
		Buy_HistoryVO buy_HistoryVO= paymentService.buy_Sel(buy_history_num);
		
		///
		StoreReviewVO reviewVO = new StoreReviewVO();
		reviewVO = storeReviewService.recheck(sell_num);
		System.out.println(reviewVO+"확인 ㄱㄷㄱㄷㄱㄷㄱㄷ");
		
		mv.addObject("recheck",reviewVO);
		////
		
		mv.addObject("buy_date", buy_HistoryVO.getBuy_date());
		mv.addObject("mem_id", mem_id);
		mv.addObject("status", status);
		mv.addObject("buy_history_num", buy_history_num);
		mv.addObject("image", image);
		mv.addObject("productVO", productVO);
		mv.addObject("sell_num", sell_num);
		mv.setViewName("/payment/buyer_page");
		return mv;
	}
	
	@GetMapping("seller_page")
	public ModelAndView seller_page(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		long sell_history_num= Long.parseLong(request.getParameter("sell_history_num"));
		
		// productVo 가져오기
		ProductVO productVO =paymentService.productSelect(sell_num);
		// 이미지 불러오기
		String image =productService.selectFileName(sell_num);
		// status(주문상태 가져오기 )
		long status = paymentService.sell_status(sell_history_num);
		// 주문자추가
		String mem_id=memberVO.getMem_id();
		//날짜 가져오기
		Sell_HistoryVO sell_HistoryVO = paymentService.sell_Sel(sell_history_num);
		// 구매자 전화번호와 주소 검색
		String buyer_id = sell_HistoryVO.getMem_id();
		MemberVO memberVO2=paymentService.memberVOSel(buyer_id);
		
		mv.addObject("memberVO", memberVO2);
		mv.addObject("buy_date", sell_HistoryVO.getSell_date());
		mv.addObject("mem_id", mem_id);
		mv.addObject("status", status);
		mv.addObject("image", image);
		mv.addObject("productVO", productVO);
		mv.addObject("sell_history_num", sell_history_num);
		mv.addObject("sell_num", sell_num);
		mv.setViewName("/payment/buyer_page");
		mv.addObject("sell_num", sell_num);
		mv.setViewName("/payment/seller_page");
		
		return mv;
	}
	
	@GetMapping("productCancel")
	public ModelAndView productCancel(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_num = Long.parseLong(request.getParameter("sell_num"));
		String check= request.getParameter("check");
	
		if(check.equals("buy")) {
			long buy_history_num = Long.parseLong(request.getParameter("buy_history_num"));
			long status = paymentService.buy_status(buy_history_num);
			
			mv.setViewName("redirect:./buy_History");
			Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
			sell_HistoryVO.setSell_num(sell_num);
			sell_HistoryVO.setStatus(4);
			Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
			
			if(status!=4) {
				buy_HistoryVO.setSell_num(sell_num);
				buy_HistoryVO.setStatus(3);
			}
			buy_HistoryVO.setStatus(5);
			
			paymentService.buy_statusUp(buy_HistoryVO);
			paymentService.sell_statusUp(sell_HistoryVO);
			paymentService.buy_cancelUp(1);
		}else {
			long sell_history_num = Long.parseLong(request.getParameter("sell_history_num"));
			long status2 = paymentService.sell_status(sell_history_num);
			
			
			mv.setViewName("redirect:./sell_History");
			Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
			buy_HistoryVO.setSell_num(sell_num);
			buy_HistoryVO.setStatus(4);
			Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
			
			if(status2!=3) {
				
				sell_HistoryVO.setSell_num(sell_num);
				sell_HistoryVO.setStatus(3);
			}
			sell_HistoryVO.setStatus(5);
			paymentService.sell_statusUp(sell_HistoryVO);
			paymentService.buy_statusUp(buy_HistoryVO);
			paymentService.sell_cancelUp(1);
		}
		

		// 트레이딩 테이블에서 가격과 판매자 아이디를 조회해서 다시 판매자에게 돈을 돌려줌
		TradingVO tradingVO =paymentService.tradingSelect(sell_num);
		
		if(tradingVO.getBuy_cancel()==1 && tradingVO.getSell_cancel()==1) {
			Buy_HistoryVO buy_HistoryVO = new Buy_HistoryVO();
			buy_HistoryVO.setSell_num(sell_num);
			buy_HistoryVO.setStatus(3);
			buy_HistoryVO.setBuy_check(1);
			paymentService.buy_statusUp(buy_HistoryVO);
			Sell_HistoryVO sell_HistoryVO = new Sell_HistoryVO();
			sell_HistoryVO.setSell_num(sell_num);
			sell_HistoryVO.setStatus(3);
			sell_HistoryVO.setSell_check(1);
			paymentService.sell_statusUp(sell_HistoryVO);
			
			String mem_id = tradingVO.getBuyer_id();
			long price = tradingVO.getSell_price();
			
			//맴버에서 원래 아이디의 가격을 조회 후 취소된 거래의 가격만큼 더해줌
			long point = paymentService.pointSelect(mem_id);
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_id(mem_id);
			memberVO.setMem_point(price+point);
			paymentService.pointUpdate(memberVO);
			
			paymentService.tradingDelete(sell_num);
			paymentService.product_cancel_status(sell_num);
		}
		
	
		return mv;
	}
	
	@GetMapping("sellDelete")
	public ModelAndView sellDelete(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_history_num= Long.parseLong(request.getParameter("sell_history_num"));
		paymentService.del_sellHistory(sell_history_num);
		
		mv.setViewName("redirect:./sell_History");
		
		return mv;
		
	}
	
	@GetMapping("buyDelete")
	public ModelAndView buyDelete(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long buy_history_num= Long.parseLong(request.getParameter("buy_history_num"));
		paymentService.del_buyHistory(buy_history_num);
		
		mv.setViewName("redirect:./buy_History");
		
		return mv;
		
	}
	@GetMapping("prepare")
	public ModelAndView prepare()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", "준비중 입니다!!");
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		
		
		return mv;
		
	}
	@GetMapping("phone")
	public ModelAndView phone(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long sell_num= Long.parseLong(request.getParameter("sell_num"));
		long mem_storeNum= Long.parseLong(request.getParameter("mem_storeNum"));
		String seller_id =paymentService.seller_id_select(sell_num);
		MemberVO memberVO =paymentService.memberVOSel(seller_id);	
		StoreReviewVO storeReviewVO = new StoreReviewVO();
		
		storeReviewVO.setMem_storeNum(mem_storeNum);
		
		List<StoreReviewVO> ar =storeReviewService.getSelectListReview(storeReviewVO);
		double sum=0.0;
		double avg=0.0;
		double rest=0.0;
		
		if(!ar.isEmpty()) {
			for(int i=0; i<ar.size(); i++) {
				sum= sum+ar.get(i).getRe_rate();
				System.out.println(ar.get(i).getRe_rate()+"tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
			}
			System.out.println("sum:   "+ sum);
	
			avg=sum/ar.size();		
			System.out.println(avg);
			rest=Math.floor(avg);
			
			
			rest= avg-rest;
		}else {
			avg=0.0;
			rest= 0.0;
		}
		
		
		mv.addObject("rest", rest);
		mv.addObject("avg", avg);
		mv.addObject("sum", sum);
		mv.addObject("memberVO", memberVO);
		mv.setViewName("/payment/phone");
		return mv;
	}
	
	//예외 처리 메서드
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView error() {
		ModelAndView mv = new ModelAndView();
			
		mv.setViewName("error/serverError");
			
		return mv;
	}
	
}
