package com.iu.s1;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iu.s1.admin.AdminRepository;
import com.iu.s1.admin.AdminService;
import com.iu.s1.member.MemberVO;
import com.iu.s1.visitor.VisitorVO;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private AdminRepository adminRepository;

	@GetMapping("/")
	public String getHome(HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		boolean check = false;
		// 쿠키들을 가져옴
		Cookie[] cookies = request.getCookies();
		if (cookies.length - 1 > 0) {
			System.out.println(cookies.length);
			String str[] = new String[cookies.length];
			for (int i = 0; i < cookies.length; i++) {
				str[i] = cookies[i].getName();
				System.out.println(str[i]);
			}
			// 쿠키들중에 해당 쿠키 키네임이 visitor의 존재여부
			check = Arrays.stream(str).anyMatch("visitor"::equals);
		}
		System.out.println("존재 여부 :" + check);
		if (!check) {
			if (session.getAttribute("member") != null) {
				MemberVO memberVO = (MemberVO) session.getAttribute("member");
				// visitor 쿠기 생성
				Cookie cookie = new Cookie("visitor", memberVO.getMem_id());
				cookie.setMaxAge(3600);
				response.addCookie(cookie);

				// 쿠키 생성후 visitor count 증가 업데이트
				VisitorVO visitorVO = new VisitorVO();
				Calendar cal = Calendar.getInstance();
				int year = cal.getTime().getYear() + 1900;
				int month = cal.getTime().getMonth() + 1;
				int day = cal.getTime().getDate();

				String daily = year + "/" + month + "/" + day;

				if (adminRepository.existsById(daily)) {
					System.out.println("daily count ++");
					// 방문일에 대한 데이터가 있으면 count 증가
					Optional<VisitorVO> opt = adminRepository.findById(daily);
					visitorVO = opt.get();
					visitorVO.setCount(visitorVO.getCount() + 1);
					adminRepository.save(visitorVO);
				} else {
					// 방문일에 대한 데이터가 없으면 추가
					System.out.println("New DAY");
					adminRepository.save(visitorVO);
				}

			}
		}

		return "index1";
	}

}
