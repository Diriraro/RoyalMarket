package com.iu.s1.shop.qna;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreQnaService {
	
	@Autowired
	private StoreQnaRepository storeQnaRepository;
	
	//insert
	public int setInsert(StoreQnaVO storeQnaVO) throws Exception {
		
		int result = storeQnaRepository.setInsert(storeQnaVO);
		
		return result;
	}
	//setDelete
	
	public int setDelete(StoreQnaVO storeQnaVO) throws Exception{
		
		return storeQnaRepository.setDelete(storeQnaVO);
	}
	
	
	// getSelectList
	
	public List<StoreQnaVO> getSelectList(StoreQnaVO storeQnaVO) throws Exception {
		
		return storeQnaRepository.getSelectList(storeQnaVO);
	}
	
	

}
