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


		String api_key = "NCS4BQJGFWZTDPCY";
		String api_secret = "UCUVOSZN6GWTUM4TIHD9Q2HDQONA2XSX";


		Message coolsms = new Message(api_key, api_secret);
		String error_count = "1";

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호

		params.put("from", "01020819512"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨

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

		String api_key = "NCS4BQJGFWZTDPCY";
		String api_secret = "UCUVOSZN6GWTUM4TIHD9Q2HDQONA2XSX";
		Message coolsms = new Message(api_key, api_secret);
		String error_count = "1";

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", "01020819512"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
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
		MemberVO memberVO4 = memberRepository.selectMemberByEmail(memberVO);
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

	public boolean kakaoMemberUpdateCheck(MemberVO memberVO, BindingResult bindingResult, String checkNum)
			throws Exception {
		boolean result = false;
		result = bindingResult.hasErrors();

		System.out.println(bindingResult.getAllErrors());

		List<MemberVO> ar = memberRepository.selectMemberUpdate(memberVO);

		for (int i = 0; i < ar.size(); i++) {
			if (memberVO.getMem_phone().equals(ar.get(i).getMem_phone())) {
				bindingResult.rejectValue("mem_phone", "memberVO.mem_phone.unique");
				result = true;
				break;
			}
		}

		if (!memberVO.getPhoneCheck().equals(checkNum)) {
			bindingResult.rejectValue("phoneCheck", "memberVO.phoneCheck.notEqual");
			result = true;
		}

		return result;
	}

	public boolean memberUpdateCheck(MemberVO memberVO, BindingResult bindingResult, String checkNum) throws Exception {
		boolean result = false;

		result = bindingResult.hasErrors();

		System.out.println(bindingResult.getAllErrors());

		// 2.pw가 일치하는 지 검증
		if (!memberVO.getMem_pw().equals(memberVO.getPwCheck())) {
			bindingResult.rejectValue("pwCheck", "memberVO.mem_pw.notEqual");
			result = true;
		}

		List<MemberVO> ar = memberRepository.selectMemberUpdate(memberVO);

		for (int i = 0; i < ar.size(); i++) {
			if (memberVO.getMem_phone().equals(ar.get(i).getMem_phone())) {
				bindingResult.rejectValue("mem_phone", "memberVO.mem_phone.unique");
				result = true;
				break;
			}
		}

		for (int i = 0; i < ar.size(); i++) {
			if (memberVO.getMem_email().equals(ar.get(i).getMem_email())) {
				bindingResult.rejectValue("mem_email", "memberVO.mem_email.unique");
				result = true;
				break;
			}
		}

		if (!memberVO.getPhoneCheck().equals(checkNum)) {
			bindingResult.rejectValue("phoneCheck", "memberVO.phoneCheck.notEqual");
			result = true;
		}

		return result;
	};

	public List<MemberVO> selectMemberUpdate(MemberVO memberVO) throws Exception {
		return memberRepository.selectMemberUpdate(memberVO);
	}

	public boolean kakaoMemberCheck(MemberVO memberVO, BindingResult bindingResult, String checkNum) throws Exception {
		boolean result = false; // false 에러X, true 에러O

		// 1. 기본어노테이션 제공 검증 실행
		result = bindingResult.hasErrors();
		System.out.println(bindingResult.getAllErrors());

		if (!result) {
			// phone 중복검사
			MemberVO memberVO3 = memberRepository.selectMemberByPhone(memberVO);
			if (memberVO3 != null) {
				bindingResult.rejectValue("mem_phone", "memberVO.mem_phone.same");
				result = true;
			}

			// 인증번호가 맞는지 확인
			if (!memberVO.getPhoneCheck().equals(checkNum)) {
				bindingResult.rejectValue("phoneCheck", "memberVO.phoneCheck.notEqual");
				result = true;
			}
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

	public MemberVO kakaoLogin(MemberVO memberVO) throws Exception {
		return memberRepository.kakaoLogin(memberVO);
	}

	// shop
	public String getregDate(long mem_storeNum) throws Exception {

		return memberRepository.getregDate(mem_storeNum);
	}

	// mdata
	public MemberVO mdata(long mem_storeNum) throws Exception {

		return memberRepository.mdata(mem_storeNum);
	}

	public MemberVO selectMemberByStoreName(MemberVO memberVO) throws Exception {
		return memberRepository.selectMemberByStoreName(memberVO);
	}

	public int updateStoreName(MemberVO memberVO3) throws Exception {
		return memberRepository.updateStoreName(memberVO3);
	}

	public int memberDelete(MemberVO memberVO) throws Exception {
		return memberRepository.memberDelete(memberVO);
	}

	public int memberUpdate(MemberVO memberVO) throws Exception {
		return memberRepository.memberUpdate(memberVO);
	}

}
