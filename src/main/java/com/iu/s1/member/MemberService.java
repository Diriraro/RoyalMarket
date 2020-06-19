package com.iu.s1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		
		return memberRepository.memberLogin(memberVO);
	}
	
	
}
