package com.iu.s1.shop.review;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class StoreReviewRepositoryTest {

	@Autowired
	private StoreReviewRepository storeReviewRepository;
	
	
	@Test
	void inserttest() throws Exception {
		
		StoreReviewVO storeReviewVO = new StoreReviewVO();
		
		
		
		
		int result = storeReviewRepository.setInsertReview(storeReviewVO);
		assertEquals(1, result);
		
	}

}
