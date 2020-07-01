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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.ProductVO;
import com.iu.s1.member.MemberVO;
import com.iu.s1.notice.NoticeVO;
import com.iu.s1.qna.QnaService;
import com.iu.s1.qna.QnaVO;
import com.iu.s1.qna.file.QnaFileVO;


@Controller
@RequestMapping("/admin/**/")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("adminPage")
	public String adminPage() throws Exception {
		return "admin/adminPage";
	}
	
	@GetMapping("getNoticeList") 
	public void getNoticeList (Model model) throws Exception {
		List<NoticeVO> ar = new ArrayList<NoticeVO>();
		ar = adminService.getNoticeList();
		model.addAttribute("list",ar);
	}
	
	@GetMapping("getProductList")
	public void getProductList (Model model) throws Exception {
		List<ProductVO> ar = new ArrayList<ProductVO>();
//		ar = adminService.getProductList();
		model.addAttribute("list",ar);
	}
	
	@GetMapping("getMemberList")
	public void getMemberList (Model model, long mem_access) throws Exception {
		System.out.println(mem_access);
		List<MemberVO> ar = new ArrayList<MemberVO>();
		ar = adminService.getMemberList(mem_access);
		String check = "";
		if(mem_access == 0) {
			check = "accept";
		} else if (mem_access == 1){
			check = "denied";
		}
		model.addAttribute("check",check);
		model.addAttribute("list",ar);
	}
	
	@PostMapping("getMemberList")
	public void getMemberList (Model model, String kind, String search, int mem_access) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
		ar = adminService.getMemberSearchList(kind, search, mem_access);
		model.addAttribute("check","accept");
		model.addAttribute("list",ar);
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
		model.addAttribute("qna_adlist", ar2);
		model.addAttribute("list",ar);
	}
	@GetMapping("getQnaList")
	public void getQnaList(Model model) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
//		ar = adminService.getQnaList();
		model.addAttribute("list",ar);
	}
	@GetMapping("getDashBoard")
	public void getDashBoard(Model model) throws Exception {
		// DashBoard 에서 필요한 데이터는 model 로 key,value 형태로 DashBoard에 addAttribute
		double memberCount = (double)adminService.getMemberCount();
		double dailyNewMemberCount = (double)adminService.getDailyNewMember();
		long rate = (long)((dailyNewMemberCount/memberCount)*100);
		List<NoticeVO> ar = adminService.getNoticeList();
		model.addAttribute("increaseRate", rate);
		model.addAttribute("memberCount",(int)memberCount);
		model.addAttribute("list",ar);
		
	}
	@GetMapping("qnaAnswer")
	public void qnaAnswer(long qna_num, Model model)throws Exception{
//		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = new QnaVO();
		qnaVO = qnaService.selectQna(qna_num);
		List<QnaFileVO> qnaFileVOs = qnaService.selectQnaFile(qna_num);
		model.addAttribute("qvo", qnaVO);
		model.addAttribute("qfvo", qnaFileVOs);
	}
	
	@PostMapping("qnaAnswer")
	public void qnaAnswer(QnaVO qnaVO, Model model)throws Exception{
		int result = qnaService.qnaAnswer(qnaVO);
	}
	
	@PostMapping("getManToManList")
	public void qnaMemberSearch(Model model, String search)throws Exception{
		if(search==null) {
			search="";
		}
		List<QnaVO> ar = qnaService.qnaMemberSearch(search);
		List<QnaVO> ar2 = qnaService.qnaAdminList();
		for (QnaVO qnaVO : ar2) {
			int fileCheck = qnaService.fileCheck(qnaVO.getQna_num());
			qnaVO.setFileCheck(fileCheck);
		}
		model.addAttribute("qna_adlist", ar2);
		model.addAttribute("list",ar);
	}
	
	@PostMapping("getNoticeList")
	public void getNoticeList(Model model, String search)throws Exception{
		if(search==null) {
			search="";
		}
		List<NoticeVO> ar = adminService.noticeTitleSearch(search);
		model.addAttribute("list", ar);
	}
}
