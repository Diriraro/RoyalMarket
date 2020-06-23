package com.iu.s1;

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
	
	@Test
	void test() throws Exception{
		System.out.println(adminService.getDailyNewMember());
		
	}
}
