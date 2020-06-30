package com.iu.s1.shop.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreReviewService {

	@Autowired
	private StoreReviewRepository storeReviewRepository;
	
	//
	public int setInsertReview(StoreReviewVO storeReviewVO) throws Exception{
		
		int result = storeReviewRepository.setInsertReview(storeReviewVO);
		
		return result;
	}
	
	
	//
	public int setDeleteReview(StoreReviewVO storeReviewVO) throws Exception {
		
		int result = storeReviewRepository.setDeleteReview(storeReviewVO);
		
		return result;
	}
	
	//
	public List<StoreReviewVO> getSelectListReview(StoreReviewVO storeReviewVO) throws Exception {
		
		return storeReviewRepository.getSelectListReview(storeReviewVO);
	}
	
	
	
	
}
