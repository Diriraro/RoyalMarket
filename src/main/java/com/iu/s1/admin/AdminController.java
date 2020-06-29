package com.iu.s1.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

//import java.util.ArrayList;
//import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.s1.ProductVO;
import com.iu.s1.member.MemberVO;
import com.iu.s1.notice.NoticeVO;
import com.iu.s1.visitor.VisitorVO;

@Controller
@RequestMapping("/admin/**/")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@GetMapping("adminPage")
	public String adminPage() throws Exception {
		return "admin/adminPage";
	}
	
	// Dash Board
	@GetMapping("getDashBoard")
	public void getDashBoard(Model model) throws Exception {
		// DashBoard 에서 필요한 데이터는 model 로 key,value 형태로 DashBoard에 addAttribute
		double memberCount = (double) adminService.getMemberCount();
		double dailyNewMemberCount = (double) adminService.getDailyNewMember();
		long rate = (long) ((dailyNewMemberCount / memberCount) * 100);
		long rate2 = 0;
		List<NoticeVO> ar = adminService.getNoticeList();
		VisitorVO visitorVO = adminService.getTodayVisitorCount();
		VisitorVO visitorVO2 = adminService.getlastVisitorCount();
		if (visitorVO2.getCount() == 0) {
			rate2 = 100;
		} else {
			rate2 = (long) ((visitorVO.getCount() * 100) / visitorVO2.getCount());
		}
		model.addAttribute("visitors", visitorVO.getCount());
		model.addAttribute("dailyRate", (int) rate2);
		model.addAttribute("increaseRate", rate);
		model.addAttribute("memberCount", (int) memberCount);
		model.addAttribute("list", ar);
		
	}
	
	// Member
	@GetMapping("getMemberList")
	public void getMemberList(Model model, MemberVO memberVO, long handling) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
		// handling == 0 일시,  해당 access에 대한 리스트만 출력
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
		} else if (handling == 1) { // handling == 1 일시,  회원로그인 차단/허용 관리 
			long mem_access = memberVO.getMem_access();
			ar = adminService.getMemberList(mem_access);
			if (memberVO.getMem_access() == 1) {
				memberVO.setMem_access(0);
			} else if (memberVO.getMem_access() == 0) {
				memberVO.setMem_access(1);
			}
			int result = adminService.accessManage(memberVO);
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
		if(mem_access == 1) {
			check = "denied";
		}
		model.addAttribute("check", check);
		model.addAttribute("list", ar);
	}
	
	// Product 
	@GetMapping("getProductList")
	public void getProductList(Model model) throws Exception {
		List<ProductVO> ar = new ArrayList<ProductVO>();
//		ar = adminService.getProductList();
		model.addAttribute("list", ar);
	}
	
	// Qna
	@GetMapping("getQnaList")
	public void getQnaList(Model model) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
//		ar = adminService.getQnaList();
		model.addAttribute("list", ar);
	}
	@GetMapping("getManToManList")
	public void getManToManList(Model model) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
//		ar = adminService.getManToManList();
		model.addAttribute("list", ar);
	}
	
	// Notice
	@GetMapping("getNoticeList")
	public void getNoticeList(Model model) throws Exception {
		List<NoticeVO> ar = new ArrayList<NoticeVO>();
		ar = adminService.getNoticeList();
		model.addAttribute("list", ar);
	}



}
