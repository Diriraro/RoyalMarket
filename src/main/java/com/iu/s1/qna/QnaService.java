package com.iu.s1.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository;
	
	public List<QnaVO> qnaMyList(QnaVO qnaVO)throws Exception{
		return qnaRepository.qnaMyList(qnaVO);
	}
	
	public int qnaWrite(QnaVO qnaVO)throws Exception{
		return qnaRepository.qnaWrite(qnaVO);
	}
	
}
