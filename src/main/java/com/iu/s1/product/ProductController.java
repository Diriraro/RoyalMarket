package com.iu.s1.product;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.s1.member.MemberVO;
import com.iu.s1.util.Pager;


@Controller
@RequestMapping("/product/**/")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("productNew")
	public ModelAndView productInsert(ModelAndView mv)throws Exception{
		mv.setViewName("product/productNew");
		mv.addObject("productVO", new ProductVO());
		return mv;
	}
	
	@PostMapping("productNew")
	public ModelAndView productInsert(@Valid ProductVO productVO, BindingResult bindingResult, MultipartFile[] files,
			RedirectAttributes rd) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if (bindingResult.hasErrors()) {
			mv.setViewName("product/productNew");
		} else {
		
			int result = productService.productInsert(productVO, files);
			rd.addFlashAttribute("result", result);
			mv.setViewName("redirect:../");
		}

		return mv;
	}

	@GetMapping("productList")
	public ModelAndView productList(ProductVO productVO, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar = productService.productList(pager);
		mv.addObject("list", ar);
		
		List<String> ar2 = new ArrayList<String>();
		int index=0;
		for (ProductVO productVOs : ar) {
			long sell_num = productVOs.getSell_num();
			ar2.add(productService.selectFileName(sell_num));
			
			index++;
			
		}
		mv.addObject("file", ar2);
		mv.addObject("pager", pager);
		mv.setViewName("product/productList");

		return mv;
	}
	@GetMapping("productSelect")
	public ModelAndView productSelect(long sell_num) throws Exception{
		ModelAndView mv = new ModelAndView();
		ProductVO productVO = productService.productSelect(sell_num);
		mv.addObject("vo",productVO);
		
		sell_num = productVO.getSell_num();
		MemberVO memberVO = productService.productAddress(sell_num);
		mv.addObject("mvo",memberVO);
		mv.setViewName("product/productSelect");		
		return mv;	
	}

	
}
