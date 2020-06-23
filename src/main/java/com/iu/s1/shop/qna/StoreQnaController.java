package com.iu.s1.shop.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.member.MemberVO;

@Controller
@RequestMapping("/shop2/**")
public class StoreQnaController {
	
	@Autowired
	private StoreQnaService storeQnaService;

	
	
	@GetMapping("myshop2")
	public ModelAndView myshop(ModelAndView mv,HttpSession session) throws Exception {
				
		mv.setViewName("shop2/myshop2");
		return mv;
	}
		
	//상점문의    임시 25번 접속
	@GetMapping("comments2")
	public ModelAndView comments(ModelAndView mv,StoreQnaVO storeQnaVO,HttpSession session) throws Exception {
		String ids = ((MemberVO)session.getAttribute("member")).getMem_storeName();
//		long num = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		String id = "cotest";
		long num = 25;
		
		
//		storeQnaVO.setMem_storeNum(num); // 멤버의 mem_storeNum을 저장.
		storeQnaVO.setMem_storeNum(25); //  일단 임시방편
		
		List<StoreQnaVO> ar = storeQnaService.getSelectListQna(storeQnaVO);
		
		mv.addObject("mem_storeName",id);
		mv.addObject("ids",ids);
		mv.addObject("mem_storeNum",num);
		mv.addObject("list",ar);
		mv.setViewName("shop2/comments2");
		return mv;
	}

}
