package com.iu.s1.shop.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreReviewRepository {

	// 리뷰 작성  구매내역 buy_History 에서 그상품에 대한 리뷰 남기기
	public int setInsertReview(StoreReviewVO storeReviewVO)throws Exception;
	
	// 리뷰 삭제   리스트에서 본인거만 삭제하도록
	public int setDeleteReview(StoreReviewVO storeReviewVO) throws Exception;
	
	// 리뷰 리스트 본인 아이디에 있는 리스트 꺼내오
	public List<StoreReviewVO> getSelectListReview(StoreReviewVO storeReviewVO) throws Exception;
	
	
	
}
