package com.iu.s1.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.iu.s1.member.MemberVO;
import com.iu.s1.trading.TradingVO;

@Repository
@Mapper
public interface PaymentMapper {
	
	public int pointUpdate(MemberVO memberVO)throws Exception;
	
	public long pointSelect(String mem_id)throws Exception;
	
	public int paymentCharge(PayVO payVO)throws Exception;
	
	public List<PayVO> pointManage(String mem_id)throws Exception;
	
	public int tradingInsert(TradingVO tradingVO)throws Exception;
	
	public String seller_id_select(long sell_num)throws Exception;
	
	public int paymentOut(PayVO payVO)throws Exception;
}
