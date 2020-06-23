package com.iu.s1.product.qna;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaMapper {
	
	//댓글작성
	public int qnaInsert(QnaVO qnaVO) throws Exception;
	
	//댓글삭제
	public int qnaDelete(QnaVO qnaVO) throws Exception;

}
