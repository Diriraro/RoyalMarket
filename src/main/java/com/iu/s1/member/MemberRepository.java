package com.iu.s1.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberRepository {
	
	public int memberJoin(MemberVO memberVO) throws Exception;

	public MemberVO memberIdCheck(MemberVO memberVO) throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;
	
	public int memberPwUpdate(MemberVO memberVO) throws Exception;
	
	public MemberVO selectMember(MemberVO memberVO)throws Exception;
	
	
	// 관리자 페이지 필요한 매퍼
	public List<MemberVO> getMemberList(long mem_access)throws Exception;
	public List<MemberVO> getMemberSearchList(MemberVO memberVO) throws Exception;
	public List<MemberVO> getDailyNewMember(MemberVO memberVO) throws Exception;
	public long memberCount() throws Exception;
	
}
