package com.iu.s1.product.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	
	@Autowired
	QnaMapper qnaMapper;
	
	//작성
	
	public int qnaInsert(QnaVO qnaVO)throws Exception{
		return qnaMapper.qnaInsert(qnaVO);
	}
	
	public int qnaDelete(QnaVO qnaVO)throws Exception{
		return qnaMapper.qnaDelete(qnaVO);
	}

}
