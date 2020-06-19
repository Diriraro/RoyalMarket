package com.iu.s1.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberRepository;
import com.iu.s1.member.MemberVO;

@Service
public class AdminService {
	
	// 상품 Repository ( 상품 분류 및 삭제 )
	
	// 회원 Repository ( 불건전 회원 관리 )
	@Autowired
	private MemberRepository memberRepository;
	// 노티스 Repository ( 삭제 분류 )
	
	
	public List<MemberVO> getMemberList() throws Exception {
		return memberRepository.getMemberList();
	}
	public List<MemberVO> getMemberSearchList(String kind, String search) throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setKind(kind);
		memberVO.setSearch(search);
		
		return memberRepository.getMemberSearchList(memberVO);
	}
}
