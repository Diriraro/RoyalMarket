package com.iu.s1.email;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

@SpringBootTest
class EmailTest {

	@Autowired
	private EmailController emailController;
	
	@Test
	void test()throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("username", "승범");
		paramMap.put("email", "tmdqja3097@naver.com");
		ModelMap model = new ModelMap();
		ModelAndView mv = new ModelAndView();
		mv = emailController.sendEmailAction(paramMap, model, mv);

	}

}
