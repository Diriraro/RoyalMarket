package com.iu.s1.shop;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.jaxen.function.FloorFunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.member.MemberService;
import com.iu.s1.member.MemberVO;
import com.iu.s1.product.ProductService;
import com.iu.s1.product.ProductVO;
import com.iu.s1.product.productFile.ProductFileVO;
import com.iu.s1.product.zzim.ZzimVO;
import com.iu.s1.shop.follow.StoreFollowService;
import com.iu.s1.shop.follow.StoreFollowVO;
import com.iu.s1.shop.qna.StoreQnaService;
import com.iu.s1.shop.qna.StoreQnaVO;
import com.iu.s1.shop.review.StoreReviewService;
import com.iu.s1.shop.review.StoreReviewVO;
import com.iu.s1.shop.review.reviewFile.StoreReviewFileVO;

@Controller
@RequestMapping("/shop/**")
public class ShopController {
	@Autowired
	private StoreQnaService storeQnaService;
	@Autowired
	private StoreFollowService storeFollowService;
	@Autowired
	private StoreReviewService storeReviewService;
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	
			
	// 내상점 누르면 기본으로 상품페이지 출력
	@GetMapping("myshop")
	public ModelAndView myshop(ModelAndView mv,HttpSession session,long mem_storeNum) throws Exception {
		
		StoreQnaVO qnaVO = new StoreQnaVO();
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		
		/// 팔로우영역
		long give_storeNum=msnum;
		long take_storeNum=mem_storeNum;
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
		storeFollowVO = storeFollowService.selectnum(give_storeNum,take_storeNum);
		//System.out.println(storeFollowVO+"::::::: 팔로우 번호 확인  없으면 널 있으면 번호생성");
		mv.addObject("fonum",storeFollowVO); // 팔로우번호 있으면 전송 없으면 null
		///  팔로우영역
		
		// 상품 리스트 영역
		List<ProductVO> par = productService.myList(mem_storeNum);
		// 상품리스트 사진 추력
		List<ProductFileVO> productFileVOs = new ArrayList<ProductFileVO>();
		for(ProductVO productVO2 : par) {
			long sell_num = productVO2.getSell_num();
			
			productFileVOs.addAll(productService.productFileSelect2(sell_num));
		}
		
		// 공유하는것들
			countall(mv,mem_storeNum);
			grade(mv, mem_storeNum);
			getregDate(mv, mem_storeNum);
			mdata(mv, mem_storeNum);
			
		// 
		
		mv.addObject("pfile", productFileVOs); // 상품들의  사진 출력
		mv.addObject("mylist", par);
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
		
		List<StoreQnaVO> car = storeQnaService.getSelectListQna(storeQnaVO);
		for (StoreQnaVO qnaVO :car) {
			qnaVO.setMem_storeName(storeQnaService.getSelectStoreName(qnaVO));// 작성자의 번호로 이름을 출력 한것을 ar안에 담고.
			
		}
		
		// 상점주인이름
		StoreQnaVO qnaVO = new StoreQnaVO();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		//
		
		/// 팔로우영역
		long give_storeNum=msnum;
		long take_storeNum=mem_storeNum;
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
		storeFollowVO = storeFollowService.selectnum(give_storeNum,take_storeNum);
		//System.out.println(storeFollowVO+"::::::: 팔로우 번호 확인  없으면 널 있으면 번호생성");
		
		mv.addObject("fonum",storeFollowVO); // 팔로우번호 있으면 전송 없으면 null
			
		///  팔로우영역
		
		
		// 공유
					countall(mv,mem_storeNum);
					grade(mv, mem_storeNum);
					getregDate(mv, mem_storeNum);
					mdata(mv, mem_storeNum);
		// 
		
		
		
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		mv.addObject("mem_storeNum",mem_storeNum);
		mv.addObject("colist",car);
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
		//
		
		/// 팔로우영역
		long give_storeNum=msnum;
		long take_storeNum=mem_storeNum;
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
		storeFollowVO = storeFollowService.selectnum(give_storeNum,take_storeNum);
		//System.out.println(storeFollowVO+"::::::: 팔로우 번호 확인  없으면 널 있으면 번호생성");
		
		mv.addObject("fonum",storeFollowVO); // 팔로우번호 있으면 전송 없으면 null
			
		///  팔로우영역
		
		// 찜 리스트
		List<ZzimVO> zar = productService.myzzim(mem_storeNum);
		List<ProductFileVO> f = new ArrayList<>();
		for (ZzimVO zzimVO :zar) {
			zzimVO.setSell_product(productService.getsell_product(zzimVO));
			zzimVO.setFile_name(productService.selectFileName(zzimVO.getSell_num()));
			zzimVO.setSell_price(productService.getsell_price(zzimVO));
			String ss=	 memberService.mdata(productService.getmem_storeNum(zzimVO)).getMem_address();
			zzimVO.setMem_address(ss);
			// 주소를 가져와라
			
		}
		
		
		// 찜 리스트 끝
		
		// 공유
					countall(mv,mem_storeNum);
					grade(mv, mem_storeNum);
					getregDate(mv, mem_storeNum);
					mdata(mv, mem_storeNum);
				// 
		
		
		
		mv.addObject("zilist",zar);
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
		
		/// 팔로우영역
		long give_storeNum=msnum;
		long take_storeNum=mem_storeNum;
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
		storeFollowVO = storeFollowService.selectnum(give_storeNum,take_storeNum);
		//System.out.println(storeFollowVO+"::::::: 팔로우 번호 확인  없으면 널 있으면 번호생성");
		
		mv.addObject("fonum",storeFollowVO); // 팔로우번호 있으면 전송 없으면 null
			
		///  팔로우영역 끝
		
		// 공유
					
					grade(mv, mem_storeNum);
					countall(mv,mem_storeNum);
					getregDate(mv, mem_storeNum);
					mdata(mv, mem_storeNum);
				// 
		
		
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		mv.addObject("mem_storeNum",mem_storeNum);//파라미터  모든 상점 페이지는 storeNum으로 들어가야함,
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		
		mv.setViewName("shop/reviews");
		return mv;
	}
	//팔로잉  상점 주인이 친추한거
	@GetMapping("followings")
	public ModelAndView followings(ModelAndView mv,HttpSession session,long mem_storeNum) throws Exception {
		
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		
		//상점주인이름
		StoreQnaVO qnaVO = new StoreQnaVO();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
		//
		
		/// 팔로우영역
		long give_storeNum=msnum;
		long take_storeNum=mem_storeNum;
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
		storeFollowVO = storeFollowService.selectnum(give_storeNum,take_storeNum);
		//System.out.println(storeFollowVO+"::::::: 팔로우 번호 확인  없으면 널 있으면 번호생성");
		
		mv.addObject("fonum",storeFollowVO); // 팔로우번호 있으면 전송 없으면 null   팔로우, 언팔 기능 이용하기위해
			
		///  팔로우영역 끝
		
		// 팔로우 리스트 영역     <<<<<<<
		StoreFollowVO storeFollowVO2 = new StoreFollowVO();
		storeFollowVO2.setGive_storeNum(mem_storeNum); //파라미터의 번호로 팔로우 리스트 확인
		
		List<StoreFollowVO> owiar = storeFollowService.getSelectListFollowers(storeFollowVO2);
		for (StoreFollowVO storeFollowVO3 :owiar) {
			storeFollowVO3.setTake_storeName(storeFollowService.getSelecttakeStoreName(storeFollowVO3));// 작성자의 번호로 이름을 출력 한것을 ar안에 담고.
		}	
		// 팔로우 리스트 영역 끝
		
		
		// 공유
					countall(mv,mem_storeNum);
					grade(mv, mem_storeNum);
					getregDate(mv, mem_storeNum);
					mdata(mv, mem_storeNum);
				// 

		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		mv.addObject("mem_storeNum",mem_storeNum);//파라미터  모든 상점 페이지는 storeNum으로 들어가야함,
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		mv.addObject("owilist",owiar);// 팔로잉 리스트
		
		mv.setViewName("shop/followings");
		return mv;
	}
	
