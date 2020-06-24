//package com.iu.s1.shop.qna;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.iu.s1.member.MemberVO;
//
//@Controller
//@RequestMapping("/shop2/**")
//public class StoreQnaController {
//	
//	@Autowired
//	private StoreQnaService storeQnaService;
//
//	// 여기는 다른사람 상점 들어갈때 .
//	// 들어갈때마다 모든사람의 파라미터 받아서 출력.
//	// member의 storeNum을 받아서
//	
//	@GetMapping("myshop2")
//	public ModelAndView myshop2(ModelAndView mv, long mem_storeNum,String mem_storeName) throws Exception {
//		
//		mv.addObject("mem_storeNum",mem_storeNum);
//		mv.addObject("mem_storeName",mem_storeName);
//		
//		mv.setViewName("shop2/myshop2");
//		return mv;
//	}
//		
//	//상점문의    받은 파라미터로
//	@GetMapping("comments2")
//	public ModelAndView comments2(ModelAndView mv,StoreQnaVO storeQnaVO,HttpSession session,long mem_storeNum,String mem_storeName) throws Exception {
//		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
//		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
//		
////		String id = "cotest";
//		String id = mem_storeName; //파라미터
////		long num = 25;
//		long num = mem_storeNum; // 파라미터
//		
//		
////		storeQnaVO.setMem_storeNum(num); // 멤버의 mem_storeNum을 저장.
//		storeQnaVO.setMem_storeNum(num); //  일단 임시방편
//		
////		storeQnaVO.setSq_storeName(mem_storeName);  없애봐
//		
//		List<StoreQnaVO> ar = storeQnaService.getSelectListQna(storeQnaVO);
//		
//		mv.addObject("mem_storeNum",num);
//		mv.addObject("mem_storeName",id);
//		mv.addObject("msname",msname);
//		mv.addObject("msnum",msnum);
//		mv.addObject("list",ar);
//		mv.setViewName("shop2/comments2");
//		return mv;
//	}
//	
//	
//	// 찜목록
//		@GetMapping("favorites2")
//		public ModelAndView favorites2(ModelAndView mv,HttpSession session,long mem_storeNum,String mem_storeName) throws Exception {
////			String id = ((MemberVO)session.getAttribute("member")).getMem_storeName();
////			long num = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
//			String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
//			long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
//			
//			mv.addObject("mem_storeNum",mem_storeNum);
//			mv.addObject("mem_storeName",mem_storeName);
//			mv.addObject("msname",msname);
//			mv.addObject("ms_num",msnum);
//			
//			mv.setViewName("shop2/favorites2");
//			return mv;
//		}
//		
//		//상점후기
//		@GetMapping("reviews2")
//		public ModelAndView reviews(ModelAndView mv,HttpSession session,long mem_storeNum,String mem_storeName) throws Exception {
//			String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
//			long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
//			
//			mv.addObject("mem_storeNum",mem_storeNum);
//			mv.addObject("mem_storeName",mem_storeName);
//			mv.addObject("msname",msname);
//			mv.addObject("ms_num",msnum);
//			
//			mv.setViewName("shop2/reviews2");
//			return mv;
//		}
//		//팔로잉
//		@GetMapping("followings2")
//		public ModelAndView followings(ModelAndView mv,HttpSession session,long mem_storeNum,String mem_storeName) throws Exception {
//			String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
//			long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
//			
//			mv.addObject("mem_storeNum",mem_storeNum);
//			mv.addObject("mem_storeName",mem_storeName);
//			mv.addObject("msname",msname);
//			mv.addObject("ms_num",msnum);
//			
//			mv.setViewName("shop2/followings2");
//			return mv;
//		}
//		
//		//파ㅣㄹ로워ㅗ
//		@GetMapping("followers2")
//		public ModelAndView followers(ModelAndView mv,HttpSession session,long mem_storeNum,String mem_storeName) throws Exception {
//			String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
//			long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
//			
//			mv.addObject("mem_storeNum",mem_storeNum);
//			mv.addObject("mem_storeName",mem_storeName);
//			mv.addObject("msname",msname);
//			mv.addObject("ms_num",msnum);
//			
//			mv.setViewName("shop2/followers2");
//			return mv;
//		}
//	
//	
//
//}



//난중에 지울것
