package com.iu.s1.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberVO;
import com.iu.s1.trading.TradingVO;

@Service
public class PaymentService {

	@Autowired
	private PaymentMapper paymentMapper;
	
	public int pointUpdate(MemberVO memberVO)throws Exception{
		return paymentMapper.pointUpdate(memberVO);
	}
	
	public long pointSelect(String mem_id)throws Exception{
		return paymentMapper.pointSelect(mem_id);
	}
	
	
	public int paymentCharge(PayVO payVO)throws Exception{
		return paymentMapper.paymentCharge(payVO);
	}
	public int paymentOut(PayVO payVO)throws Exception{
		return paymentMapper.paymentOut(payVO);
	}
	
	public List<PayVO> pointManage(String mem_id)throws Exception{
		return paymentMapper.pointManage(mem_id);
	}
	
	public int tradingInsert(TradingVO tradingVO)throws Exception{
		return paymentMapper.tradingInsert(tradingVO);
	}
	
	public String seller_id_select(long sell_num)throws Exception{
		return paymentMapper.seller_id_select(sell_num);
	}
	
}
