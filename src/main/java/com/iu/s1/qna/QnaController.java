package com.iu.s1.qna;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("qnaMyList")			//사용자가 로그인 한 후 본인의 상담내역을 보는 곳
	public ModelAndView qnaMyList()throws Exception{
		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = new QnaVO();
		qnaVO.setMem_id("1111");
		List<QnaVO> ar = qnaService.qnaMyList(qnaVO);
		if(ar!=null) {					//로그인한 사용자의 아이디로 상담내역이 있는지 확인
			mv.addObject("qna_list", ar);
			mv.setViewName("qna/qnaMyList");			
		}else {
			mv.addObject("result", "문의 내역이 없습니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@GetMapping("qnaWrite")
	public ModelAndView qnaWrite()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qna/qnaWrite");
		return mv;
	}
	
	@PostMapping("qnaWrite")
	public ModelAndView qnaWrite(QnaVO qnaVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.qnaWrite(qnaVO);
		if(result!=0) {
			mv.addObject("result", "1:1 상담문의 완료");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "에러발생");
			mv.addObject("path", "notice/noticeWrite");
			mv.setViewName("common/result");
		}
		
		
		return mv;
	}
	
}
