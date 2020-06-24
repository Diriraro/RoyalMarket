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
		<h1 style="display: inline-block;" align="right">
			<a href="./qnaMyList">상담내역</a>
		</h1>
		<form action="qnaWrite">
			<div align="center" id="qna_kind">
			
			<div>
				<input type="radio" class="kind" name="qna_kind_1" id="qna_a"> 계정 문의 &nbsp;&nbsp;
				<input type="radio" class="kind" name="qna_kind_1" id="qna_b"> 차단(제제) &nbsp;&nbsp;
				<input type="radio" class="kind" name="qna_kind_1" id="qna_c"> 거래신고 &nbsp;&nbsp;
				<input type="radio" class="kind" name="qna_kind_1" id="qna_d"> 서비스 기능 &nbsp;&nbsp;
				<input type="radio" class="kind" name="qna_kind_1" id="qna_e"> 광고/전문상점 &nbsp;&nbsp;
				<input type="radio" class="kind" name="qna_kind_1" id="qna_f"> 서비스 장애 &nbsp;&nbsp;
				<input type="radio" class="kind" name="qna_kind_1" id="qna_g"> 제안 &nbsp;&nbsp;
				<input type="radio" class="kind" name="qna_kind_1" id="qna_h"> 기타 신고
			</div>
			

			</div>

		</form>
	</div>
	<script type="text/javascript">
		var check=0;
		$(".kind").click(function(){
			if($("#qna_a").prop("checked")&&check==0){
				$("#qna_kind").append(
					'<input type="radio" name="qna_kind_2" id="qna2_1a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_1b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_1c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_1d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_1e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check=1;								//첫번째 radio 누르면 append 됨
			}else if($("#qna_a").prop("checked")&&check==1){
				check=1;								// 같은거 여러번 눌렀을 때는 아무것도 안됨
			}else if(!$("#qna_a").prop("checked")){
				$(".qna2_1").remove();
				check=0;								//다른거 누르면 지움
					
			}else {
				check=0;								// ?? 근데 이거 없음 안됨
			}
			
			if($("#qna_b").prop("checked")&&check==0){
				$("#qna_kind").append(
					'<input type="radio" name="qna_kind_2" id="qna2_2a" value="해제요청" class="qna2_2"><span class="qna2_2"> 해제요청</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_2b" value="이용제한문의" class="qna2_2"><span class="qna2_2"> 이용제한문의</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_2c" value="기타" class="qna2_2"><span class="qna2_2"> 기타</span>')
				check=1;
					
			}else if($("#qna_b").prop("checked")&&check==1){
				check=1;
			}else if(!$("#qna_b").prop("checked")){
				$(".qna2_2").remove();
				check=0;
			}else{
				check=0;
			}
			
			if($("#qna_c").prop("checked")&&check==0){
				$("#qna_kind").append(
					'<input type="radio" name="qna_kind_2" id="qna2_3a" value="미발송" class="qna2_3"><span class="qna2_3"> 미발송</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_3b" value="환불" class="qna2_3"><span class="qna2_3"> 환불</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_3c" value="상태불량" class="qna2_3"><span class="qna2_3"> 상태불량</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_3d" value="착불" class="qna2_3"><span class="qna2_3"> 착불</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_3e" value="미입금" class="qna2_3"><span class="qna2_3"> 미입금</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_3f" value="기타" class="qna2_3"><span class="qna2_3"> 기타</span>')
				check=1;
			}else if($("#qna_c").prop("checked")&&check==1){
				check=1;
			}else if(!$("#qna_c").prop("checked")){
				$(".qna2_3").remove();
				check=0;
			}else{
				check=0;
			}

			if($("#qna_d").prop("checked")&&check==0){
				$("#qna_kind").append(
					'<input type="radio" name="qna_kind_2" id="qna2_4a" value="상품,상점" class="qna2_4"><span class="qna2_4"> 상품,상점</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_4b" value="배송서비스" class="qna2_4"><span class="qna2_4"> 배송서비스</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_4c" value="기타" class="qna2_4"><span class="qna2_4"> 기타</span>')
				check=1;
			}else if($("#qna_d").prop("checked")&&check==1){
				check=1;
			}else if(!$("#qna_d").prop("checked")){
				$(".qna2_4").remove();
				check=0;
			}else{
				check=0;
			}
			if($("#qna_e").prop("checked")&&check==0){
				$("#qna_kind").append(
					'<input type="radio" name="qna_kind_2" id="qna2_5a" value="광고" class="qna2_5"><span class="qna2_5"> 광고</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_5b" value="전문상점" class="qna2_5"><span class="qna2_5"> 전문상점</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_5c" value="기타" class="qna2_5"><span class="qna2_5"> 기타</span>')
				check=1;
			}else if($("#qna_e").prop("checked")&&check==1){
				check=1;
			}else if(!$("#qna_e").prop("checked")){
				$(".qna2_5").remove();
				check=0;
			}else{
				check=0;
			}

			if($("#qna_f").prop("checked")&&check==0){
				$("#qna_kind").append(
					'<input type="radio" name="qna_kind_2" id="qna2_6a" value="웹" class="qna2_6"><span class="qna2_6"> 웹</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_6b" value="기능동작오류" class="qna2_6"><span class="qna2_6"> 기능동작오류</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_6c" value="본인인증 오류" class="qna2_6"><span class="qna2_6"> 본인인증 오류</span>')
				check=1;
			}else if($("#qna_f").prop("checked")&&check==1){
				check=1;
			}else if(!$("#qna_f").prop("checked")){
				$(".qna2_6").remove();
				check=0;
			}else{
				check=0;
			}

			if($("#qna_g").prop("checked")&&check==0){
				$("#qna_kind").append(
					'<input type="radio" name="qna_kind_2" id="qna2_7a" value="기능제안" class="qna2_7"><span class="qna2_7"> 기능제안</span>')
				check=1;
			}else if($("#qna_g").prop("checked")&&check==1){
				check=1;
			}else if(!$("#qna_g").prop("checked")){
				$(".qna2_7").remove();
				check=0;
			}else{
				check=0;
			}

			if($("#qna_h").prop("checked")&&check==0){
				$("#qna_kind").append(
					'<input type="radio" name="qna_kind_2" id="qna2_8a" value="제제사항" class="qna2_8"><span class="qna2_8"> 제제사항</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_8b" value="리뷰삭제요청" class="qna2_8"><span class="qna2_8"> 리뷰삭제요청</span>&nbsp;&nbsp;<input type="radio" name="qna_kind_2" id="qna2_8c" value="제보" class="qna2_8"><span class="qna2_8"> 제보</span>')
				check=1;
			}else if($("#qna_h").prop("checked")&&check==1){
				check=1;
			}else if(!$("#qna_h").prop("checked")){
				$(".qna2_8").remove();
				check=0;
			}else{
				check=0;
			}
			
		});

		
		
		
	</script>
	<script type="text/javascript">
	

	
	</script>	
	
	
</body>
</html>