package com.iu.s1.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.iu.s1.qna.file.QnaFileVO;

@Repository //생략가능
@Mapper
public interface QnaRepository {
	
	public List<QnaVO> qnaMyList(QnaVO qnaVO)throws Exception;
	
	public int qnaWrite(QnaVO qnaVO)throws Exception;
	
	public List<QnaVO> qnaAdminList()throws Exception;
	
	public QnaVO selectQna(long qna_num)throws Exception;
	
	public int qnaAnswer(QnaVO qnaVO)throws Exception;
	public long lastNum()throws Exception;
<<<<<<< HEAD
	
=======
>>>>>>> aaa1fb684ee50e6d8db4bcfeca0f335f44a460cc

}
