package com.iu.s1.shop.follow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreFollowService {
	
	
	@Autowired
	private StoreFollowRepository storeFollowRepository;
	
	//insert
	public int setInsertFollow(StoreFollowVO storeFollowVO)throws Exception {
		
		int result = storeFollowRepository.setInsertFollow(storeFollowVO);
		
		return result;
	}
	
	//delete
	public int setDeleteFollow(StoreFollowVO storeFollowVO)throws Exception {
		
		return storeFollowRepository.setDeleteFollow(storeFollowVO);
	}
	
	//list2
	
	public List<StoreFollowVO> getSelectListFollowers(StoreFollowVO storeFollowVO)throws Exception {
		
		return storeFollowRepository.getSelectListFollowers(storeFollowVO);
	}
	
	
	//list
	public List<StoreFollowVO> getSelectListFollowings(StoreFollowVO storeFollowVO) throws Exception{
		return storeFollowRepository.getSelectListFollowings(storeFollowVO);
	}
	
	//검증
	
	public int SelectOneFollow(StoreFollowVO storeFollowVO)throws Exception{
		
		int result = storeFollowRepository.SelectOneFollow(storeFollowVO);
		
		return result;
		
		// result 결과가 있으면 팔로우 해제, result 결과가 없으면 팔로우 가능하게
	}
	
	// 번호검색
	
	public StoreFollowVO selectnum(long give_storeNum,long take_storeNum) throws Exception{
		
				
		return storeFollowRepository.selectnum(give_storeNum,take_storeNum);
		
	}
	
	// getSelecttakeStoreName take 이름 출력
	public String getSelecttakeStoreName(StoreFollowVO storeFollowVO) throws Exception {
		
		return storeFollowRepository.getSelecttakeStoreName(storeFollowVO);
	}
	
	
	// getSelectgiveStoreName take 이름 출력
	public String getSelectgiveStoreName(StoreFollowVO storeFollowVO) throws Exception {
			
			return storeFollowRepository.getSelectgiveStoreName(storeFollowVO);
		}
	
	
	
	

}
