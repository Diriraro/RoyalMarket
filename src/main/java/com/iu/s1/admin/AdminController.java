package com.iu.s1.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;

//import java.util.ArrayList;
//import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iu.s1.member.MemberVO;
import com.iu.s1.notice.NoticeVO;
import com.iu.s1.paymentHistory.ProfitVO;
import com.iu.s1.product.ProductService;
import com.iu.s1.product.ProductVO;
import com.iu.s1.qna.QnaService;
import com.iu.s1.qna.QnaVO;
import com.iu.s1.qna.file.QnaFileVO;
import com.iu.s1.trading.TradingVO;
import com.iu.s1.util.Pager;
import com.iu.s1.visitor.VisitorVO;

@Controller
@RequestMapping("/admin/**/")
public class AdminController {
	@Autowired
	private ProductService productService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private QnaService qnaService;

	@GetMapping("adminPage")
	public String adminPage(Model model) throws Exception {
		long qnaCount = adminService.qnaCount();
		long qnaNACount = adminService.qnaNACount();

		boolean check = false;
		if (qnaNACount > 0) {
			check = true;
		}
		model.addAttribute("check", check);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("qnaNACount", qnaNACount);
		return "admin/adminPage";
	}

	// Dash Board
	@GetMapping("getDashBoard")
	public void getDashBoard(Model model) throws Exception {
		// DashBoard 에서 필요한 데이터는 model 로 key,value 형태로 DashBoard에 addAttribute
		// 회원 수
		double memberCount = (double) adminService.getMemberCount();
		double dailyNewMemberCount = (double) adminService.getDailyNewMember();
		long rate = (long) ((dailyNewMemberCount / memberCount) * 100);
		long rate2 = 0;
		model.addAttribute("increaseRate", rate);
		model.addAttribute("memberCount", (int) memberCount);

		// 공지사항 리스트 (최신순 2개만 출력함)
		List<NoticeVO> ar = adminService.getNoticeList();
		model.addAttribute("list", ar);

		// 방문자 수
		VisitorVO visitorVO = adminService.getTodayVisitorCount();
		VisitorVO visitorVO2 = adminService.getlastVisitorCount();
		if (visitorVO2.getCount() == 0) {
			rate2 = 100;
		} else {
			rate2 = (long) ((visitorVO.getCount() * 100) / visitorVO2.getCount());
		}
		if (rate2 > 100) {
			rate2 = 100;
		}
		model.addAttribute("visitors", visitorVO.getCount());
		model.addAttribute("dailyRate", (int) rate2);

		// 문의수 , 미답변수
		long qnaCount = adminService.qnaCount();
		long qnaNACount = adminService.qnaNACount();

		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("qnaNACount", qnaNACount);

		// 당일 거래량 및 지역별 거래량, 총 회사 수익
		List<Map.Entry<String, Long>> tradeAr = adminService.getLocateTradeCount();
		List<ProfitVO> profitAr = new ArrayList<ProfitVO>();
		profitAr = adminService.getProfit();
		
		long tradeCount = 0;
		if (adminService.getDailyTradeCount() != null) {
			tradeCount = adminService.getDailyTradeCount();
		}
		long tradeCountYD = 0;
		if (adminService.getRateForTradeCountYD() != null) {
			tradeCountYD = adminService.getRateForTradeCountYD();
		}
		long tradeRate = 0;
		if (tradeCountYD != 0 && tradeCount != 0) {
			tradeRate = (long) (((double) tradeCount / (double) tradeCountYD) * 100);
		} else if (tradeCountYD == 0 && tradeCount > 0) {
			tradeRate = 100;
		}
		if (tradeRate > 100) {
			tradeRate = 100;
		}
		model.addAttribute("tradeRate", tradeRate);
		model.addAttribute("tradeCount", tradeCount);
		model.addAttribute("tradeAr", tradeAr);
		model.addAttribute("profitAr", profitAr);

		// 상품
		List<ProductVO> proList = adminService.productRecentList();
		List<String> proFileList = new ArrayList<String>();
		int index = 0;
		for (ProductVO productVOs : proList) {
			long sell_num = productVOs.getSell_num();
			proFileList.add(productService.selectFileName(sell_num));
			index++;
		}
		model.addAttribute("productFileMain", proFileList);
		model.addAttribute("productList", proList);
	}

