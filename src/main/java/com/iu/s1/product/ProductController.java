package com.iu.s1.product;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/product/**/")
public class ProductController {
	
	private ProductService productService;
	
	@GetMapping("productNew")
	public ModelAndView setInsert(ModelAndView mv)throws Exception{
		mv.setViewName("product/productNew");
		mv.addObject("productVO", new ProductVO());
		return mv;
	}
	
	@PostMapping("productNew")
	public ModelAndView setInsert(@Valid ProductVO productVO, BindingResult bindingResult, MultipartFile[] files,
			RedirectAttributes rd) throws Exception {

		ModelAndView mv = new ModelAndView();
		if (bindingResult.hasErrors()) {
			mv.setViewName("product/productNew");
		} else {
			int result = productService.setInsert(productVO, files);
			rd.addFlashAttribute("result", result);
			mv.setViewName("redirect:../");
		}

		return mv;
	}

}
