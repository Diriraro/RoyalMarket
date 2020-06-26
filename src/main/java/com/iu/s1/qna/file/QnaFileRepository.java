package com.iu.s1.qna.file;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository //생략가능
@Mapper
public interface QnaFileRepository {

	public int setInsert(QnaFileVO qnaFileVO)throws Exception;
	
	public List<QnaFileVO> fileCheck(long qna_num)throws Exception;
}
