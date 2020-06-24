package com.iu.s1.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository //생략가능
@Mapper
public interface QnaRepository {
	
	public List<QnaVO> qnaMyList(QnaVO qnaVO)throws Exception;
	
	public int qnaWrite(QnaVO qnaVO)throws Exception;

}
