package com.iu.s1.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.iu.s1.interceptor.AdminInterceptor;
import com.iu.s1.interceptor.BuyerPageInterceptor;
import com.iu.s1.interceptor.ProductCancelInterceptor;
import com.iu.s1.interceptor.ProductInterceptor;
import com.iu.s1.interceptor.ReviewInterceptor;
import com.iu.s1.interceptor.SellerPageInterceptor;
import com.iu.s1.interceptor.SgminnInterceptor;


@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	private SellerPageInterceptor sellerPageInterceptor;
	
	@Autowired
	private BuyerPageInterceptor buyerPageInterceptor;
	
	@Autowired
	private ProductInterceptor productInterceptor;
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Autowired
	private ProductCancelInterceptor productCancelInterceptor;
	
	@Autowired
	private ReviewInterceptor reviewInterceptor;
	
	@Autowired
	private SgminnInterceptor sgminnInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(sgminnInterceptor)
		.addPathPatterns("/product/productDelete");
		
		registry.addInterceptor(buyerPageInterceptor)
		.addPathPatterns("/payment/buyer_page")
		.addPathPatterns("/payment/productTake");
		
		registry.addInterceptor(sellerPageInterceptor)
		.addPathPatterns("/payment/seller_page")
		.addPathPatterns("/payment/productGive");
		
		registry.addInterceptor(productCancelInterceptor)
		.addPathPatterns("/payment/productCancel");
		
		// Product랑 Shop에 대해 로그인 해야 들어 갈수 있는 Interceptor
		registry.addInterceptor(productInterceptor)
		.addPathPatterns("/shop/*")
		.addPathPatterns("/payment/*")
		.addPathPatterns("/product/*")
		.addPathPatterns("/qna/*")
		.excludePathPatterns("/payment/prepare")
		.excludePathPatterns("/product/productList")
		.excludePathPatterns("/product/homeProductList")
		.excludePathPatterns("/product/recProductList")
		.excludePathPatterns("/qna/qnaAdminList")
		.excludePathPatterns("/qna/qnaAnswer")
		.excludePathPatterns("/product/recentSearchProduct");
		
		registry.addInterceptor(adminInterceptor)
		.addPathPatterns("/admin/*")
		.addPathPatterns("/notice/*")
		.addPathPatterns("/qna/qnaAdminList")
		.addPathPatterns("/qna/qnaAnswer")
		.excludePathPatterns("/notice/noticeList")
		.excludePathPatterns("/notice/policy")
		.excludePathPatterns("/notice/ban");

		registry.addInterceptor(reviewInterceptor)
		.addPathPatterns("/shop/rei");

		//적용할 Interceptor 등록
		//registry.addInterceptor(productQnaInterceptor)
		//Interceptor를 사용할 URL 등록
		
		//Interceptro에서 제외할 URL 등록
		//.excludePathPatterns("");

	}

}

