package com.iu.s1.product;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ProductDAO {

	public int setInsert(ProductVO productVO) throws Exception;
	
}
