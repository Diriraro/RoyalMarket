package com.iu.s1.member;

import java.util.HashMap;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {

		String api_key ="NCSKDFS8HXUGJKD7";
		String api_secret ="4S2NQKG6HTIQAVGCCF3MX1GMLY1XGILP";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", phoneNumber); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "인증번호는" + "[" + numStr + "]" + "입니다.");
		params.put("app_version", "test app 2.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}
	
	public int memberJoin(MemberVO memberVO) throws Exception{
		return memberRepository.memberJoin(memberVO);
	}
	
	
	//검증 메서드 
	public boolean memberCheck(MemberVO memberVO,BindingResult bindingResult) throws Exception{
		boolean result = false; //false 에러X, true 에러O
		
		//1. 기본어노테이션 제공 검증 실행
		result = bindingResult.hasErrors();
		
		//2.pw가 일치하는 지 검증
		if(!memberVO.getMem_pw().equals(memberVO.getPwCheck())) {
			bindingResult.rejectValue("pwCheck", "memberVO.mem_pw.notEqual");
			result = true;
		}
		
		//3.ID 중복검사
		memberVO = memberRepository.memberIdCheck(memberVO);
		if(memberVO != null) {
			bindingResult.rejectValue("mem_id", "memberVO.mem_id.same");
			result = true;
		}
		return result;
	}
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception{
		return memberRepository.memberLogin(memberVO);
	}
	
	
	
}
