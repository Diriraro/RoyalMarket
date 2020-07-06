package com.iu.s1.saveCash;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository //생략가능
@Mapper
public interface SaveCashRepository {
	
	public SaveCashVO selectSC(String mem_id)throws Exception;
	
	public int createSC(String mem_id)throws Exception;
	public int updateSC(SaveCashVO saveCashVO)throws Exception;

}
