package com.iu.s1.product.productFile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ProductFileMapper {
	
	public int productFileInsert(ProductFileVO productFileVO) throws Exception;
	
	public ProductFileVO fileDown(ProductFileVO productFileVO) throws Exception;
	
	public List<ProductFileVO> productFileSelect(long sell_num)throws Exception;
	
	public String selectFileName(long sell_num) throws Exception;

}
