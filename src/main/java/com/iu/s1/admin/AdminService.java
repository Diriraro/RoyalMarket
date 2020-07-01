package com.iu.s1.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberRepository;
import com.iu.s1.member.MemberVO;
import com.iu.s1.notice.NoticeRepository;
import com.iu.s1.notice.NoticeVO;

@Service
public class AdminService {
	
	// 상품 Repository ( 상품 분류 및 삭제 )
	
	// 회원 Repository ( 불건전 회원 관리 )
	@Autowired
	private MemberRepository memberRepository;
	// 노티스 Repository ( 삭제 분류 )
	@Autowired
	private NoticeRepository noticeRepository;
	
	
	public List<MemberVO> getMemberList(long mem_access) throws Exception {
		if(mem_access == 1) {
			return memberRepository.getMemberList(mem_access); // mem_access = 0 인 멤버 검색
		} else {
			return memberRepository.getMemberList(mem_access); // mem_access = 1 인 멤버 검색
		}
	}
	public List<MemberVO> getMemberSearchList(String kind, String search, int mem_access) throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_access(mem_access);
		memberVO.setKind(kind);
		memberVO.setSearch(search);
		return memberRepository.getMemberSearchList(memberVO);
	}
	
	// DashBoard need Data
	public long getMemberCount() throws Exception {
		return memberRepository.memberCount();
	}
	public long getDailyNewMember() throws Exception {
		// 현재 시간 (년 월 일 시 분 초 )
		Date date = new Date();
		int year = date.getYear();
		int month = date.getMonth();
		int day = date.getDate();
		// 현재 시간 (년 월 일 세팅)
		Date date1 = new Date(year, month, day);
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_regDate(date1);
		List<MemberVO> ar = memberRepository.getDailyNewMember(memberVO);
		System.out.println(ar.size());
		return ar.size();
	}
	
	public List<NoticeVO> getNoticeList() throws Exception {
		return noticeRepository.findAllByOrderByNonumDesc();
	}
	
	public List<NoticeVO> noticeTitleSearch(String search)throws Exception{
		return noticeRepository.findByNotitleContainingOrderByNonumDesc(search);
	}

}
