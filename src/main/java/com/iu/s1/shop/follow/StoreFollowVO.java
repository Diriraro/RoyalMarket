package com.iu.s1.shop.follow;

import lombok.Data;

@Data
public class StoreFollowVO {

	private long follow_Num;
	private long give_storeNum;
	private long take_storeNum;
	
	private String take_storeName; //멤버에서 조회해서  내가 팔로우한 사람의 이름
	
	private String give_storeName;  // 멤버에서 조회해서 나에게 건사람 이름 출력
}
