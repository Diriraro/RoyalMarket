package com.iu.s1;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iu.s1.admin.AdminService;

@SpringBootTest
class RoyalMarketApplicationTests {

	@Test 
	void contextLoads() {
	}

	@Autowired
	private AdminService adminService;
	
//	@Test
//	void test() throws Exception{
//		List<Map.Entry<String, Long>> list = adminService.getLocateTradeCount();
//		for ( int i = 0 ; i < list.size(); i++) {
//			System.out.println(list.get(i).getKey()+"," + list.get(i).getValue());
//		}
//		
//		// 결과물 서울 : 2 경기 1 나머지 0 
//	}
	@Test
	void test() throws Exception {
		long count = 4;
		long countyd = 14;
		System.out.println(((double)count/(double)countyd)*100);
	}
}
