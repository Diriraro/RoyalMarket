package com.iu.s1.member;

import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.payment.PaymentService;
import com.iu.s1.paymentHistory.Sell_HistoryVO;
import com.iu.s1.trading.TradingVO;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PaymentService paymentService;
	
	
	private String checkNum="";
	
	@PostMapping("memberJoin")
	public ModelAndView memberJoin(@Valid MemberVO memberVO,BindingResult bindingResult, String check_num) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		boolean result = memberService.memberCheck(memberVO, bindingResult,check_num);
		System.out.println(check_num);
		System.out.println(checkNum);
		if(check_num.equals(checkNum)) {
			System.out.println("인증성공");
		}else {
			System.out.println("인증실패");
		}
		
		if(result) {
			mv.setViewName("member/memberJoin");
		}else {
			//정상작동
			int result2 = memberService.memberJoin(memberVO);
			if(result2 > 0) {
				mv.addObject("result", "회원가입 성공");
				mv.addObject("path","../");
				mv.setViewName("common/result");
			}
		}
		
		return mv;
	}
	
	
	@GetMapping("memberJoin")
	public ModelAndView memberJoin()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/memberJoin");
		
		return mv;
	}
	
	
	@GetMapping("memberLogin")
	public void memberLogin() throws Exception{	
	}
	
	
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session, HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView();

		
		 Cookie cookie = new Cookie("cId", memberVO.getMem_id());
		 response.addCookie(cookie);
		 
		 
		memberVO = memberService.memberLogin(memberVO);
		
		
		if(memberVO != null) {
		List<Sell_HistoryVO> sell =paymentService.seller_check(memberVO.getMem_id());
		int sellProduct = sell.size();
		
				session.setAttribute("member", memberVO);
			if(sell.isEmpty()) {
				mv.addObject("result", "로그인 성공");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}else {
				mv.addObject("result", sellProduct+"개의 판매중인 상품이 있습니다.");
				mv.addObject("path", "../payment/sell_History");
				mv.setViewName("common/result");
			}
		}
		return mv;
	}
	
	
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:../";
	}
	
	
	@GetMapping("/check/sendSMS")
    public @ResponseBody
    String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
        checkNum = numStr;
        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        memberService.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
    }
	
	
	
}