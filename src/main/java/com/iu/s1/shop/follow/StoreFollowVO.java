package com.iu.s1.shop.follow;

import lombok.Data;

@Data
public class StoreFollowVO {

	private long follow_Num;
	private long give_storeNum;
	private long take_storeNum;
	
	private String mem_storeName; //멤버에서 조회해서 담을곳	
}
