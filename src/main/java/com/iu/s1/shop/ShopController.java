package com.iu.s1.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop/**")
public class ShopController {

	
	// 내상점 누르면 기본으로 상품페이지 출력
	@GetMapping("myshop")
	public ModelAndView myshop(ModelAndView mv) throws Exception {
		
		mv.addObject("vo","test");
		mv.setViewName("shop/myshop");
		return mv;
	}
	//상점문의
	@GetMapping("comments")
	public ModelAndView comments(ModelAndView mv) throws Exception {
		mv.addObject("vo","test");
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
		mv.setViewName("shop/followers");
		return mv;
	}
	
	
}
