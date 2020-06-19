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

import com.iu.s1.NoticeVO;
import com.iu.s1.ProductVO;
import com.iu.s1.member.MemberVO;


@Controller
@RequestMapping("/admin/**/")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("adminPage")
	public String adminPage() throws Exception {
		return "admin/adminPage";
	}
	
	@GetMapping("getNoticeList")
	public void getNoticeList (Model model) throws Exception {
		List<NoticeVO> ar = new ArrayList<NoticeVO>();
//		ar = noticeService.getNoticeList();
		model.addAttribute("list",ar);
	}
	
	@GetMapping("getProductList")
	public void getProductList (Model model) throws Exception {
		List<ProductVO> ar = new ArrayList<ProductVO>();
//		ar = adminService.getProductList();
		model.addAttribute("list",ar);
	}
	
	@GetMapping("getMemberList")
	public void getMemberList (Model model) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
		ar = adminService.getMemberList();
		model.addAttribute("list",ar);
	}
	
	@PostMapping("getMemberList")
	public void getMemberList (Model model, String kind, String search) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
		ar = adminService.getMemberSearchList(kind, search);
		for(int i = 0 ; i < ar.size(); i++) {
			System.out.println("Post :" + ar.get(i).getMem_id());
		}
		model.addAttribute("list",ar);
	}
	
	
}
