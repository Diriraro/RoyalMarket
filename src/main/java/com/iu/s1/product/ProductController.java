package com.iu.s1.product;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import com.iu.s1.product.productFile.ProductFileVO;
import com.iu.s1.product.zzim.ZzimVO;
import com.iu.s1.shop.follow.StoreFollowService;
import com.iu.s1.shop.follow.StoreFollowVO;
import com.iu.s1.shop.qna.StoreQnaService;
import com.iu.s1.shop.qna.StoreQnaVO;
import com.iu.s1.util.Pager;

@Controller
@RequestMapping("/product/**/")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private StoreQnaService storeQnaService;
	
	@Autowired
	private StoreFollowService storeFollowService;

	@GetMapping("productNew")
	public ModelAndView productInsert(ModelAndView mv) throws Exception {
		mv.setViewName("product/productNew");
		mv.addObject("productVO", new ProductVO());
		return mv;
	}

	@PostMapping("productNew")
	public ModelAndView productInsert(@Valid ProductVO productVO, BindingResult bindingResult, MultipartFile[] files,
			RedirectAttributes rd) throws Exception {

		ModelAndView mv = new ModelAndView();

		if (bindingResult.hasErrors()) {
			mv.setViewName("redirect:../");
		} else {
			System.out.println("a");
			System.out.println(files);
			System.out.println(productVO);
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
		int index = 0;
		for (ProductVO productVOs : ar) {
			long sell_num = productVOs.getSell_num();
			ar2.add(productService.selectFileName(sell_num));
			productVOs.setMem_address(productService.productAddress(sell_num).getMem_address());
			index++;

		}
		
		mv.addObject("file", ar2);

		mv.addObject("pager", pager);
		mv.setViewName("product/productList");

		return mv;
	}
	
	@GetMapping("myProductList")
	public ModelAndView myProductList(ProductVO productVO, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		pager.setMem_storeNum(productVO.getMem_storeNum());
		List<ProductVO> ar = productService.myProductList(pager);
		mv.addObject("mylist", ar);

		List<String> ar2 = new ArrayList<String>();
		int index = 0;
		for (ProductVO productVOs : ar) {
			long sell_num = productVOs.getSell_num();
			ar2.add(productService.selectFileName(sell_num));
			index++;

		}
		
		mv.addObject("myfile", ar2);

		mv.addObject("pager", pager);
		mv.setViewName("product/myProductList");

		return mv;
	}

	@GetMapping("productSelect")
	public ModelAndView productSelect(long sell_num,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		ProductVO productVO = productService.productSelect(sell_num);
		mv.addObject("vo", productVO);

		sell_num = productVO.getSell_num();
		MemberVO memberVO = productService.productAddress(sell_num);
		mv.addObject("mvo", memberVO);
		mv.setViewName("product/productSelect");
		
		sell_num = productVO.getSell_num();
		MemberVO memberVOs = productService.productStoreName(sell_num);
		mv.addObject("mvo2", memberVOs);
		mv.setViewName("product/productSelect");
		
		

		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();

		/// 팔로우영역
		long give_storeNum=msnum;
		long take_storeNum=productVO.getMem_storeNum();
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
		storeFollowVO = storeFollowService.selectnum(give_storeNum,take_storeNum);
		//System.out.println(storeFollowVO+"::::::: 팔로우 번호 확인  없으면 널 있으면 번호생성");
		
		mv.addObject("fonum",storeFollowVO); // 팔로우번호 있으면 전송 없으면 null
	
		
		List<ProductFileVO> productFileVOs = productService.productFileSelect(sell_num);
		mv.addObject("pfile", productFileVOs); // store 사진 출력
		
		long mem_storeNum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		ZzimVO zzimVO = productService.zzimCheck(mem_storeNum,sell_num);
		mv.addObject("zc", zzimVO);
		
		long zcount = productService.zzimCount(sell_num);
		mv.addObject("zcount", zcount);

		return mv;
	}

	@GetMapping("productUpdate")
	public ModelAndView productUpdate(ModelAndView mv, ProductVO productVO, long sell_num) throws Exception {
		productVO = productService.productSelect(sell_num);
		List<ProductFileVO> productFileVOs = productService.productFileSelect(sell_num);
		mv.addObject("vvo", productVO);
		mv.addObject("fvvo", productFileVOs);

		return mv;
	}

	@PostMapping("productUpdate")
	public ModelAndView productUpdate(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();

		long result = productService.productUpdate(productVO);

		if (result > 0) {

			mv.setViewName("redirect:./productSelect?sell_num=" + productVO.getSell_num());
		}

		return mv;
	}

	@GetMapping("zzimInsert")
	public ModelAndView zzimInsert(ModelAndView mv) throws Exception {
		return mv;
	}

	@PostMapping("zzimInsert")
	public ModelAndView zzimInsert(ZzimVO zzimVO, ProductVO productVO, RedirectAttributes rd) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.zzimInsert(zzimVO);

		rd.addFlashAttribute("result", result);
		mv.setViewName("redirect:./productSelect?sell_num=" + productVO.getSell_num());
		return mv;
	}
	
	@GetMapping("zzimDelete")
	public ModelAndView zzimDelete(ZzimVO zzimVO, ProductVO productVO,RedirectAttributes rd,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.zzimDelete(zzimVO);
		String old_url = request.getHeader("referer");
		System.out.println(old_url);
		rd.addFlashAttribute("result", result);
		mv.setViewName("redirect:"+old_url);
		return mv;
		
	}
	
	@GetMapping("productDelete")
	public ModelAndView productDelete(ProductVO productVO,RedirectAttributes rd,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.productDelete(productVO);
		rd.addFlashAttribute("result", result);
		mv.setViewName("redirect:../");
		return mv;
		
	}



}
