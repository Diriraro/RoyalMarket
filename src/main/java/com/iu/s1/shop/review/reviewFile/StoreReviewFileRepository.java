package com.iu.s1.shop.review.reviewFile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StoreReviewFileRepository {
	
	// 파일 삽입
	public int reviewFileInsert(StoreReviewFileVO storeReviewFileVO)throws Exception;
	
	// 파일 다운
	public StoreReviewFileVO fileDown(StoreReviewFileVO storeReviewFileVO)throws Exception;
	
	// 파일 리스트
	public List<StoreReviewFileVO> reviewFileSelect(long re_num)throws Exception;
	
	// 파일 이름.
	public String selectFileName(long re_num) throws Exception;

}
