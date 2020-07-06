//package com.iu.s1.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//
//import com.iu.s1.interceptor.ProductQnaInterceptor;
//
//@Configuration
//public class InterceptorConfig implements WebMvcConfigurer {
//
//	@Autowired
//	private ProductQnaInterceptor productQnaInterceptor;
//
//	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		
////		registry.addInterceptor(noticeInterceptor)
////		.addPathPatterns("notice/noticeDelete")
////		.addPathPatterns("notice/noticeWrite")
////		.addPathPatterns("notice/noticeUpdate");
//
//		//적용할 Interceptor 등록
//		registry.addInterceptor(productQnaInterceptor)
//		//Interceptor를 사용할 URL 등록
//		
//		//Interceptro에서 제외할 URL 등록
//		.excludePathPatterns("");
//
//		
//		
//		// TODO Auto-generated method stub
//		// WebMvcConfigurer.super.addInterceptors(registry);
//	}
//
//}
