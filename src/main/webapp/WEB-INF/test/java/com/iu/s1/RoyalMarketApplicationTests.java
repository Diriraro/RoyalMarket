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
import com.iu.s1.product.ProductService;

@SpringBootTest
class RoyalMarketApplicationTests {

	@Test 
	void contextLoads() {
	}

	@Autowired
	private ProductService productService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private PaymentHistoryRepository paymentHistoryRepository;
	
	@Test
	void test() throws Exception{
		System.out.println(productService.productSelect2(178));
	}

}
