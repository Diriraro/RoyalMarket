package com.iu.s1.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iu.s1.member.MemberVO;
import com.iu.s1.qna.file.QnaFileVO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("qnaMyList")			//사용자가 로그인 한 후 본인의 상담내역을 보는 곳
	public ModelAndView qnaMyList(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = new QnaVO();
		String id = ((MemberVO)session.getAttribute("member")).getMem_id();
		qnaVO.setMem_id(id);			//테스트용 아이디=iu ** 나중에 세션에서 로그인한사람 아이디 집어넣어야함
		List<QnaVO> ar = qnaService.qnaMyList(qnaVO);
		
		if(!ar.isEmpty()) {					//로그인한 사용자의 아이디로 상담내역이 있는지 확인
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
	public ModelAndView qnaWrite(QnaVO qnaVO, MultipartFile [] files)throws Exception{
		ModelAndView mv = new ModelAndView();
		String title=qnaVO.getQna_title();
		String contents=qnaVO.getQna_contents();
		String kind=qnaVO.getQna_kind();

		if(title.equals("")||contents.equals("")||kind.equals("")) {
			mv.addObject("result", "입력되지 않은 부분이 있습니다. 다시 작성해주세요.");
			mv.addObject("path", "qnaWrite");
			mv.setViewName("common/result");
		}else {			
			int result = qnaService.qnaWrite(qnaVO, files);
			if(result!=0) {
				mv.addObject("result", "1:1 상담문의 완료");
				mv.addObject("path", "qnaMyList");
				mv.setViewName("common/result");
			}else {
				mv.addObject("result", "에러발생");
				mv.addObject("path", "qnaWrite");
				mv.setViewName("common/result");
			}
		}
		return mv;
	}
	
	@GetMapping("qnaAdminList")
	public ModelAndView qnaAdminList()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<QnaVO> ar = qnaService.qnaAdminList();
		for (QnaVO qnaVO : ar) {
			int fileCheck = qnaService.fileCheck(qnaVO.getQna_num());
			qnaVO.setFileCheck(fileCheck);
		}
		mv.addObject("qna_adlist", ar);
		mv.setViewName("qna/qnaAdminList");
		return mv;
	}
	
	@GetMapping("qnaAnswer")
	public ModelAndView qnaAnswer(long qna_num)throws Exception{
		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = new QnaVO();
		qnaVO = qnaService.selectQna(qna_num);
		List<QnaFileVO> qnaFileVOs = qnaService.selectQnaFile(qna_num);
		mv.addObject("qvo", qnaVO);
		mv.addObject("qfvo", qnaFileVOs);
		mv.setViewName("qna/qnaAnswer");
		return mv;
	}
	
	@PostMapping("qnaAnswer")
	public ModelAndView qnaAnswer(QnaVO qnaVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.qnaAnswer(qnaVO);
		if(result!=0) {
			mv.addObject("result", "상담문의 답변작성 완료");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "에러발생");
			mv.addObject("path", "qna/qnaAdminList");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
}
