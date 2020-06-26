package com.iu.s1.member;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public String certifiedPhoneNumber(String phoneNumber, String numStr) {

		String api_key = "NCSYFVQLACVOHA9V";
		String api_secret = "ZFAGHRHOSCLEPAXTQXYVDCLLWF6RJ0XC";
		Message coolsms = new Message(api_key, api_secret);
		String error_count = "1";

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", "01046265193"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
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

	public String findIdByPhone(String phoneNumber, String id) {

		String api_key = "NCSYFVQLACVOHA9V";
		String api_secret = "ZFAGHRHOSCLEPAXTQXYVDCLLWF6RJ0XC";
		Message coolsms = new Message(api_key, api_secret);
		String error_count = "1";

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", "01046265193"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "회원님의 아이디는" + "[" + id + "]" + "입니다.");
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

	public int memberPwUpdate(MemberVO memberVO) throws Exception {
		return memberRepository.memberPwUpdate(memberVO);
	}

	public int memberJoin(MemberVO memberVO) throws Exception {
		memberVO.setMem_address(memberVO.getRoad_address() + " " + memberVO.getDetail_address());
		return memberRepository.memberJoin(memberVO);
	}

	public boolean findPwByPhone(MemberVO memberVO, BindingResult bindingResult, String checkNum) throws Exception {
		boolean result = bindingResult.hasErrors();
		// 인증번호가 맞는지 확인

		List<ObjectError> err = bindingResult.getAllErrors();
		System.out.println(err);
		if (!result) {
			if (!memberVO.getPhoneCheck().equals(checkNum)) {
				bindingResult.rejectValue("phoneCheck", "memberVO.phoneCheck.notEqual");
				result = true;
			}

			if (!memberVO.getMem_pw().equals(memberVO.getPwCheck())) {
				bindingResult.rejectValue("pwCheck", "memberVO.mem_pw.notEqual");
				result = true;
			}
		}
		return result;
	}

	public boolean findPwByEmail(MemberVO memberVO, BindingResult bindingResult, String checkNum) throws Exception {

		List<ObjectError> err = bindingResult.getAllErrors();
		System.out.println(err);

		boolean result = bindingResult.hasErrors();

		// 인증번호가 맞는지 확인
		if (!result) {
			if (!memberVO.getPhoneCheck().equals(checkNum)) {
				bindingResult.rejectValue("phoneCheck", "memberVO.phoneCheck.notEqual");
				result = true;

			} else if (!memberVO.getMem_pw().equals(memberVO.getPwCheck())) {
				bindingResult.rejectValue("pwCheck", "memberVO.mem_pw.notEqual");
				result = true;

			} else {

			}

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
		MemberVO memberVO2 = memberRepository.selectMember(memberVO);
		if (memberVO2 != null) {
			bindingResult.rejectValue("mem_id", "memberVO.mem_id.same");
			result = true;
		}
		
		// phone 중복검사
		MemberVO memberVO3 = memberRepository.selectMemberByPhone(memberVO);
		if (memberVO3 != null) {
			bindingResult.rejectValue("mem_phone", "memberVO.mem_phone.same");
			result = true;
		}
		
		// email 중복검사
		MemberVO memberVO4 = memberRepository.selectMemberByEmail(memberVO3);
		if (memberVO4 != null) {
			bindingResult.rejectValue("mem_email", "memberVO.mem_email.same");
			result = true;
		}

		/*
		 * // 3.phone 중복검사 MemberVO memberVO3 = memberRepository.selectMember(memberVO);
		 * if (memberVO3 != null) { bindingResult.rejectValue("mem_id",
		 * "memberVO.mem_id.same"); result = true; }
		 */
		

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

	public MemberVO selectMember(MemberVO memberVO) throws Exception {
		return memberRepository.selectMember(memberVO);
	}

	public MemberVO selectMemberByEmail(MemberVO memberVO) throws Exception {
		return memberRepository.selectMemberByEmail(memberVO);
	}

	public MemberVO selectMemberByPhone(MemberVO memberVO) throws Exception {
		return memberRepository.selectMemberByPhone(memberVO);
	}

}
