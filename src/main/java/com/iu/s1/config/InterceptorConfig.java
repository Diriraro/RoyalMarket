package com.iu.s1.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		

		

		//적용할 Interceptor 등록
		//registry.addInterceptor(productQnaInterceptor)
		//Interceptor를 사용할 URL 등록
		
		//Interceptro에서 제외할 URL 등록
		//.excludePathPatterns("");

		
		
		// TODO Auto-generated method stub
		// WebMvcConfigurer.super.addInterceptors(registry);
	}

}
