package com.iu.s1.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberRepository;
import com.iu.s1.member.MemberVO;
import com.iu.s1.notice.NoticeRepository;
import com.iu.s1.notice.NoticeVO;
import com.iu.s1.visitor.VisitorVO;

@Service
public class AdminService {

	// 상품 Repository ( 상품 분류 및 삭제 )

	// 회원 Repository ( 불건전 회원 관리 )
	@Autowired
	private MemberRepository memberRepository;
	// 노티스 Repository ( 삭제 분류 )
	@Autowired
	private NoticeRepository noticeRepository;
	// 방문자
	@Autowired
	private AdminRepository adminRepository;

	public List<MemberVO> getMemberList(long mem_access) throws Exception {
		if (mem_access == 1) {
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
		return noticeRepository.findAll();
	}

	public VisitorVO getTodayVisitorCount() throws Exception {
		// 오늘 방문자수 
		VisitorVO visitorVO = new VisitorVO();
		Calendar cal = Calendar.getInstance();
		int year = cal.getTime().getYear() + 1900;
		int month = cal.getTime().getMonth() + 1;
		int day = cal.getTime().getDate();
		String daily = year + "/" + month + "/" + day;
		if (adminRepository.existsById(daily)) {
			Optional<VisitorVO> opt = adminRepository.findById(daily);
			visitorVO = opt.get();
		} else {
			System.out.println("New DAY");
			visitorVO.setDay(daily);
			visitorVO.setCount(1);
			adminRepository.save(visitorVO);
		}

		return visitorVO;
	}

	public VisitorVO getlastVisitorCount() throws Exception {
		
		VisitorVO visitorVO = new VisitorVO();
		Calendar cal = Calendar.getInstance();
		// 오늘
		int year = cal.getTime().getYear() + 1900;
		int month = cal.getTime().getMonth() + 1;
		int day = cal.getTime().getDate();

		// 하루전
		int lastYear = cal.getTime().getYear() + 1900;
		int lastMonth = cal.getTime().getMonth() + 1;
		int lastDay = 0;
		if (year == lastYear && month == lastMonth && day != 1) {
			lastDay = cal.getTime().getDate() - 1;
			// *월 1일 일때
		} else if (year == lastYear && month == lastMonth && day == 1) {
			lastMonth = lastMonth - 1;
			lastDay = cal.getMaximum(lastMonth);
			// 1월 1일 일때
		} else if (month == 1 && day == 1) {
			lastMonth = 31;
			lastYear = year - 1;
		}
		String daily = lastYear + "/" + lastMonth + "/" + lastDay;
		if (adminRepository.existsById(daily)) {
			Optional<VisitorVO> opt = adminRepository.findById(daily);
			visitorVO = opt.get();
		} else {
			visitorVO.setDay(daily);
			visitorVO.setCount(0);
		}
		return visitorVO;
	}
	
	public int accessManage(MemberVO memberVO) throws Exception {
		return memberRepository.accessManage(memberVO);
		
	}

}
