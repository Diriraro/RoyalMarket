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
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView myshop(ModelAndView mv,HttpSession session,long mem_storeNum) throws Exception {
		
		StoreQnaVO qnaVO = new StoreQnaVO();
		
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		qnaVO.setSq_storeNum(mem_storeNum);
		
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		
		
		
		mv.addObject("mem_storeNum",mem_storeNum);//파라미터  모든 상점 페이지는 mem_storeNum으로 들어가야함,
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/myshop");
		return mv;
	}
		
	//상점문의
	@GetMapping("comments")
	public ModelAndView comments(ModelAndView mv,StoreQnaVO storeQnaVO,HttpSession session,long mem_storeNum) throws Exception {
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		storeQnaVO.setMem_storeNum(mem_storeNum); // 받아온 파라미터로 출력/
		
		List<StoreQnaVO> ar = storeQnaService.getSelectListQna(storeQnaVO);
		for (StoreQnaVO qnaVO :ar) {
			qnaVO.setMem_storeName(storeQnaService.getSelectStoreName(qnaVO));// 작성자의 번호로 이름을 출력 한것을 ar안에 담고.
			
		}
		
		// 상점주인이름
		StoreQnaVO qnaVO = new StoreQnaVO();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		
		
		
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		mv.addObject("mem_storeNum",mem_storeNum);
		mv.addObject("list",ar);
		mv.setViewName("shop/comments");
		return mv;
	}
	
	//상점문의  post
	@PostMapping("comments")
	public ModelAndView setInsertQna(ModelAndView mv,StoreQnaVO storeQnaVO,long mem_storeNum) throws Exception {
		///////////해야하는거 여기 from 데이터 받아서  밑에코드 실행, 
		
		int result = storeQnaService.setInsertQna(storeQnaVO);
		mv.setViewName("redirect:./comments?mem_storeNum="+mem_storeNum);
		return mv;
	}
	
	
	
	//상점문의 delete 완료
	
	@RequestMapping(value = "setDelete", method = RequestMethod.GET)
	public ModelAndView setDeleteQna(long sq_num,long mem_storeNum, ModelAndView mv)throws Exception{
		
		StoreQnaVO storeQnaVO = new StoreQnaVO();
		
		storeQnaVO.setSq_num(sq_num); // 파라미터 값 세팅.
		int result = storeQnaService.setDeleteQna(storeQnaVO);
		
		mv.setViewName("redirect:./comments?mem_storeNum="+mem_storeNum);
	
	
		return mv;
	}
	

	
	
	
	// 찜목록
	@GetMapping("favorites")
	public ModelAndView favorites(ModelAndView mv,HttpSession session,long mem_storeNum) throws Exception {
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		
		//상점주인이름
		StoreQnaVO qnaVO = new StoreQnaVO();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		
		

		
		
		mv.addObject("mem_storeNum",mem_storeNum);//파라미터  모든 상점 페이지는 storeNum으로 들어가야함,
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/favorites");
		return mv;
	}
	
	//상점후기
	@GetMapping("reviews")
	public ModelAndView reviews(ModelAndView mv,HttpSession session,long mem_storeNum) throws Exception {
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		//상점주인이름
		StoreQnaVO qnaVO = new StoreQnaVO();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름

		mv.addObject("mem_storeNum",mem_storeNum);//파라미터  모든 상점 페이지는 storeNum으로 들어가야함,
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/reviews");
		return mv;
	}
	//팔로잉
	@GetMapping("followings")
	public ModelAndView followings(ModelAndView mv,HttpSession session,long mem_storeNum) throws Exception {
		
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		
		//상점주인이름
		StoreQnaVO qnaVO = new StoreQnaVO();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		
		

		mv.addObject("mem_storeNum",mem_storeNum);//파라미터  모든 상점 페이지는 storeNum으로 들어가야함,
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/followings");
		return mv;
	}
	
	//파ㅣㄹ로워ㅗ
	@GetMapping("followers")
	public ModelAndView followers(ModelAndView mv,HttpSession session,long mem_storeNum) throws Exception {
		
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		
		//상점주인이름.
		StoreQnaVO qnaVO = new StoreQnaVO();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		
		
		
		
		mv.addObject("mem_storeNum",mem_storeNum);//파라미터  모든 상점 페이지는 storeNum으로 들어가야함,
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/followers");
		return mv;
	}
	
	
}
