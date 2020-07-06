package com.iu.s1.shop.qna;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberVO;

@Service
public class StoreQnaService {
	
	@Autowired
	private StoreQnaRepository storeQnaRepository;
	
	//insert
	public int setInsertQna(StoreQnaVO storeQnaVO) throws Exception {
		
		int result = storeQnaRepository.setInsertQna(storeQnaVO);
		
		return result;
	}
	//setDelete
	
	public int setDeleteQna(StoreQnaVO storeQnaVO) throws Exception{
		
		return storeQnaRepository.setDeleteQna(storeQnaVO);
	}
	
	
	// getSelectList
	
	public List<StoreQnaVO> getSelectListQna(StoreQnaVO storeQnaVO) throws Exception {
		
		return storeQnaRepository.getSelectListQna(storeQnaVO);
	}
	
	//getSelectStoreName
	
	public String getSelectStoreName(StoreQnaVO storeQnaVO) throws Exception{
		
		return storeQnaRepository.getSelectStoreName(storeQnaVO);
	}
	
	//coco
	public long coco(long mem_storeNum) throws Exception {
		
		return storeQnaRepository.coco(mem_storeNum);
	}

}
