package com.iu.s1.shop.qna;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class StoreQnaRepositoryTest {
	
	@Autowired
	private StoreQnaRepository storeQnaRepository;
	
	@Test
	void setInsertTest()throws Exception{
		
		for (int i =0; i<5; i++) {
		
		StoreQnaVO qnaVO = new StoreQnaVO();
		
//		qnaVO.setSq_num(i);
		qnaVO.setMem_storeNum(25); // dyun95 상점 = 24    cotest상점은 25      retest = 26
		qnaVO.setSq_storeName("dyun95");   // 지금은 이름.   cotest의 이름 ==id
		qnaVO.setSq_contents("dyun95의 글  "+i+" 번");
		
		
		int result = storeQnaRepository.setInsertQna(qnaVO);
		assertEquals(1, result);
		
		}
		
		
	}

}
