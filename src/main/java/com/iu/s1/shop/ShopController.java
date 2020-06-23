package com.iu.s1.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();


		
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		mv.addObject("vo2","코멘트");
		
		System.out.println(" myshop ");
		
		mv.setViewName("shop/myshop");
		return mv;
	}
		
	//상점문의
	@GetMapping("comments")
	public ModelAndView comments(ModelAndView mv,StoreQnaVO storeQnaVO,HttpSession session) throws Exception {
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		
		storeQnaVO.setMem_storeNum(msnum); // 멤버의 mem_storeNum을 저장.
		
		
		List<StoreQnaVO> ar = storeQnaService.getSelectListQna(storeQnaVO);
		
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		mv.addObject("list",ar);
		mv.setViewName("shop/comments");
		return mv;
	}
	
	//상점문의  post
	@PostMapping("comments")
	public ModelAndView setInsertQna(ModelAndView mv,StoreQnaVO storeQnaVO) throws Exception {
		///////////해야하는거 여기 from 데이터 받아서  밑에코드 실행,  
		int result = storeQnaService.setInsertQna(storeQnaVO);
		System.out.println(result+"컨트롤 확인 ");
		mv.setViewName("redirect:./comments");
		return mv;
	}
	
	
	
	//상점문의 delete 완료
	
	@RequestMapping(value = "setDelete", method = RequestMethod.GET)
	public ModelAndView setDeleteQna(long sq_num, ModelAndView mv)throws Exception{
		
		StoreQnaVO storeQnaVO = new StoreQnaVO();
		
		storeQnaVO.setSq_num(sq_num); // 파라미터 값 세팅.
		
		int result = storeQnaService.setDeleteQna(storeQnaVO);
		if(result>0) {
			mv.addObject("result", "Delete Success");
		}else {
			mv.addObject("result", "Delete Fail");
		}
		mv.addObject("path", "./comments");
		mv.setViewName("common/result");
		return mv;
	}
	

	
	
	
	// 찜목록
	@GetMapping("favorites")
	public ModelAndView favorites(ModelAndView mv,HttpSession session) throws Exception {
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();

		
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/favorites");
		return mv;
	}
	
	//상점후기
	@GetMapping("reviews")
	public ModelAndView reviews(ModelAndView mv,HttpSession session) throws Exception {
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();

		
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/reviews");
		return mv;
	}
	//팔로잉
	@GetMapping("followings")
	public ModelAndView followings(ModelAndView mv,HttpSession session) throws Exception {
		
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();

		
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/followings");
		return mv;
	}
	
	//파ㅣㄹ로워ㅗ
	@GetMapping("followers")
	public ModelAndView followers(ModelAndView mv,HttpSession session) throws Exception {
		
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/followers");
		return mv;
	}
	
	
}
