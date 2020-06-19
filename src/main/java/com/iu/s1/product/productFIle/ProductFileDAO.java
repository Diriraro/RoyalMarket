package com.iu.s1.product.productFIle;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductFileDAO {
	public int setInsert(ProductFileVO productFileVO) throws Exception;
	public ProductFileVO fileDown(ProductFileVO productFileVO) throws Exception;

}