	//팔로워    상점주인이 친추 받은거
	@GetMapping("followers")
	public ModelAndView followers(ModelAndView mv,HttpSession session,long mem_storeNum) throws Exception {
		
		String msname = ((MemberVO)session.getAttribute("member")).getMem_storeName();
		long msnum = ((MemberVO)session.getAttribute("member")).getMem_storeNum();
		
		
		//상점주인이름.
		StoreQnaVO qnaVO = new StoreQnaVO();
		qnaVO.setSq_storeNum(mem_storeNum);
		String para = storeQnaService.getSelectStoreName(qnaVO); // mem_storeNum의 상점 이름 출력
//
		
		/// 팔로우영역
		long give_storeNum=msnum;
		long take_storeNum=mem_storeNum;
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
		storeFollowVO = storeFollowService.selectnum(give_storeNum,take_storeNum);
		//System.out.println(storeFollowVO+"::::::: 팔로우 번호 확인  없으면 널 있으면 번호생성");
		
		mv.addObject("fonum",storeFollowVO); // 팔로우번호 있으면 전송 없으면 null
			
		///  팔로우영역
		
		// 팔로워 리스트 영역     <<<<<<<
		StoreFollowVO storeFollowVO2 = new StoreFollowVO();
		storeFollowVO2.setTake_storeNum(mem_storeNum); //파라미터의 번호로 팔로우 리스트 확인
		
		List<StoreFollowVO> owear = storeFollowService.getSelectListFollowings(storeFollowVO2);
		for (StoreFollowVO storeFollowVO3 :owear) {
			storeFollowVO3.setGive_storeName(storeFollowService.getSelectgiveStoreName(storeFollowVO3));// 작성자의 번호로 이름을 출력 한것을 ar안에 담고.
		}	
		// 팔로워 리스트 영역 끝
		
		
		// 공유
					countall(mv,mem_storeNum);
					grade(mv, mem_storeNum);
					getregDate(mv, mem_storeNum);
					mdata(mv, mem_storeNum);
				// 
		
		
		mv.addObject("mem_storeName",para); // 파라미터의 상점이름
		mv.addObject("mem_storeNum",mem_storeNum);//파라미터  모든 상점 페이지는 storeNum으로 들어가야함,
		mv.addObject("msname",msname);
		mv.addObject("msnum",msnum);
		mv.addObject("owelist",owear);// 팔로워 리스트
		
		mv.setViewName("shop/followers");
		return mv;
	}
	
	
	
