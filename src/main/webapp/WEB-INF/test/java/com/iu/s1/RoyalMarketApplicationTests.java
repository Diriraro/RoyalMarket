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
	@Test
	void test() throws Exception {
		List<ProfitVO> ar = new ArrayList<ProfitVO>();
		Date date = new Date();		
		for(int i = 0 ; i < date.getMonth()+1; i++) {
			Calendar cal1 = new GregorianCalendar(date.getYear()+1900, i , 1);
			int year = cal1.getTime().getYear()+1900;
			int month = cal1.getTime().getMonth()+1;
			int day = cal1.getActualMaximum(Calendar.DAY_OF_MONTH);
			String sell_date = year + "/" + month + "/" + day;
			String sell_date1 = year + "/" + month + "/" + 1;
			Long result = paymentHistoryRepository.getProfit( sell_date, sell_date1);
			System.out.println(sell_date + "/" + sell_date1);
			if(result == null) {
				result = 0L;
			}
			System.out.println(result);
			ProfitVO profitVO = new ProfitVO();
			profitVO.setProfit(result);			
			profitVO.setProfitRate((long)(((double)result / 1000000) * 100));
			ar.add(profitVO);
		}

		for(int i = 0 ; i < ar.size(); i++) {
			
			System.out.println(ar.get(i).getProfit() + "/ " + ar.get(i).getProfitRate());
		}
		
	}
}
