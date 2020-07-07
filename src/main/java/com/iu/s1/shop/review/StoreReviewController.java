package com.iu.s1.shop.review;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.s1.shop.qna.StoreQnaVO;

@Controller
@RequestMapping("/shop/**/")
public class StoreReviewController {

	@Autowired
	private StoreReviewService storeReviewService;
	
	@GetMapping("rei")
	public ModelAndView setInsertReview(ModelAndView mv,long sell_num)throws Exception{
		
		long mem_storeNum = storeReviewService.getSelectsell_num_mem_storeNum(sell_num); // sotre_Num가져오기
		String sell_product = storeReviewService.getSelectSell_num_sell_product(sell_num); // sell_product 가져오기
		
		mv.setViewName("shop/rei");
		mv.addObject("mem_storeNum",mem_storeNum);
		mv.addObject("sell_product",sell_product);
		mv.addObject("buy_history");
		mv.addObject("sell_num",sell_num);
		mv.addObject("StoreReviewVO", new StoreReviewVO());
		return mv;
		
	}
	
	@PostMapping("rei")
	public ModelAndView setInsertReview(@Valid StoreReviewVO storeReviewVO,BindingResult bindingResult,MultipartFile[] files, RedirectAttributes rd)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			mv.setViewName("shop/rei");
			
		}else {
			System.out.println("리뷰컨트롤 확인");
			System.out.println(files);
			System.out.println(storeReviewVO);
			int result = storeReviewService.setInsertReview(storeReviewVO, files);
			rd.addFlashAttribute("result",result);
			mv.setViewName("redirect:../payment/buy_History");
		}
		
	return mv;	
	}
	
	
	//리뷰 딜리트
	
	@RequestMapping(value = "setDeleteReview", method = RequestMethod.GET)
	public ModelAndView setDeleteReview(long re_num,long mem_storeNum, ModelAndView mv)throws Exception{
		
		StoreReviewVO storeReviewVO = new StoreReviewVO();
		storeReviewVO.setRe_num(re_num);
		int result = storeReviewService.setDeleteReview(storeReviewVO);
		mv.setViewName("redirect:./reviews?mem_storeNum="+mem_storeNum);
	
		return mv;
	}
	
	
	
}
