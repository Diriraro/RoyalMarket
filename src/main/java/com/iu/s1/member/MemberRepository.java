package com.iu.s1.member;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberRepository {
	
	public int memberJoin(MemberVO memberVO) throws Exception;

	public MemberVO memberIdCheck(MemberVO memberVO) throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;
}
