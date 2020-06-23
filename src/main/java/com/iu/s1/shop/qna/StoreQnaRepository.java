package com.iu.s1.shop.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreQnaRepository {
	
	//insert
	public int setInsertQna(StoreQnaVO storeQnaVO) throws Exception;
		
	//delete
	public int setDeleteQna(StoreQnaVO storeQnaVO) throws Exception;
	
	//selectList
	public List<StoreQnaVO> getSelectListQna(StoreQnaVO storeQnaVO) throws Exception;
	
	
	
}
