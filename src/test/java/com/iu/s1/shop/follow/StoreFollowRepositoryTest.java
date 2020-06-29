package com.iu.s1.shop.follow;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.BootstrapWith;

@SpringBootTest
class StoreFollowRepositoryTest {
	
	@Autowired
	private StoreFollowRepository storeFollowRepository;
	

	//@Test
	void setInsertTest()throws Exception {
		
		StoreFollowVO qvo = new StoreFollowVO();
		
		qvo.setGive_storeNum(2); // 여기가 세션번호   // dyun95(2번) 가
		qvo.setTake_storeNum(6); // 파라미터번호.	// yhlim12(3번) 에게 팔로우, //fotest(6번)
		
		int result = storeFollowRepository.setInsertFollow(qvo);
		
		assertEquals(1, result);
		
		
	}
	// 당하는 입장으로
	@Test
	void setInsertTest2()throws Exception {
		
		StoreFollowVO qvo = new StoreFollowVO();
		
		qvo.setGive_storeNum(6); // 여기가 세션번호   // fotest(6번) 가
		qvo.setTake_storeNum(2); // 파라미터번호.	// dyun95(2번) 에게 팔로우, 
		// 이러면 맞팔상황
		
		int result = storeFollowRepository.setInsertFollow(qvo);
		
		assertEquals(1, result);
		
		
	}
	
	//@Test
	void setdeleteTest1()throws Exception {
		
		StoreFollowVO qvo = new StoreFollowVO();
		
		qvo.setFollow_Num(3);
		
		int result = storeFollowRepository.setDeleteFollow(qvo);
		
		assertEquals(1, result);
		
		
	}
	
	
	
	
	
	
	
	
	

}
