package com.iu.s1.member;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberRepository {
	
	public int memberJoin(MemberVO memberVO) throws Exception;

	public MemberVO memberIdCheck(MemberVO memberVO) throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;
	
	public int memberPwUpdate(MemberVO memberVO) throws Exception;
	
	public MemberVO selectMember(MemberVO memberVO)throws Exception;
	
	public MemberVO selectMemberByEmail(MemberVO memberVO)throws Exception;
	
	public MemberVO selectMemberByPhone(MemberVO memberVO)throws Exception;
	
	public MemberVO kakaoLogin(MemberVO memberVO) throws Exception;
	
	public MemberVO selectMemberByStoreName(MemberVO memberVO) throws Exception;
	
	public int updateStoreName(MemberVO memberVO3)throws Exception;
	
	public int memberDelete(MemberVO memberVO)throws Exception;
	
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	public List<MemberVO> selectMemberUpdate(MemberVO memberVO)throws Exception;
	
	// 관리자 페이지 필요한 매퍼
	public List<MemberVO> getMemberList(long mem_access)throws Exception;
	public List<MemberVO> getMemberSearchList(MemberVO memberVO) throws Exception;
	public List<MemberVO> getDailyNewMember(MemberVO memberVO) throws Exception;
	public long memberCount() throws Exception;
	public int accessManager(MemberVO memberVO)throws Exception;
	
	// shop
	public String getregDate(long mem_storeNum) throws Exception;
	public MemberVO mdata(long mem_storeNum) throws Exception;
	
}
