package com.iu.s1;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.velocity.runtime.directive.Parse;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iu.s1.admin.AdminService;
import com.iu.s1.paymentHistory.PaymentHistoryRepository;
import com.iu.s1.paymentHistory.ProfitVO;

@SpringBootTest
class RoyalMarketApplicationTests {

	@Test 
	void contextLoads() {
	}

	@Autowired
	private AdminService adminService;
	@Autowired
	private PaymentHistoryRepository paymentHistoryRepository;
	
//	@Test
//	void test() throws Exception{
//		List<Map.Entry<String, Long>> list = adminService.getLocateTradeCount();
//		for ( int i = 0 ; i < list.size(); i++) {
//			System.out.println(list.get(i).getKey()+"," + list.get(i).getValue());
//		}
//		
//		// 결과물 서울 : 2 경기 1 나머지 0 
//	}

}
