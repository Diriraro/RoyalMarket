package com.iu.s1.product.zzim;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ZzimMapper {
	
	//찜추가
	public int zzimInsert(ZzimVO zzimVO)throws Exception;
	

}
