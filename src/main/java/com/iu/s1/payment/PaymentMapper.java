package com.iu.s1.payment;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.iu.s1.member.MemberVO;

@Repository
@Mapper
public interface PaymentMapper {
	
	public int pointUpdate(MemberVO memberVO)throws Exception;
	
	public long pointSelect(String mem_id)throws Exception;
	
	public int paymentCharge(PayVO payVO)throws Exception;
}
