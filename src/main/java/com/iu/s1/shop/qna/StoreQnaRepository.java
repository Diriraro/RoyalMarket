package com.iu.s1.shop.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreQnaRepository {
	
	//insert
	public int setInsert(StoreQnaVO storeQnaVO) throws Exception;
		
	//delete
	public int setDelete(StoreQnaVO storeQnaVO) throws Exception;
	
	//selectList
	public List<StoreQnaVO> getSelectList(StoreQnaVO storeQnaVO) throws Exception;
	
	
	
}
