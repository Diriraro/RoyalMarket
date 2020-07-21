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
		
		for (int i =0; i<2; i++) {
		
		StoreQnaVO qnaVO = new StoreQnaVO();
		
//		qnaVO.setSq_num(i);
		qnaVO.setMem_storeNum(27); // dyun95 상점 = 24    cotest상점은 25      retest = 26   yhlim 27
		qnaVO.setSq_storeNum(27);   // .   cotest의 상점번호 ==25     
		qnaVO.setSq_contents("yhlim이  yhlim에게 글 작성. "+i+"" );
		
		
		int result = storeQnaRepository.setInsertQna(qnaVO);
		assertEquals(1, result);
		
		}
		
		
	}

}
