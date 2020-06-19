package com.iu.s1.member;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/**/")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("memberLogin")
	public String memberLogin()throws Exception{
		return "member/memberLogin";
	}
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session,  RedirectAttributes rd)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO=memberService.memberLogin(memberVO);
		
		
		if (memberVO != null) {
			session.setAttribute("member", memberVO);
			System.out.println("성공");
			mv.setViewName("redirect:../");
		} else {
			String result = "실패";
			System.out.println("실패");
			rd.addFlashAttribute("result", result);
			mv.setViewName("redirect:./memberLogin");
		}
		
		return mv;
		
	}
	
	@RequestMapping(value = "memberLogout")
	public String memberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:../";
	}
	
}