	//============================================================================================
	
	// 팔로우 인설트, 딜리트 할때 주소를 현재주소로 오게끔 바꾸기	
	@RequestMapping(value = "setinsertFollow", method = RequestMethod.GET)
	public ModelAndView setInsertFollow(long give_storeNum,long take_storeNum,long mem_storeNum, ModelAndView mv,HttpServletRequest request)throws Exception{
		// 이전페이지 주소찾기
		String referer = request.getHeader("referer");
		System.out.println(referer+" ㄴㅇㄹㄴㅇㄹㄴㅇㄹ");
		//이전페이지 주소찾기 끝
		
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
//		
		storeFollowVO.setGive_storeNum(give_storeNum); // 파라미터 세팅
		storeFollowVO.setTake_storeNum(take_storeNum); // 파리미터 세팅
//		
		int result = storeFollowService.setInsertFollow(storeFollowVO); // 받아온 파라미터로 삽입
//		
		//mv.setViewName("redirect:./myshop?mem_storeNum="+mem_storeNum);
		mv.setViewName("redirect:"+referer);    // 마지막 요청한 페이지로
	
	
		return mv;
	}
	
	@RequestMapping(value = "setDeleteFollow", method = RequestMethod.GET)
	public ModelAndView setDeleteFollow(long mem_storeNum, ModelAndView mv,long follow_Num,HttpServletRequest request)throws Exception{
		
		// 이전페이지 주소찾기
		String referer = request.getHeader("referer");
		System.out.println(referer+" ㄴㅇㄹㄴㅇㄹㄴㅇㄹ");
		//이전페이지 주소찾기 끝

		
		StoreFollowVO storeFollowVO = new StoreFollowVO();
//		
		storeFollowVO.setFollow_Num(follow_Num);
		
		int result2= storeFollowService.setDeleteFollow(storeFollowVO); // 팔로우번호 받아와서 지우기
//		
		//mv.setViewName("redirect:./myshop?mem_storeNum="+mem_storeNum);
		
		mv.setViewName("redirect:"+referer);    // 마지막 요청한 페이지로
	
	
		return mv;
	}
	
