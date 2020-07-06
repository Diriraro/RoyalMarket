package com.iu.s1.product.zzim;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ZzimMapper {
	
	//찜추가
	public int zzimInsert(ZzimVO zzimVO)throws Exception;
	
	//찜체크
	public ZzimVO zzimCheck(long mem_storeNum, long sell_num)throws Exception;
	
	//찜삭제
	public int zzimDelete(ZzimVO zzimVO)throws Exception;
	
	//찜카운트
	public long zzimCount(long sell_num)throws Exception;
	
	// shop에서 보여줄 목록
	public List<ZzimVO> myzzim(long mem_storeNum)throws Exception;
	
	// shop에서 보여줄 co
	public long zico(long mem_storeNum) throws Exception;

}
