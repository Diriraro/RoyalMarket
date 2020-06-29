package com.iu.s1.shop.qna;

import lombok.Data;

@Data
public class StoreQnaVO {
	
	private long sq_num;
	
	private long mem_storeNum;
	
	private long sq_storeNum;
	
	private String sq_contents;
	
	private String sq_regDate;

	
	private String mem_storeName; //멤버에서 조회해서 담을곳
	

}
