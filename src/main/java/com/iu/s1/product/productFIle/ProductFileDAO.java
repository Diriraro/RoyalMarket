package com.iu.s1.product.productFIle;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductFileDAO {
	public int productFileInsert(ProductFileVO productFileVO) throws Exception;
	
	public ProductFileVO fileDown(ProductFileVO productFileVO) throws Exception;
	
	public List<ProductFileVO> productFileSelect(long sell_num)throws Exception;
	
	public String selectFileName(long sell_num) throws Exception;

}
