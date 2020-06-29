package com.iu.s1.product.qna;

import java.util.List;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.querydsl.QPageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.iu.s1.product.qna.ProductQnaService;
import com.iu.s1.member.MemberVO;

@Controller
@RequestMapping("/productQna/**/")
public class ProductQnaController {
	
	@Autowired
	ProductQnaService qnaService;
	
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

    @RequestMapping("/qnaInsert") //댓글 작성 
    @ResponseBody
    private long qnaInsert(@RequestParam long sell_num,@RequestParam long pq_storeNum, @RequestParam String pq_contents,@RequestParam String pq_storeName) throws Exception{
        
        ProductQnaVO qnaVO = new ProductQnaVO();
        qnaVO.setSell_num(sell_num);
        qnaVO.setPq_storeNum(pq_storeNum);
        qnaVO.setPq_contents(pq_contents);
        qnaVO.setPq_storeName(pq_storeName);
       // ~~.setWriter("test");  
        
        return qnaService.qnaInsert(qnaVO);
    }
    
    @RequestMapping("/qnaDelete/{pq_num}") //댓글 삭제  
    @ResponseBody
    private long qnaDelete(@PathVariable long pq_num) throws Exception{
        
        return qnaService.qnaDelete(pq_num);
    }
    
    @RequestMapping("/qnaList") //댓글 리스트
    @ResponseBody
    private List<ProductQnaVO> qnaList(Model model,@RequestParam long sell_num) throws Exception{

        return qnaService.qnaList(sell_num);
    }




}
