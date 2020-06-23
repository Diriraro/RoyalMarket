package com.iu.s1.product.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	
	@Autowired
	QnaMapper qnaMapper;
	
	//작성
	
	public long qnaInsert(QnaVO qnaVO)throws Exception{
		return qnaMapper.qnaInsert(qnaVO);
	}
	
	public long qnaDelete(long pq_num)throws Exception{
		return qnaMapper.qnaDelete(pq_num);
	}

}
