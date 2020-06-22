package com.iu.s1.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.shop.qna.StoreQnaService;
import com.iu.s1.shop.qna.StoreQnaVO;

@Controller
@RequestMapping("/shop/**")
public class ShopController {
	@Autowired
	private StoreQnaService storeQnaService;
	
		
	// 내상점 누르면 기본으로 상품페이지 출력
	@GetMapping("myshop")
	public ModelAndView myshop(ModelAndView mv) throws Exception {
		
		mv.addObject("vo","test");
		mv.addObject("vo2","코멘트");
		mv.setViewName("shop/myshop");
		return mv;
	}
	//상점문의
	@GetMapping("comments")
	public ModelAndView comments(ModelAndView mv,StoreQnaVO storeQnaVO) throws Exception {
		
		List<StoreQnaVO> ar = storeQnaService.getSelectList(storeQnaVO);
		
		
		mv.addObject("vo","test");
		mv.addObject("list",ar);
		mv.setViewName("shop/comments");
		return mv;
	}
	
	// 찜목록
	@GetMapping("favorites")
	public ModelAndView favorites(ModelAndView mv) throws Exception {
		mv.addObject("vo","test");
		mv.setViewName("shop/favorites");
		return mv;
	}
	
	//상점후기
	@GetMapping("reviews")
	public ModelAndView reviews(ModelAndView mv) throws Exception {
		mv.addObject("vo","test");
		mv.setViewName("shop/reviews");
		return mv;
	}
	//팔로잉
	@GetMapping("followings")
	public ModelAndView followings(ModelAndView mv) throws Exception {
		mv.addObject("vo","test");
		mv.setViewName("shop/followings");
		return mv;
	}
	
	//파ㅣㄹ로워ㅗ
	@GetMapping("followers")
	public ModelAndView followers(ModelAndView mv) throws Exception {
		mv.addObject("vo","test");
		System.out.println("ss");
		mv.setViewName("shop/followers");
		return mv;
	}
	
	
}
