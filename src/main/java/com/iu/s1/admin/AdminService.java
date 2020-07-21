package com.iu.s1.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberRepository;
import com.iu.s1.member.MemberVO;
import com.iu.s1.notice.NoticeRepository;
import com.iu.s1.notice.NoticeVO;
import com.iu.s1.payment.PayStatsVO;
import com.iu.s1.payment.PaymentMapper;
import com.iu.s1.paymentHistory.PaymentHistoryRepository;
import com.iu.s1.paymentHistory.ProfitVO;
import com.iu.s1.product.ProductMapper;
import com.iu.s1.product.ProductVO;
import com.iu.s1.qna.QnaRepository;
import com.iu.s1.trading.TradingVO;
import com.iu.s1.util.Pager;
import com.iu.s1.visitor.VisitorVO;

@Service
public class AdminService {

	// 상품 Repository ( 상품 분류 및 삭제 )
	@Autowired
	private ProductMapper productMapper;
	// 문의 Repository ( 1:1 문의 답변 )
	@Autowired
	private QnaRepository qnaRepository;
	// 회원 Repository ( 불건전 회원 관리 )
	@Autowired
	private MemberRepository memberRepository;
	// 노티스 Repository ( 삭제 분류 )
	@Autowired
	private NoticeRepository noticeRepository;
	// 방문자
	@Autowired
	private AdminRepository adminRepository;
	// 거래량
	@Autowired
	private PaymentHistoryRepository paymentHistoryRepository;
	// 거래중
	@Autowired
	private PaymentMapper paymentMapper;

	public List<MemberVO> getMemberList(long mem_access) throws Exception {
		List<MemberVO> ar = new ArrayList<MemberVO>();
		if (mem_access == 1) {
			ar = memberRepository.getMemberList(mem_access); // mem_access = 0 인 멤버 검색
		} else {
			ar = memberRepository.getMemberList(mem_access); // mem_access = 1 인 멤버 검색
		}
		for(int i = 0 ; i < ar.size(); i++ ) {
			String pw = ar.get(i).getMem_pw();
			pw = pw.replaceAll("(?<=.{3})." , "*");
			ar.get(i).setMem_pw(pw);
		}
		return ar;
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
		return ar.size();
	}

	public List<NoticeVO> getNoticeList() throws Exception {
		return noticeRepository.findAllByOrderByNonumAsc();
	}
	public List<NoticeVO> getNoticeList2() throws Exception {
		return noticeRepository.findAllByOrderByNonumDesc();
	}

	public List<NoticeVO> noticeTitleSearch(String search) throws Exception {
		return noticeRepository.findByNotitleContainingOrderByNonumDesc(search);
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
			cal.add(cal.MONTH, -1);
			lastMonth = lastMonth - 1;
			lastDay = cal.getActualMaximum(cal.DAY_OF_MONTH);
			// 1월 1일 일때
		} else if (month == 1 && day == 1) {
			lastDay = 31;
			lastMonth = 12;
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
		return memberRepository.accessManager(memberVO);
	}

	public long qnaCount() throws Exception {
		return qnaRepository.qnaTotalCount();
	}

	public long qnaNACount() throws Exception {
		return qnaRepository.qnaNACount();
	}

	public Long getRateForTradeCountYD() throws Exception {
		Calendar cal = Calendar.getInstance();
		// 오늘
		int year = cal.getTime().getYear() + 1900;
		int month = cal.getTime().getMonth() + 1;
		int day = cal.getTime().getDate();
		String sell_date1 = year + "/" + month + "/" + day;

		// 하루전
		int lastYear = cal.getTime().getYear() + 1900;
		int lastMonth = cal.getTime().getMonth() + 1;
		int lastDay = 0;
		if (year == lastYear && month == lastMonth && day != 1) {
			lastDay = cal.getTime().getDate() - 1;
			// *월 1일 일때
		} else if (year == lastYear && month == lastMonth && day == 1) {
			cal.add(cal.MONTH, -1);
			lastMonth = lastMonth - 1;
			lastDay = cal.getActualMaximum(cal.DAY_OF_MONTH);
			// 1월 1일 일때
		} else if (month == 1 && day == 1) {
			lastDay = 31;
			lastMonth = 12;
			lastYear = year - 1;
		}
		String sell_date2 = lastYear + "/" + lastMonth + "/" + lastDay;
		long daily = paymentHistoryRepository.getRateForTradeCountYD(sell_date1, sell_date2);
		return daily;
	}

