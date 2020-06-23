<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>

	<div class="container">
		<h1 style="display: inline-block;">1:1 상담하기</h1>
		<h1 style="display: inline-block;">
			<a href="./qnaMyList">상담내역</a>
		</h1>
		<%
			String seop = "";
		%>
		<form action="qnaWrite">
			<div align="center" id="qna_kind">
				<select id="qna_kind_1">
					<option value="">문의할 내용을 선택해주세요</option>
					<option value="계정문의">계정문의</option>
					<option value="차단">차단(제제)</option>
					<option value="거래신고">거래신고</option>
					<option value="서비스기능">서비스 기능</option>
					<option value="광고">광고/전문상점</option>
					<option value="서비스장애">서비스 장애</option>
					<option value="제안">제안</option>
					<option value="기타">기타 신고</option>
				</select> <br>
				<h1></h1>
				<select id="qna_kind_2">
					<option value="">상위 항목을 선택해주세요</option>
				</select>
				<br>
				<textarea style="margin: 0px; width: 1174px; height: 448px;" name="qna_contents" id="qna_contents">
				
				</textarea>
				<br>
				<input type="hidden" id="qnak" name="qna_kind" value="계정문의>회원가입">
				<input type="hidden" id="mem_id" name="mem_id" value="${member.mem_id }">
			</div>

		</form>
	</div>
	<script type="text/javascript">
		$("#qna_kind_1").click(function() {
			$("textarea").val("");
			$("#qnak").remove();
			if ($("#qna_kind_1 option:selected").val()=="계정문의"){
				
				$("#qna_kind_2 option").remove();				//2번째 select안에 있는거 지우기
				$("#qna_kind_2").append('<option value="회원가입">회원가입</option><option value="번호변경">번호변경</option><option value="재가입">재가입</option><option value="탈퇴">탈퇴</option>');
																//2번째 select에 원하는 값 집어넣기
				$("#qna_kind_2").click(function(){				//2번째 select를 선택했을 때 
					if ($("#qna_kind_2 option:selected").val()=="회원가입"){
						$("#qnak").remove();					//VO로 넘겨갈 값 설정(qna_kind는 컬럼은 하나인데 여기서 보내주는값이 2개라 하나로 합쳐주기)
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="계정문의>회원가입">')
						$("#qna_contents").val("");				//textarea에 있는 값 지운 후
						$("#qna_contents").val(					//아래 textarea에 기본 폼 추가
						'문의에 맞는 상담유형을 선택해 주시면 더욱 빠른처리가 가능합니다.\n1) 최근 3개월이내 휴대폰번호를 변경하셨나요? (Y/N)\n2) 휴대폰번호 변경일자 :\n본인확인을 위해 다음 정보가 필요합니다.\n1) 이전 연락처 :\n2) 현재 사용중인 연락처 :\n3) 이메일주소 :\n4) 추가로 첨부하실 자료가 있으시다면 스크린샷으로 첨부\n TIP.\n회원가입시 이미 등록된 연락처(번호)로 확인되시나요?\n이전 사용자께서 우주장터를 해당 연락처로 가입하여 사용하셨을 수 있습니다.\n휴대폰 번호를 변경 하신적이 없다면 친구 등 지인에게 휴대폰 번호를 빌려주어 따로 가입하신 적이 있으신지 확인 부탁드립니다.\n우주장터는 건전한 거래 문화를 위해 휴대폰 번호당 1개의 계정을 운영원칙으로 하여 한 번호로 여러 계정 생성을 제한하고 있어 \n우주장터 회원 가입을 중복으로 하실 수 없습니다.');
					}else
					if($("#qna_kind_2 option:selected").val()=="번호변경"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="계정문의>번호변경">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'<번호변경 신청서>\n\n1)상점명:\n2)이전 휴대폰번호:\n3)변경된 휴대폰번호:\n4)이메일주소:\n5)변경사유:\n\n변경이 불가하다면 신청서를 작성하여 보내주세요.\n단, 이용정지된 고객일 경우 변경이 불가할 수 있습니다.');
					}else
					if($("#qna_kind_2 option:selected").val()=="재가입"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="계정문의>재가입">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'<재가입 신청서>	\n* 상점명:\n* 휴대폰번호:\n* 재가입 사유:\n\n※ 탈퇴 후 재가입은 5일 후 가능하시며, \n1명의 사용자가 1개의 상점만 개설이 가능합니다.');
					}else
					if($("#qna_kind_2 option:selected").val()=="탈퇴"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="계정문의>탈퇴">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'<탈퇴 신청서>\n\n* 상점명:\n* 휴대폰번호: \n* 탈퇴사유:\n\n※ 탈퇴 후 재가입은 5일 후 가능합니다.');
					}else{
						$("#qna_contents").val("");
						}
				});
			}else											//반복
			if ($("#qna_kind_1 option:selected").val()=="차단" ){
				
				$("#qna_kind_2 option").remove();
				$("#qna_kind_2").append('<option value="해제요청">해제요청</option><option value="이용제한문의">이용제한문의</option><option value="기타">기타</option>');

				$("#qna_kind_2").click(function(){				
					if ($("#qna_kind_2 option:selected").val()=="해제요청"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="차단>해제요청">')
						$("#qna_contents").val("");				
						$("#qna_contents").val(					
						'<계정 정상화 요청 양식>\n\n1. 문제해결 확인을 위해 상대방 정보가 필요합니다.\n1) 상점명 :	\n2) 연락처 :\n3) 증거자료 (입금, 물품배송 등)');
					}else
					if($("#qna_kind_2 option:selected").val()=="이용제한문의"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="차단>이용제한문의">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'<이용제한 문의>\n\n1. 정확한 확인을 위한 접수하시는 회원님의 정보가 필요합니다.\n\n1) 상점명 : \n2) 연락처 : \n3) 차단내역 : \n4) 사유 : \n\n*상품발송시 : 상대방에게 입금받은 내역 및 주소를 받은 대화내역, 발송한 운송장번호 및 영수증, 배송완료내역 스크린샷 (본인과 상대방의 주소, 실명확인 가능해야됨)\n*환불처리시 : 상대방에게 입금받은 내역 및 환불계좌를 받은 대화내역, 환불처리한 내역 스크린샷 (본인과 상대방의 계좌 및 실명확인 가능해야됨) \n\n신고건으로 문제해결이 되지 않는 상태에서 재이용을 위해 신규 회원가입을 하셔도 자동차단되어 이용이 어려운 점 미리 안내드립니다.\n\n※ 거래신고 차단기간은 정해져 있지 않으며, 영구차단입니다 ※');
					}else{
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="차단>기타">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'- 문의와 관련된 정보를 가급적 상세히 기재 부탁드립니다.');
					}
				});
				
			}else
			if ($("#qna_kind_1 option:selected").val()=="거래신고"){
				
				$("#qna_kind_2 option").remove();
				$("#qna_kind_2").append('<option value="미발송">미발송</option><option value="환불">환불</option><option value="상태불량">상태불량</option><option value="착불">착불</option><option value="미입금">미입금</option><option value="기타">기타</option>');

				$("#qna_kind_2").click(function(){
					$("#qnak").remove();
					$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="거래신고">')
					$("#qna_contents").val("");				
					$("#qna_contents").val(					
					'* 물품명: \n* 물품가격:\n* 거래날짜:\n* 거래방법(직거래/택배):\n* 신고 게시물 웹주소: \n* 신고 사유 :\n  → 상세 내용 :\n* 상대방 정보 :\n    - 은행계좌/입금자명 (필수) : \n  - 휴대폰 번호 :\n    - 상점명 :\n    - 기타정보 :\n\n<신고사유에 따른 필요 내용> \n*미발송 : 상대방으로 계좌번호를받은 대화내용 + 이체확인증 등 관련자료 이미지 첨부\n*상태불량 : 물품 상태관련 대화내용 + 하자 등 관련자료 이미지 첨부\n*착불 : 선불로 협의한 대화내용 + 수령한 상품의 운송장 등 관련자료 이미지 첨부 (두분의 정보, 착불금액 표기) \n*미입금 : 상대방에게 발송한 운송장번호 등 관련자료 이미지 첨부\n상품 발송한 경우 - 상대방에게 배송 받을 주소를 안내받은 대화내용, 부착된 운송장의 이미지 (두분의 정보)\n상품권, 기프트콘 거래의 경우 - 해당 코드를 전송한 대화내용\n*환불 : 환불 하기로한 대화내용\n협의 - 상대방이 환불해주기로한 대화내용\n협의안됨 - 미발송, 상태불량, 착불 등에 따라 답변상이');
				});
				
			}else
			if ($("#qna_kind_1 option:selected").val()=="서비스기능"){
				
				$("#qna_kind_2 option").remove();
				$("#qna_kind_2").append('<option value="상품">상품,상점</option><option value="배송서비스">배송 서비스</option><option value="기타">기타</option>');

				$("#qna_kind_2").click(function(){
					$("#qnak").remove();
					$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="서비스기능">')
					$("#qna_contents").val("");				
					$("#qna_contents").val('- 문의와 관련된 정보를 가급적 상세히 기재 부탁드립니다.');
				});
				
			}else
			if ($("#qna_kind_1 option:selected").val()=="광고"){
				
				$("#qna_kind_2 option").remove();
				$("#qna_kind_2").append('<option value="광고">광고</option><option value="전문상점">전문상점</option><option value="기타">기타</option>');

				$("#qna_kind_2").click(function(){				
					if ($("#qna_kind_2 option:selected").val()=="광고"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="광고>광고">')
						$("#qna_contents").val("");				
						$("#qna_contents").val(					
						'<광고문의 양식>\n\n1) 구분(문의/오류) :\n2) 상점명 :	\n3) 연락처 :	\n4) 문의내용(상세하게) : \n\n');
					}else
					if($("#qna_kind_2 option:selected").val()=="전문상점"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="광고>전문상점">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'<전문상점 문의양식>\n\n1) 구분(문의/신청/해제/오류) :\n2) 상점명 :	\n3) 연락처 :	\n4) 문의내용(상세하게) : 	');
					}else{
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="광고>기타">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'- 문의와 관련된 정보를 가급적 상세히 기재 부탁드립니다.');
					}
				});
				
			}else
			if ($("#qna_kind_1 option:selected").val()=="서비스장애"){
				
				$("#qna_kind_2 option").remove();
				$("#qna_kind_2").append('<option value="웹">웹</option><option value="기능동작오류">기능동작오류</option><option value="본인인증오류">본인인증오류</option>');

				$("#qna_kind_2").click(function(){
					$("#qnak").remove();
					$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="서비스장애">')
					$("#qna_contents").val("");				
					$("#qna_contents").val('<서비스 장애접수 양식>\n1)오류 발생 상황(자세할 수록 좋습니다): \n2)오류와 관련 된 스크린샷(더욱 빠른처리에 도움이 됩니다): \n\n※ 번거로우시더라도 자세한 사항을 말씀해주시면 더욱 좋습니다 ^^');
				});
				
			}else
			if ($("#qna_kind_1 option:selected").val()=="제안"){
				
				$("#qna_kind_2 option").remove();
				$("#qna_kind_2").append('<option value="기능제안">기능제안</option>');

				$("#qna_kind_2").click(function(){
					$("#qnak").remove();
					$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="제안">')
					$("#qna_contents").val("");				
					$("#qna_contents").val('- 제안 주시는 내용을 상세히 기재 부탁드립니다.');
				});
				
			}else
			if ($("#qna_kind_1 option:selected").val()=="기타"){
				
				$("#qna_kind_2 option").remove();
				$("#qna_kind_2").append('<option value="제제사항">제제사항</option><option value="리뷰삭제요청">리뷰삭제요청</option><option value="제보">제보</option>');

				$("#qna_kind_2").click(function(){				
					if ($("#qna_kind_2 option:selected").val()=="제제사항"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="기타>제제사항">')
						$("#qna_contents").val("");				
						$("#qna_contents").val(					
						'<제재 관련 접수 양식>\n\n1. 제재현황을 알기위해 다음 정보가 필요합니다.	\n1) 제재 받으신 사항 :');
					}else
					if($("#qna_kind_2 option:selected").val()=="리뷰삭제요청"){
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="기타>리뷰삭제요청">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'<리뷰삭제 접수 양식>\n\n1) 상대방의 상점명(상점 수가 많으면 모두 기재) :	\n2) 요청 사유 :	\n3) 리뷰 관련 자료 및 스크린샷 :');
					}else{
						$("#qnak").remove();
						$("#qna_kind").append('<input type="hidden" id="qnak" name="qna_kind" value="기타>제보">')
						$("#qna_contents").val("");
						$("#qna_contents").val(
						'<제보 접수 양식>\n\n1) 해당 게시물 또는 댓글 웹주소(아시면 좋습니다) :\n2) 상대방 정보(상점명 또는 연락처는 꼭 필요합니다) :\n3) 상품명/상품 URL:\n4) 제보 사유 :\n5) 관련자료 스크린샷(확인이 되지 않으면 도움을 드리기 어려울 수도 있습니다.) :');
					}
				});
				
			}else{
				
				$("#qna_kind_2 option").remove();
				$("#qna_kind_2").append('<option value="">상위 항목을 선택해주세요</option>');
			}
			
		});
	</script>

</body>
</html>