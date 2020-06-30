package com.iu.s1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.iu.s1.member.MemberVO;
import com.iu.s1.util.Pager;

@Mapper
@Repository
public interface ProductMapper {

	public int productInsert(ProductVO productVO) throws Exception;
	
	public List<ProductVO> productList(Pager pager) throws Exception;
	
	public long productCount(Pager pager) throws Exception;
	
	public String selectFileName(long sell_num) throws Exception;
	
	public ProductVO productSelect(long sell_num) throws Exception;
	
	public MemberVO productAddress(long sell_num) throws Exception;

	public long hitUpdate(long sell_num)throws Exception;
	
	public long productUpdate(ProductVO productVO) throws Exception;
	
	
}