	public Long getDailyTradeCount() throws Exception {
		Date date = new Date();
		int year = date.getYear();
		int month = date.getMonth();
		int day = date.getDate();
		// 현재 시간 (년 월 일 세팅)
		Date date1 = new Date(year, month, day);
		return paymentHistoryRepository.getDailyTradeCount(date1);
	}

	public List<Map.Entry<String, Long>> getLocateTradeCount() throws Exception {
		Map<String, Long> map = new HashMap<String, Long>();
		// 행정구 추가가 필요하면 locate[]에 추가
		String[] locate = { "서울", "경기", "경상남도", "경상북도", "전라남도", "전라북도", "충청남도", "충청북도", "강원", "제주", "인천", "세종", "대전",
				"울산", "부산", "광주", "대구" };
		for (int i = 0; i < locate.length; i++) {
			long count = 0;
			if (paymentHistoryRepository.getLocateTradeCount(locate[i]) != 0) {
				count = paymentHistoryRepository.getLocateTradeCount(locate[i]);
				map.put(locate[i], count);
			}
			map.put(locate[i], count);

		}
		// value 기준 내림차순으로 정렬 , value 가 같으면 key 오름차순으로 정렬
		List<Map.Entry<String, Long>> list = new LinkedList<>(map.entrySet());
		Collections.sort(list, new Comparator<Map.Entry<String, Long>>() {
			@Override
			public int compare(Map.Entry<String, Long> s1, Map.Entry<String, Long> s2) {
				int comparision = (int) (s1.getValue() - s2.getValue()) * -1;
				return comparision == 0 ? s1.getKey().compareTo(s2.getKey()) : comparision;
			}
		});
		return list;
	}

	public List<ProfitVO> getProfit() throws Exception {
		List<ProfitVO> ar = new ArrayList<ProfitVO>();
		Date date = new Date();
		for (int i = 0; i < date.getMonth() + 1; i++) {
			Calendar cal1 = new GregorianCalendar(date.getYear() + 1900, i, 1);
			int year = cal1.getTime().getYear() + 1900;
			int month = cal1.getTime().getMonth() + 1;
			int day = cal1.getActualMaximum(Calendar.DAY_OF_MONTH);
			String sell_date = year + "/" + month + "/" + day;
			String sell_date1 = year + "/" + month + "/" + 1;
			Long result = paymentHistoryRepository.getProfit(sell_date, sell_date1);
			if (result == null) {
				result = 0L;
			}
			ProfitVO profitVO = new ProfitVO();
			profitVO.setProfit(result);
			profitVO.setProfitRate((long) (((double) result / 1000000) * 100));
			if(profitVO.getProfitRate()>100L) {
				profitVO.setProfitRate(100L);
			}
			ar.add(profitVO);
		}

		return ar;
	}

	public List<ProductVO> productRecentList() throws Exception {
		Pager pager = new Pager();
		pager.setCurPage(1L);
		pager.makeRow();
		long totalCount = productMapper.productCount(pager);
		pager.makePage(totalCount);
		return productMapper.productList(pager);
	}

	public List<ProductVO> productList(Pager pager) throws Exception {
		pager.makeRow();
		long totalCount = productMapper.productCount(pager);
		pager.makePage(totalCount);
		return productMapper.productList(pager);
	}

	public int productDelete(ProductVO productVO) throws Exception {
		return productMapper.productDelete(productVO);
	}

	public List<TradingVO> tradingList(Pager pager) throws Exception {
		return paymentMapper.tradingList(pager);
	}

}
