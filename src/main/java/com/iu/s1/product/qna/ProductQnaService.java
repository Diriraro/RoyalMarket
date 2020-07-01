package com.iu.s1.product.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberVO;

@Service
public class ProductQnaService {
	
	@Autowired
	ProductQnaMapper qnaMapper;
	
	//작성
	
	public long qnaInsert(ProductQnaVO qnaVO)throws Exception{
		return qnaMapper.qnaInsert(qnaVO);
	}
	
	public long qnaDelete(long pq_num)throws Exception{
		return qnaMapper.qnaDelete(pq_num);
	}
	
    public List<ProductQnaVO> qnaList(long sell_num) throws Exception{
        
        return qnaMapper.qnaList(sell_num);
    }
    


}
