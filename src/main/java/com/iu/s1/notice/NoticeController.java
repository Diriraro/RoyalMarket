package com.iu.s1.notice;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.notice.NoticeVO;
import com.iu.s1.qna.QnaService;
import com.iu.s1.qna.QnaVO;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("noticeList")
	public ModelAndView noticeList()throws Exception{	//list 받아오기 기본문법
		ModelAndView mv = new ModelAndView();
		List<NoticeVO> ar = noticeService.noticeList();
		List<QnaVO> ar2 = qnaService.qnaAdminList();
		mv.addObject("no_list", ar);
		mv.addObject("test", ar2);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	@GetMapping("noticeWrite")
	public ModelAndView noticeWrite()throws Exception{	//write getmapping 기본문법
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeVO", new NoticeVO());
		mv.setViewName("notice/noticeWrite");
		return mv;
	}
	
	@PostMapping("noticeWrite")							//write postmapping 에러확인/등록확인
	public void noticeWrite(@Valid NoticeVO noticeVO, BindingResult bindingResult, Model model)throws Exception{
		String alert="";
		
		if(bindingResult.hasErrors()) { //에러 검증하는 방법은 NoticeVO가서 하기
			alert="에러발생";
		}else {
			int result = noticeService.noticeWrite(noticeVO);
			alert="공지 작성 완료";
		}
		model.addAttribute("result", alert);
	}
	
	@RequestMapping(value = "noticeDelete")
	public void noticeDelete(long nonum)throws Exception{
		noticeService.noticeDelete(nonum);
	}
	
//	@PostMapping("noticeWrite")							//write postmapping 에러확인/등록확인
//	public ModelAndView noticeWrite(@Valid NoticeVO noticeVO, BindingResult bindingResult)throws Exception{
//		ModelAndView mv = new ModelAndView();
//		
//		if(bindingResult.hasErrors()) { //에러 검증하는 방법은 boardVO가서 하기
//			mv.addObject("result", "에러발생");
//			mv.addObject("path", "notice/noticeWrite");
//			mv.setViewName("common/result");
//		}else {
//			int result = noticeService.noticeWrite(noticeVO);
//			if(result!=0) {
//				mv.addObject("result", "공지 등록 완료");
//				mv.addObject("path", "../");
//				mv.setViewName("common/result");			// 추후 어드민페이지랑 합칠때, 공지 작성 후 어드민페이지로 가게 하기
//			}else {
//				mv.addObject("result", "에러발생");
//				mv.addObject("path", "notice/noticeWrite");
//				mv.setViewName("common/result");
//			}
//		}
//		
//		return mv;
//	}
	
	@GetMapping("noticeSelect")
	public void noticeSelect(long nonum, Model model)throws Exception{
//		ModelAndView mv = new ModelAndView();
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNonum(nonum);
		noticeVO = noticeService.noticeSelect(noticeVO);
		model.addAttribute("no_select", noticeVO);
//		mv.setViewName("notice/noticeSelect");
		
//		return mv;
	}
	
	@GetMapping("noticeUpdate")
	public void noticeUpdate(long nonum,Model model)throws Exception{
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNonum(nonum);
		noticeVO = noticeService.noticeSelect(noticeVO);
		model.addAttribute("no_select", noticeVO);
		
	}
	
	@PostMapping("noticeUpdate")
	public void noticeUpdate(@Valid NoticeVO noticeVO, BindingResult bindingResult)throws Exception{
		noticeVO.setNo_regDate(Date.valueOf(LocalDate.now()));
		int result = noticeService.noticeUpdate(noticeVO);
		
	}

}