	// Member
	@GetMapping("getMemberList")
	public void getMemberList(Model model, MemberVO memberVO, long handling) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
		// handling == 0 일시, 해당 access에 대한 리스트만 출력
		if (handling == 0) {
			long mem_access = memberVO.getMem_access();
			ar = adminService.getMemberList(mem_access);
			String check = "";
			if (mem_access == 0) {
				check = "accept";
			} else if (mem_access == 1) {
				check = "denied";
			}
			model.addAttribute("check", check);
			model.addAttribute("list", ar);
		} else if (handling == 1) { // handling == 1 일시, 회원로그인 차단/허용 관리
			long mem_access = memberVO.getMem_access();
			if (memberVO.getMem_access() == 1) {
				memberVO.setMem_access(0);
			} else if (memberVO.getMem_access() == 0) {
				memberVO.setMem_access(1);
			}
			adminService.accessManage(memberVO);
			ar = adminService.getMemberList(mem_access);
			String check = "";
			if (mem_access == 0) {
				check = "accept";
			} else if (mem_access == 1) {
				check = "denied";
			}
			model.addAttribute("check", check);
			model.addAttribute("list", ar);
		}
	}

	@PostMapping("getMemberList")
	public void getMemberList(Model model, String kind, String search, int mem_access) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
		ar = adminService.getMemberSearchList(kind, search, mem_access);
		String check = "accept";
		if (mem_access == 1) {
			check = "denied";
		}
		model.addAttribute("check", check);
		model.addAttribute("list", ar);
	}

	// Product
	@GetMapping("getProductList")
	public void productList(Model model, @DefaultValue(value = "1") long curPage, Pager pager) throws Exception {
		pager.setCurPage(curPage);
		List<ProductVO> ar = new ArrayList<ProductVO>();
		ar = adminService.productList(pager);
		model.addAttribute("list", ar);
	}

	@GetMapping("productDelete")
	public void productDelete(ProductVO productVO, Model model) throws Exception {
		int result = adminService.productDelete(productVO);
		model.addAttribute("result", result);
	}

	@GetMapping("getTradingProductList")
	public void tradingList(Model model, Pager pager) throws Exception {
		List<TradingVO> tradeVO = adminService.tradingList(pager);
		model.addAttribute("list", tradeVO);
	}

	// Qna
	@GetMapping("getQnaList")
	public void getQnaList(Model model) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
//		ar = adminService.getQnaList();
		model.addAttribute("list", ar);
	}

	@GetMapping("qnaAnswer")
	public void qnaAnswer(long qna_num, Model model) throws Exception {
//		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = new QnaVO();
		qnaVO = qnaService.selectQna(qna_num);
		List<QnaFileVO> qnaFileVOs = qnaService.selectQnaFile(qna_num);
		model.addAttribute("qvo", qnaVO);
		model.addAttribute("qfvo", qnaFileVOs);
	}

	@PostMapping("qnaAnswer")
	public void qnaAnswer(QnaVO qnaVO, Model model) throws Exception {
		int result = qnaService.qnaAnswer(qnaVO);
	}

	@GetMapping("getManToManList")
	public void getManToManList(Model model) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
//		ar = adminService.getManToManList();
		List<QnaVO> ar2 = qnaService.qnaAdminList();
		for (QnaVO qnaVO : ar2) {
			int fileCheck = qnaService.fileCheck(qnaVO.getQna_num());
			qnaVO.setFileCheck(fileCheck);
		}
		long qnaNACount = adminService.qnaNACount();

		boolean check = false;
		if (qnaNACount > 0) {
			check = true;
		}

		model.addAttribute("check", check);
		model.addAttribute("qna_adlist", ar2);
		model.addAttribute("list", ar);
	}

	@PostMapping("getManToManList")
	public void qnaMemberSearch(Model model, String search) throws Exception {
		if (search == null) {
			search = "";
		}
		List<QnaVO> ar = qnaService.qnaMemberSearch(search);
//		List<QnaVO> ar2 = qnaService.qnaAdminList();
//		for (QnaVO qnaVO : ar2) {
//			int fileCheck = qnaService.fileCheck(qnaVO.getQna_num());
//			qnaVO.setFileCheck(fileCheck);
//		}
//		model.addAttribute("list", ar);

		model.addAttribute("qna_adlist", ar);
	}

	// Notice
	@GetMapping("getNoticeList")
	public void getNoticeList(Model model) throws Exception {
		List<NoticeVO> ar = new ArrayList<NoticeVO>();
		ar = adminService.getNoticeList2();
		model.addAttribute("list", ar);
	}

	@PostMapping("getNoticeList")
	public void getNoticeList(Model model, String search) throws Exception {
		if (search == null) {
			search = "";
		}
		List<NoticeVO> ar = adminService.noticeTitleSearch(search);
		model.addAttribute("list", ar);
	}
}
