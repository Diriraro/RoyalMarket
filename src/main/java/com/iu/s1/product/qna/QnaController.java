package com.iu.s1.product.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/qna/**/")
public class QnaController {
	
	@Autowired
	QnaService qnaService;
	
//	@GetMapping("qnaInsert")
//	public ModelAndView qnaInsert(ModelAndView mv)throws Exception{
//
//		mv.addObject("qnaVO", new QnaVO());
//		return mv;
//	}
//	
//	@PostMapping("qnaInsert")
//	public ModelAndView qnaInsert(QnaVO qnaVO,RedirectAttributes rd)throws Exception{
//		int result = qnaService.qnaInsert(qnaVO);
//		rd.addFlashAttribute("result",result);
//		return mv;
//	}

    @RequestMapping("qnaInsert") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam long sell_num, @RequestParam String pq_contents) throws Exception{
        
        QnaVO qnaVO = new QnaVO();
        qnaVO.setSell_num(sell_num);
        qnaVO.setPq_contents(pq_contents);
       // ~~.setWriter("test");  
        
        return qnaService.qnaInsert(qnaVO);
    }
    
    @RequestMapping("qnaDelete") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
        
        return mCommentService.commentDeleteService(cno);
    }



}
