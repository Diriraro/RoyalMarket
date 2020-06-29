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

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;
	
	private String checkNum = "";
	
	
	

	@GetMapping("findPwByEmail")
	public ModelAndView findPwByEmail(HttpSession session, MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", new MemberVO());
		mv.setViewName("member/findPwByEmail");
		return mv;
	}

	@PostMapping("findPwByEmail")
	public ModelAndView findPwByEmail(@Valid MemberVO memberVO, BindingResult bindingResult,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		Calendar cal = Calendar.getInstance();
		long now = cal.getTimeInMillis();
		long now_now = now - (long) session.getAttribute("now");
		
		boolean result = memberService.findPwByEmail(memberVO, bindingResult, checkNum);

		if (result) {
			mv.setViewName("member/findPwByEmail");
		}else if(now_now > 300) {
			System.out.println("ddd");
			mv.addObject("result", "인증번호 유효기간이 지났습니다.");
			mv.addObject("path", "./findPwByEmail");
			
			mv.setViewName("common/result");	
		} else {
			int result2 = memberService.memberPwUpdate(memberVO);
			if (result2 > 0) {
				mv.addObject("result", "비밀번호가 변경되었습니다. 다시 로그인 해주세요");
				mv.addObject("path", "../");
				mv.addObject("close",1);
				mv.setViewName("common/result2");
			}
		}
		return mv;
	}

	@PostMapping("findPwByPhone")
	public ModelAndView findPwByPhone(@Valid MemberVO memberVO, BindingResult bindingResult, Model model,HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		Calendar cal = Calendar.getInstance();
		long now = cal.getTimeInMillis();
		long now_now = now - (long) session.getAttribute("now");
		
		boolean result = memberService.findPwByPhone(memberVO, bindingResult, checkNum);
		System.out.println(result);
		System.out.println(now_now);
		if (result){
			// model.addAttribute("result","인증번호를 다시 확인해주세요");
			mv.setViewName("member/findPwByPhone");
		}else if(now_now > 300000){
			mv.addObject("result", "인증번호 유효기간이 지났습니다.");
			mv.addObject("path", "./findPwByPhone");
			
			mv.setViewName("common/result");	
		}else {
			int result2 = memberService.memberPwUpdate(memberVO);
			if (result2 > 0) {
				// model.addAttribute("result","비밀번호가 성공적으로 변경되었습니다.");
				mv.addObject("result", "비밀번호가 변경되었습니다. 다시 로그인 해주세요");
				mv.addObject("path", "../");
				mv.addObject("close",1);
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
				mv.addObject("result", "회원가입 성공");
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
		memberVO = memberService.selectMember(memberVO);
		if(memberVO.getMem_access()==1L) {
			mv.addObject("result", "차단 회원입니다");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
			return mv;
		}
		memberVO = memberService.memberLogin(memberVO);

		if (memberVO != null) {
			session.setAttribute("member", memberVO);
			mv.addObject("result", "로그인 성공");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
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
		if(memberVO2 != null) {
			msg= "이미 가입한 전화번호입니다";
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
	public void findMember() throws Exception {

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
			ModelAndView mv, Model model2,HttpSession session) throws Exception {

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
					messageHelper.setText("비밀번호는 " + PASSWORD + " 입니다.");
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
			if (mem.getMem_name() != name) {
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
		}else {
			mem = memberService.selectMemberByPhone(mem);

			if(mem.getMem_name().equals(name)) {

				String id = mem.getMem_id();

				System.out.println("수신자 번호 : " + phoneNumber);
				System.out.println("아이디 : " + id);
				String error_count = memberService.findIdByPhone(phoneNumber, id);
				System.out.println("에러카운트" + error_count);

				if (error_count.equals("0")) {
					msg = "인증 메세지를 전송했습니다";
				} else {
					msg = "인증 메세지 전송 실패했습니다";
				}

			}else {
				msg = "등록된 번호와 다릅니다.";
			}
		}

		model.addAttribute("result", msg);
	}

}
