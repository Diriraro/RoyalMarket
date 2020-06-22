//package com.iu.s1.shop.qna;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//@RequestMapping("/shop/**")
//public class StoreQnaController {
//	
//	@Autowired
//	private StoreQnaService storeQnaService;
//
//	
//	
//	// 셀렉트
//	@GetMapping("comments")
//	public ModelAndView getSelectList(StoreQnaVO storeQnaVO)throws Exception {
//		ModelAndView mv = new ModelAndView();
//		List<StoreQnaVO> ar = storeQnaService.getSelectList(storeQnaVO);
//		
//		mv.addObject("list",ar);
//		mv.setViewName("shop/comments");
//		
//		return mv;
//	}
//	
//
//	
//	// 인설트
//	
//
//	// 딜리트
//
//}
