package com.iu.s1.shop;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.member.MemberVO;
import com.iu.s1.shop.qna.StoreQnaService;
import com.iu.s1.shop.qna.StoreQnaVO;

@Controller
@RequestMapping("/shop/**")
public class ShopController {
	@Autowired
	private StoreQnaService storeQnaService;
	
		
	// 내상점 누르면 기본으로 상품페이지 출력
	@GetMapping("myshop")
	public ModelAndView myshop(ModelAndView mv,HttpSession session) throws Exception {
		
		String id = ((MemberVO)session.getAttribute("memberVO")).getMem_storeName();
		long num = ((MemberVO)session.getAttribute("memberVO")).getMem_storeNum();

		
		mv.addObject("mem_storeNum",num);
		mv.addObject("vo2","코멘트");
		
		System.out.println(" myshop ");
		
		mv.setViewName("shop/myshop");
		return mv;
	}
		
	//상점문의
	@GetMapping("comments")
	public ModelAndView comments(ModelAndView mv,StoreQnaVO storeQnaVO,HttpSession session) throws Exception {
		String id = ((MemberVO)session.getAttribute("memberVO")).getMem_storeName();
		long num = ((MemberVO)session.getAttribute("memberVO")).getMem_storeNum();
		
		
		storeQnaVO.setMem_storeNum(num); // 멤버의 mem_storeNum을 저장.
		
		
		List<StoreQnaVO> ar = storeQnaService.getSelectList(storeQnaVO);
		
		mv.addObject("mem_storeName",id);
		mv.addObject("mem_storeNum",num);
		mv.addObject("list",ar);
		mv.setViewName("shop/comments");
		return mv;
	}
	
	//상점문의  post
	@PostMapping("comments")
	public ModelAndView comments(ModelAndView mv,StoreQnaVO storeQnaVO) throws Exception {
		
		storeQnaService.setInsert(storeQnaVO);
		
		mv.setViewName("shop/comments");
		
		return mv;
	}
	

	
	
	
	// 찜목록
	@GetMapping("favorites")
	public ModelAndView favorites(ModelAndView mv,HttpSession session) throws Exception {
		String id = ((MemberVO)session.getAttribute("memberVO")).getMem_storeName();
		long num = ((MemberVO)session.getAttribute("memberVO")).getMem_storeNum();

		
		mv.addObject("mem_storeNum",num);
		
		mv.setViewName("shop/favorites");
		return mv;
	}
	
	//상점후기
	@GetMapping("reviews")
	public ModelAndView reviews(ModelAndView mv,HttpSession session) throws Exception {
		String id = ((MemberVO)session.getAttribute("memberVO")).getMem_storeName();
		long num = ((MemberVO)session.getAttribute("memberVO")).getMem_storeNum();

		
		mv.addObject("mem_storeNum",num);
		
		mv.setViewName("shop/reviews");
		return mv;
	}
	//팔로잉
	@GetMapping("followings")
	public ModelAndView followings(ModelAndView mv,HttpSession session) throws Exception {
		
		String id = ((MemberVO)session.getAttribute("memberVO")).getMem_storeName();
		long num = ((MemberVO)session.getAttribute("memberVO")).getMem_storeNum();

		
		mv.addObject("mem_storeNum",num);
		
		mv.setViewName("shop/followings");
		return mv;
	}
	
	//파ㅣㄹ로워ㅗ
	@GetMapping("followers")
	public ModelAndView followers(ModelAndView mv,HttpSession session) throws Exception {
		
		String id = ((MemberVO)session.getAttribute("memberVO")).getMem_storeName();
		long num = ((MemberVO)session.getAttribute("memberVO")).getMem_storeNum();

		
		mv.addObject("mem_storeNum",num);
		
		mv.setViewName("shop/followers");
		return mv;
	}
	
	
}
