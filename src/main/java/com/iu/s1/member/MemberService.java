package com.iu.s1.member;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public String certifiedPhoneNumber(String phoneNumber, String numStr) {

		String api_key = "NCSYCJIG3YIWY3QA";
		String api_secret = "UXRXDHID18TDWF5PJKZWZFASIXDZU2W9";
		Message coolsms = new Message(api_key, api_secret);
		String error_count = "1";

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", "01045338794"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "인증번호는" + "[" + numStr + "]" + "입니다.");
		params.put("app_version", "test app 2.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			error_count = obj.get("error_count").toString();
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return error_count;

	}

	public int memberPwUpdate(MemberVO memberVO)throws Exception{
		return memberRepository.memberPwUpdate(memberVO);
	}
	
	public int memberJoin(MemberVO memberVO) throws Exception {
		memberVO.setMem_address(memberVO.getRoad_address() + " " + memberVO.getDetail_address());
		return memberRepository.memberJoin(memberVO);
	}

	public boolean findMemberByPhone(MemberVO memberVO, BindingResult bindingResult, String checkNum) throws Exception {
		boolean result = false;
		System.out.println(checkNum);
		// 인증번호가 맞는지 확인
		if (!memberVO.getPhoneCheck().equals(checkNum)) {
			bindingResult.rejectValue("phoneCheck", "memberVO.phoneCheck.notEqual");
			result = true;
		}
		MemberVO memberVO2 = memberRepository.memberIdCheck(memberVO);
		
		if (!memberVO.getMem_pw().equals(memberVO.getPwCheck())) {
			bindingResult.rejectValue("pwCheck", "memberVO.mem_pw.notEqual");
			result = true;
		}
		
		if (memberVO2 == null) {
			bindingResult.rejectValue("mem_id", "memberVO.mem_id.notExist");
			result = true;
			return result;
		}
		
		MemberVO memberVO3 = memberRepository.selectMember(memberVO);
		System.out.println(memberVO3.getMem_phone());
		System.out.println(memberVO.getMem_phone());
		if(!memberVO3.getMem_phone().equals(memberVO.getMem_phone())) {
			bindingResult.rejectValue("mem_phone", "memberVO.mem_phone.notEqual");
			result = true;
		}
		return result;
	}
	
	public boolean findMemberByEmail(MemberVO memberVO, BindingResult bindingResult, String checkNum) throws Exception {
		boolean result = false;
		
		// 인증번호가 맞는지 확인
		if (!memberVO.getPhoneCheck().equals(checkNum)) {
			bindingResult.rejectValue("phoneCheck", "memberVO.phoneCheck.notEqual");
			result = true;
		}
		MemberVO memberVO2 = memberRepository.memberIdCheck(memberVO);
		
		if (!memberVO.getMem_pw().equals(memberVO.getPwCheck())) {
			bindingResult.rejectValue("pwCheck", "memberVO.mem_pw.notEqual");
			result = true;
		}
		
		if (memberVO2 == null) {
			bindingResult.rejectValue("mem_id", "memberVO.mem_id.notExist");
			result = true;
			return result;
		}
		
		MemberVO memberVO3 = memberRepository.selectMember(memberVO);

		System.out.println(memberVO3.getMem_email());
		System.out.println(memberVO.getMem_email());
		if(!memberVO3.getMem_email().equals(memberVO.getMem_email())) {
			bindingResult.rejectValue("mem_email", "memberVO.mem_email.notEqual");
			result = true;
		}
		return result;
	}
	

	// 검증 메서드
	public boolean memberCheck(MemberVO memberVO, BindingResult bindingResult, String checkNum) throws Exception {
		boolean result = false; // false 에러X, true 에러O

		// 1. 기본어노테이션 제공 검증 실행
		result = bindingResult.hasErrors();

		// 2.pw가 일치하는 지 검증
		if (!memberVO.getMem_pw().equals(memberVO.getPwCheck())) {
			bindingResult.rejectValue("pwCheck", "memberVO.mem_pw.notEqual");
			result = true;
		}

		// 3.ID 중복검사
		MemberVO memberVO2 = memberRepository.memberIdCheck(memberVO);
		if (memberVO2 != null) {
			bindingResult.rejectValue("mem_id", "memberVO.mem_id.same");
			result = true;
		}

		// 인증번호가 맞는지 확인
		if (!memberVO.getPhoneCheck().equals(checkNum)) {
			bindingResult.rejectValue("phoneCheck", "memberVO.phoneCheck.notEqual");
			result = true;
		}

		return result;
	}

	public MemberVO memberLogin(MemberVO memberVO) throws Exception {
		return memberRepository.memberLogin(memberVO);
	}

}
