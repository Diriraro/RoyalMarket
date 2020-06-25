package com.iu.s1.product.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iu.s1.member.MemberVO;

@Mapper
public interface QnaMapper {
	
	//댓글목록
	 public List<QnaVO> qnaList(long sell_num) throws Exception;
	//댓글작성
	public long qnaInsert(QnaVO qnaVO) throws Exception;
	
	//댓글삭제
	public long qnaDelete(long pq_num) throws Exception;
	

}