	// 모든 카운트
	public ModelAndView countall(ModelAndView mv,long mem_storeNum) throws Exception{
		
		// count//
				long reco = storeReviewService.reco(mem_storeNum);
				long giveco = storeFollowService.giveco(mem_storeNum);
				long takeco = storeFollowService.takeco(mem_storeNum);
				long prodco = productService.prodco(mem_storeNum);
				long zico = productService.zico(mem_storeNum);
				long coco = storeQnaService.coco(mem_storeNum);
				
				
				mv.addObject("coco",coco);
				mv.addObject("reco",reco);
				mv.addObject("giveco",giveco);
				mv.addObject("takeco",takeco);
				mv.addObject("prodco",prodco);
				mv.addObject("zico",zico);
				
				//conut//
		
		return mv;
	}
	// 평점구하기 or 사진
	public ModelAndView grade(ModelAndView mv, long mem_storeNum)throws Exception{
		
		// 리뷰 리스트 확인    ******
				StoreReviewVO storeReviewVO = new StoreReviewVO();
				storeReviewVO.setMem_storeNum(mem_storeNum);
				List<StoreReviewVO> rear = storeReviewService.getSelectListReview(storeReviewVO);
				
				//리뷰 사진 출력 : 리뷰 번호와 연결해서    // 뒤에 값 조정 하기     두개이상일떄 확인하기 나오는지 
				List<StoreReviewFileVO> storeReviewFileVOs = new ArrayList<StoreReviewFileVO>();
				
				double sum = 0.0;
				double avg = 0.0;
				int check = 0;
				
				for (StoreReviewVO storeReviewVO2 :rear) {
					long sss= storeReviewVO2.getRe_num();
					storeReviewFileVOs.addAll(storeReviewService.reviewFileSelect(sss));
					// 평점계산하기
					check++;
					sum = sum+storeReviewVO2.getRe_rate();
				}
				avg = sum / check;
				avg = Math.round(avg*10);
				avg = avg/10.0;
				
				int ban = (int)Math.round(avg);
				int flo = (int)Math.floor(avg); // 내림 정수
				
				// avg 0.0 - flo2 0.0  
				double flo2 = 0.0;
				flo2 = Math.round(avg-flo);
				
				int flo3 = (int)Math.round(flo2);
				
				
				mv.addObject("flo",flo); // 내림
				mv.addObject("ban",ban); // 반올림
				mv.addObject("avg", avg); // 평균
				mv.addObject("substar",flo3);// 반별
				
				mv.addObject("pfile", storeReviewFileVOs); // store 사진 출력
				mv.addObject("relist",rear);
				// 리뷰 리스트 끝*******
		
		
		
		
		return mv;
	}
	
	// 날짜
	public ModelAndView getregDate(ModelAndView mv, long mem_storeNum)throws Exception{
			
		mv.addObject("getregDate" ,memberService.getregDate(mem_storeNum));
		//// getregDate   getregDate   getregDate
		return mv;
	}
	
	// 멤버데이터
	public ModelAndView mdata(ModelAndView mv, long mem_sotreNum) throws Exception{
		mv.addObject("mdata", memberService.mdata(mem_sotreNum));
		return mv;
	}
	
	
	
	
	
}
