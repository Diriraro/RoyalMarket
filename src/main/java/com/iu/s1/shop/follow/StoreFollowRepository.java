package com.iu.s1.shop.follow;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreFollowRepository {

	// 팔로우 할때  insert
	public int setInsertFollow(StoreFollowVO storeFollowVO)throws Exception;
	
	// 팔로우 해제  delete
	public int setDeleteFollow(StoreFollowVO storeFollowVO)throws Exception;
	
	// 팔로우 리스트보기 listfollowers
	public List<StoreFollowVO> getSelectListFollowers(StoreFollowVO storeFollowVO)throws Exception;
	
	
	// 팔로워 리스트 보기. listfollowings
	public List<StoreFollowVO> getSelectListFollowings(StoreFollowVO storeFollowVO)throws Exception;
	
	// 팔로우 검증 해서 결과가 있으면 팔로우 해제보여주고 result = 1 이면 해제하고
	// 팔로우 검증 해서 결과가 없으면 팔로우 하는버튼 보여주게 result = 0, null이면 추가하게끔
	//검증 = selectoneFollow
	public int SelectOneFollow(StoreFollowVO storeFollowVO) throws Exception; 
	
	
	//위에 재껴보고 
	// follow num 검색.
	
	public StoreFollowVO selectnum(long give_storeNum,long take_storeNum)throws Exception;
	
	// takestore num의 이름 출력:
	public String getSelecttakeStoreName(StoreFollowVO storeFollowVO)throws Exception;
	
	// givestore num의 이름 출력:
	public String getSelectgiveStoreName(StoreFollowVO storeFollowVO)throws Exception;
	
	
}
