package com.iu.s1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.iu.s1.member.MemberVO;
import com.iu.s1.product.zzim.ZzimVO;
import com.iu.s1.util.Pager;

@Mapper
@Repository
public interface ProductMapper {

	public int productInsert(ProductVO productVO) throws Exception;
	
	public List<ProductVO> productList(Pager pager) throws Exception;
	
	public List<ProductVO> recProductList(Pager pager) throws Exception;
	
	public List<ProductVO> homeProductList(Pager pager) throws Exception;
	
	public List<ProductVO> myProductList(Pager pager) throws Exception;
	
	public long myProductCount(Pager pager) throws Exception;
	
	public long productCount(Pager pager) throws Exception;
	
	public String selectFileName(long sell_num) throws Exception;
	
	public ProductVO productSelect(long sell_num) throws Exception;
	
	public MemberVO productAddress(long sell_num) throws Exception;
	
	public MemberVO productStoreName(long sell_num) throws Exception;

	public long hitUpdate(long sell_num)throws Exception;
	
	public long productUpdate(ProductVO productVO) throws Exception;
	
	// shop에서 쓸거
	public List<ProductVO> myList(long mem_storeNum) throws Exception;
	public long prodco(long mem_storeNum) throws Exception;
	public String getsell_product(ZzimVO zzimVO)throws Exception; 
	public long getsell_price(ZzimVO zzimVO) throws Exception;
	public long getmem_storeNum(ZzimVO zzimVO) throws Exception;
	
	
	public int productDelete(ProductVO productVO) throws Exception;
	
	
	
}
