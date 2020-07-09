package com.iu.s1.member;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.s1.payment.PaymentService;
import com.iu.s1.paymentHistory.Sell_HistoryVO;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	private String checkNum = "";
	
	@GetMapping("memberUpdate")
	public void memberUpdate()throws Exception{
		
	}
	@Autowired
	private PaymentService paymentService;

	@GetMapping("findPwByEmail")
	public ModelAndView findPwByEmail(HttpSession session, MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/findPwByEmail");
		return mv;
	}

	@PostMapping("findPwByEmail")

	public ModelAndView findPwByEmail(@Valid MemberVO memberVO, BindingResult bindingResult, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		Calendar cal = Calendar.getInstance();
		long now = cal.getTimeInMillis();
		long now_now = now - (long) session.getAttribute("now");

		boolean result = memberService.findPwByEmail(memberVO, bindingResult, checkNum);

		if (result) {
			mv.addObject("show4", result);
			mv.setViewName("member/findMember");
		} else if (now_now > 300000) {
			System.out.println("ddd");
			mv.addObject("result", "인증번호 유효기간이 지났습니다.");
			mv.addObject("path", "./findMember");

			mv.setViewName("common/result");
		} else {
			int result2 = memberService.memberPwUpdate(memberVO);
			if (result2 > 0) {
				mv.addObject("result", "비밀번호가 변경되었습니다. 다시 로그인 해주세요");
				mv.addObject("path", "../");
				mv.addObject("close", 1);
				mv.setViewName("common/result2");
			}
		}
		return mv;
	}

	@PostMapping("findPwByPhone")
	public ModelAndView findPwByPhone(@Valid MemberVO memberVO, BindingResult bindingResult, Model model,
			HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		Calendar cal = Calendar.getInstance();
		long now = cal.getTimeInMillis();
		long now_now = now - (long) session.getAttribute("now");

		boolean result = memberService.findPwByPhone(memberVO, bindingResult, checkNum);
		System.out.println(result);
		System.out.println(now_now);
		if (result) {
			// model.addAttribute("result","인증번호를 다시 확인해주세요");
			mv.setViewName("member/findMember");
			mv.addObject("show3", result);
		} else if (now_now > 300000) {
			mv.addObject("result", "인증번호 유효기간이 지났습니다.");
			mv.addObject("path", "./findMember");

			mv.setViewName("common/result");
		} else {
			int result2 = memberService.memberPwUpdate(memberVO);
			if (result2 > 0) {
				// model.addAttribute("result","비밀번호가 성공적으로 변경되었습니다.");
				mv.addObject("result", "비밀번호가 변경되었습니다. 다시 로그인 해주세요");
				mv.addObject("path", "../");
				mv.addObject("close", 1);
				mv.setViewName("common/result2");
			}
			session.invalidate();
		}
		return mv;
	}

	@PostMapping("memberJoin")
	public ModelAndView memberJoin(@Valid MemberVO memberVO, BindingResult bindingResult, HttpSession session)
			throws Exception {

		ModelAndView mv = new ModelAndView();

		Calendar cal = Calendar.getInstance();
		long now = cal.getTimeInMillis();
		long now_now = now - (long) session.getAttribute("now");

		boolean result = memberService.memberCheck(memberVO, bindingResult, checkNum);

		if (result) {
			mv.setViewName("member/memberJoin");
		} else if (now_now > 300000) {
			mv.addObject("result", "인증번호 유효기간이 지났습니다.");
			mv.addObject("path", "./memberJoin");
			mv.setViewName("common/result");
		} else {
			// 정상작동
			int result2 = memberService.memberJoin(memberVO);
			if (result2 > 0) {
				mv.addObject("result", "환영합니다! 로그인해주세요");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
			session.invalidate();
		}

		return mv;
	}

	@GetMapping("memberJoin")
	public ModelAndView memberJoin(HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/memberJoin");

		session.setAttribute("numStr", "");
		session.setAttribute("now", 0L);

		return mv;
	}

	@GetMapping("memberLogin")
	public void memberLogin() throws Exception {
	}

	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		Cookie cookie = new Cookie("cId", memberVO.getMem_id());
		response.addCookie(cookie);
		MemberVO memberVO2 = new MemberVO();
		memberVO2 = memberService.selectMember(memberVO);

		List<Sell_HistoryVO> sell = paymentService.seller_check(memberVO.getMem_id());
		int sellProduct = sell.size();
		
		
		
		if (memberVO2 == null) {
			mv.addObject("result", "존재하지 않는 회원입니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
			return mv;
		} else if (!memberVO2.getMem_pw().equals(memberVO.getMem_pw())) {
			mv.addObject("result", "잘못된 비밀번호입니다");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
			return mv;
		} else if (memberVO2.getMem_access() == 1L) {
			mv.addObject("result", "차단 회원입니다");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
			return mv;
		} else if (memberVO2.getMem_kakao() == 1L) {
			mv.addObject("result", "카카오 회원은 카카오 로그인을 이용해주세요");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
			return mv;
		}else if(!sell.isEmpty()) {
			mv.addObject("result", sellProduct+"개의 판매중인 상품이 있습니다.");
			mv.addObject("path", "../payment/sell_History");
			mv.setViewName("common/result");
		}

		memberVO = memberService.memberLogin(memberVO);

		if (memberVO != null) {
			session.setAttribute("member", memberVO);
			if (memberVO.getMem_id().equals("admin")) {
				mv.addObject("result", "관리자 로그인 승인되었습니다.");
				mv.addObject("path", "../admin/adminPage");
				mv.setViewName("common/result");
			}else {
				
				// 로그인 할 때 판매 상품이 있는지 없는지 판별하는 조건문
				if(sell.isEmpty()) {					
					mv.addObject("result", "환영합니다!");
					mv.addObject("path", "../");
					mv.setViewName("common/result");
				}else {
					mv.addObject("result", sellProduct+"개의 판매중인 상품이 있습니다.");
					mv.addObject("path", "../payment/sell_History");
					mv.setViewName("common/result");
				}
			}
		}
		return mv;
	}

	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:../";
	}

	@PostMapping("sendSMS")
	public void sendSMS(String phoneNumber, Model model, HttpSession session, String id) throws Exception {
		String msg = "";

		MemberVO mem = new MemberVO();
		mem.setMem_id(id);
		if (memberService.selectMember(mem) == null) {
			msg = "존재하지 않는 아이디입니다.";
		} else {

			mem = memberService.selectMember(mem);

			if (mem.getMem_phone().equals(phoneNumber)) {

				Random rand = new Random();
				String numStr = "";
				for (int i = 0; i < 4; i++) {
					String ran = Integer.toString(rand.nextInt(10));
					numStr += ran;
				}

				Calendar nowCal = Calendar.getInstance();
				long now = nowCal.getTimeInMillis();
				System.out.println("sendSMS" + now);
				checkNum = numStr;

				session.setAttribute("numStr", numStr);
				session.setAttribute("now", now);

				System.out.println("수신자 번호 : " + phoneNumber);
				System.out.println("인증번호 : " + numStr);
				String error_count = memberService.certifiedPhoneNumber(phoneNumber, numStr);
				System.out.println("에러카운트" + error_count);

				if (error_count.equals("0")) {
					msg = "인증 메세지를 전송했습니다";
				} else {
					msg = "인증 메세지 전송 실패했습니다";
				}

			} else {
				msg = "등록된 번호와 다릅니다.";
			}

		}

		model.addAttribute("result", msg);
	}

	@PostMapping("sendSMS2")
	public void sendSMS2(String phoneNumber, Model model, HttpSession session, String id) throws Exception {
		String msg = "";

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		MemberVO memberVO2 = new MemberVO();
		memberVO2.setMem_phone(phoneNumber);
		memberVO2 = memberService.selectMemberByPhone(memberVO2);
		if (memberVO2 != null) {
			msg = "이미 가입한 전화번호입니다";
			model.addAttribute("result", msg);
			return;
		}

		Calendar nowCal = Calendar.getInstance();
		long now = nowCal.getTimeInMillis();
		System.out.println("sendSMS" + now);
		checkNum = numStr;

		session.setAttribute("numStr", numStr);
		session.setAttribute("now", now);

		System.out.println(session.getAttribute("now"));

		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);
		String error_count = memberService.certifiedPhoneNumber(phoneNumber, numStr);
		System.out.println("에러카운트" + error_count);

		if (error_count.equals("0")) {
			msg = "인증 메세지를 전송했습니다";
		} else {
			msg = "인증 메세지 전송 실패했습니다";
		}

		model.addAttribute("result", msg);
	}

	@GetMapping("findAddress")
	public void findAddress() throws Exception {

	}

	@PostMapping("findAddress")
	public ModelAndView findAddress(String road_address) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("road_address", road_address);
		mv.setViewName("member/memberJoin");
		return mv;
	}

	@GetMapping("findMember")
	public ModelAndView findMember() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/findMember");
		return mv;

	}

	@GetMapping("findPwByPhone")
	public ModelAndView findPwByPhone() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/findPwByPhone");

		return mv;
	}

	@PostMapping("sendEmail")
	public void sendEmailAction(@RequestParam Map<String, Object> paramMap, String id, String email, ModelMap model,
			ModelAndView mv, Model model2, HttpSession session) throws Exception {

		paramMap.put("username", id);
		paramMap.put("email", email);

		MemberVO mem = new MemberVO();
		mem.setMem_id(id);
		String msg2 = "";
		if (memberService.selectMember(mem) == null) {
			msg2 = "존재하지 않는 아이디입니다.";
		} else {

			mem = memberService.selectMember(mem);

			if (!mem.getMem_email().equals(email)) {
				msg2 = "등록된 이메일과 다릅니다.";
			} else {
				String USERNAME = (String) paramMap.get("username");
				String EMAIL = (String) paramMap.get("email");
				String PASSWORD = "";
				Random rand = new Random();
				for (int i = 0; i < 4; i++) {
					String ran = Integer.toString(rand.nextInt(10));
					PASSWORD += ran;
				}
				System.out.println(PASSWORD);
				checkNum = PASSWORD;

				Calendar nowCal = Calendar.getInstance();
				long now = nowCal.getTimeInMillis();

				session.setAttribute("numStr", PASSWORD);
				session.setAttribute("now", now);

				try {
					MimeMessage msg = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

					messageHelper.setSubject(USERNAME + "님 비밀번호 찾기 메일입니다.");
					messageHelper.setText("인증번호는 " + PASSWORD + " 입니다.");
					messageHelper.setTo(EMAIL);
					msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(EMAIL));
					mailSender.send(msg);

				} catch (MessagingException e) {
					System.out.println("MessagingException");
					e.printStackTrace();
				}

				msg2 = "인증 메일을 전송했습니다";
			}
		}
		model2.addAttribute("result", msg2);
	}

	@PostMapping("findIdByEmail")
	public void findIdByEmail(@RequestParam Map<String, Object> paramMap, String name, String email, ModelMap model,
			ModelAndView mv, Model model2) throws Exception {

		paramMap.put("username", name);
		paramMap.put("email", email);

		MemberVO mem = new MemberVO();
		mem.setMem_email(email);

		String msg2 = "";
		if (memberService.selectMemberByEmail(mem) == null) {
			msg2 = "존재하지 않는 이메일입니다.";
		} else {
			mem = memberService.selectMemberByEmail(mem);
			if (!mem.getMem_name().equals(name)) {
				msg2 = "등록된 이메일과 다릅니다.";
				model2.addAttribute("result", msg2);
				return;
			}

			String USERNAME = (String) paramMap.get("username");
			String EMAIL = (String) paramMap.get("email");
			String ID = mem.getMem_id();

			try {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

				messageHelper.setSubject(USERNAME + "님 아이디 찾기 메일입니다.");
				messageHelper.setText("회원님의 아이디는  " + ID + " 입니다.");
				messageHelper.setTo(EMAIL);
				msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(EMAIL));
				mailSender.send(msg);

			} catch (MessagingException e) {
				System.out.println("MessagingException");
				e.printStackTrace();
			}

			msg2 = "인증 메세지를 전송했습니다";

		}
		model2.addAttribute("result", msg2);
	}

	@GetMapping("findIdByEmail")
	public ModelAndView findIdByEmail() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/findIdByEmail");

		return mv;
	}

	@GetMapping("findIdByPhone")
	public ModelAndView findIdByPhone() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/findIdByPhone");
		return mv;
	}

	@PostMapping("findIdByPhone")
	public void findIdByPhone(String phoneNumber, Model model, HttpSession session, String name) throws Exception {
		String msg = "";

		MemberVO mem = new MemberVO();
		mem.setMem_phone(phoneNumber);
		System.out.println(phoneNumber);
		if (memberService.selectMemberByPhone(mem) == null) {
			msg = "존재하지 않는 전화번호입니다.";
		} else {
			mem = memberService.selectMemberByPhone(mem);

			if (mem.getMem_name().equals(name)) {

				String id = mem.getMem_id();

				System.out.println("수신자 번호 : " + phoneNumber);
				System.out.println("아이디 : " + id);
				String error_count = memberService.findIdByPhone(phoneNumber, id);
				System.out.println("에러카운트" + error_count);

				if (error_count.equals("0")) {
					msg = "아이디를 전송했습니다";
				} else {
					msg = "아이디 전송 실패했습니다";
				}

			} else {
				msg = "등록된 번호와 다릅니다.";
			}
		}

		model.addAttribute("result", msg);
	}

	@PostMapping("kakaoLogin")
	public ModelAndView kakaoLogin(MemberVO memberVO, HttpSession session, ModelAndView mv, String profile,
			HttpServletResponse response) throws Exception {

		/* memberVO.setKind(profile); */

		Cookie kakao_email = new Cookie("kakao_email", memberVO.getMem_email());
		Cookie kakao_name = new Cookie("kakao_name", memberVO.getMem_name());
		kakao_email.setMaxAge(600);
		kakao_name.setMaxAge(600);
		response.addCookie(kakao_email);
		response.addCookie(kakao_name);

		memberVO = memberService.kakaoLogin(memberVO);
		mv.addObject("result", "newMember");
		// Cookie작업
		if (memberVO != null) {
			mv.addObject("result", memberVO);
			session.setAttribute("member", memberVO);
		}
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	@GetMapping("kakaoMemberJoin")
	public ModelAndView memberNewKakao(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		/*
		 * MemberVO memberVO2 = (MemberVO) session.getAttribute("memberVO");
		 * mv.addObject("profile", memberVO2.getKind());
		 */
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/kakaoMemberJoin");

		return mv;
	}

	@PostMapping("kakaoMemberJoin")
	public ModelAndView kakaoMemberJoin(@Valid MemberVO memberVO, BindingResult bindingResult, HttpSession session,
			HttpServletRequest request) throws Exception {
		String email = "";
		String name = "";
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {

			if (cookies[i].getName().equals("kakao_name")) {
				name = cookies[i].getValue();
			} else if (cookies[i].getName().equals("kakao_email")) {
				email = cookies[i].getValue();
			}
		}

		memberVO.setMem_name(name);
		memberVO.setMem_id(email);
		memberVO.setMem_email(email);
		memberVO.setMem_pw("kakaoPw");
		memberVO.setMem_kakao(1);

		ModelAndView mv = new ModelAndView();
		boolean result = memberService.kakaoMemberCheck(memberVO, bindingResult, checkNum);
		System.out.println(result);
		if (result) {
			mv.setViewName("member/kakaoMemberJoin");
		} else {
			// 정상작동
			int result2 = memberService.memberJoin(memberVO);
			if (result2 > 0) {
				mv.addObject("result", "회원가입 성공");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
				cookies[1] = new Cookie("kakao_email", null);
				cookies[1].setMaxAge(0); // 쿠키의 expiration 타임을 0으로 하여 없앤다.
				cookies[1].setPath("/");
				cookies[2] = new Cookie("kakao_name", null);
				cookies[2].setMaxAge(0); // 쿠키의 expiration 타임을 0으로 하여 없앤다.
				cookies[2].setPath("/");

			}
			session.invalidate();
		}

		return mv;
	}
	
	@PostMapping("updateStoreName")
	public ModelAndView updateStoreName(MemberVO memberVO, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(memberVO.getMem_id());
		MemberVO memberVO3 = new MemberVO();
		memberVO3.setMem_id(memberVO.getMem_id());
		memberVO3.setMem_storeName(memberVO.getMem_storeName());
		
		MemberVO member = memberService.selectMemberByStoreName(memberVO);
		memberVO = memberService.selectMember(memberVO);
		String msg="";
		
		String referer = request.getHeader("referer");
		
		if(memberVO3.getMem_storeName()=="" || memberVO3.getMem_storeName()==null) {
			msg = "상점명을 입력해주세요";
			mv.addObject("path", referer);
			mv.addObject("result", msg);
			mv.setViewName("common/result");
			return mv;
		}
		
		if(member != null) {
			msg = "이미 등록된 상점명입니다";
			mv.addObject("path", referer);
			mv.addObject("result", msg);
			mv.setViewName("common/result");
		}else {
			int i = memberService.updateStoreName(memberVO3);
			
			if(i>0) {
				//msg = "수정 완료!";			
				mv.addObject("path", referer);
				mv.setViewName("common/result3");	
			}else {
				msg = "수정 실패!";			
				mv.addObject("path", referer);
				mv.addObject("result", msg);
				mv.setViewName("common/result");
			}
			
		}
		
		return mv;
	}
	
	@PostMapping("memberDelete")
	public ModelAndView memberDelete(HttpSession session, MemberVO memberVO, HttpServletRequest request)throws Exception{
		System.out.println(memberVO.getMem_id());
		System.out.println(memberVO.getMem_pw());
		ModelAndView mv = new ModelAndView();
		String referer = request.getHeader("referer");
		String msg="";
		
		MemberVO member = memberService.selectMember(memberVO);
		
		System.out.println(member.getMem_storeNum());
		System.out.println(memberVO.getMem_pw());
		if(member.getMem_pw().equals(memberVO.getMem_pw())) {
			int result = memberService.memberDelete(member);
			session.invalidate();
			mv.setViewName("redirect:../");
			return mv;
				
		}else {
			msg = "비밀번호가 다릅니다.";
			mv.addObject("path", referer);
			mv.addObject("result", msg);
			mv.setViewName("common/result");
			return mv;
		
		}
	}

}
