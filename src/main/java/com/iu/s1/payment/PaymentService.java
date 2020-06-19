package com.iu.s1.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberVO;

@Service
public class PaymentService {

	@Autowired
	private PaymentMapper paymentMapper;
	
	public int pointUpdate(MemberVO memberVO)throws Exception{
		return paymentMapper.pointUpdate(memberVO);
	}
	
	
}
