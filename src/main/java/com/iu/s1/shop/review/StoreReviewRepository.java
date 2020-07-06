package com.iu.s1.shop.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.iu.s1.shop.follow.StoreFollowVO;

@Mapper
@Repository
public interface StoreReviewRepository {

	// 리뷰 작성  구매내역 buy_History 에서 그상품에 대한 리뷰 남기기
	public int setInsertReview(StoreReviewVO storeReviewVO)throws Exception;
	
	// 리뷰 삭제   리스트에서 본인거만 삭제하도록
	public int setDeleteReview(StoreReviewVO storeReviewVO) throws Exception;
	
	// 리뷰 리스트 본인 아이디에 있는 리스트 꺼내오
	public List<StoreReviewVO> getSelectListReview(StoreReviewVO storeReviewVO) throws Exception;
	
	public String selectFileName(long re_num) throws Exception;
	
	// 1 번 sell_num 으로 store_product 검색해서 mem_storeNum 가져오기
	public long getSelectsell_num_mem_storeNum(long sell_num)throws Exception; 
	// 2번 sell_num 으로 store_product 검색해서 sell_product 가져오기
	public String getSelectSell_num_sell_product(long sell_num) throws Exception;
	
	// 갯수
	public long reco(long mem_storeNum)throws Exception;
	
	
	
	
}
