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
				alert("asdasd");
				$("#qna_kind").append(
						'<input type="radio" name="qna_kind_2" id="qna2_a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span><input type="radio" name="qna_kind_2" id="qna2_b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span><input type="radio" name="qna_kind_2" id="qna2_c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span><input type="radio" name="qna_kind_2" id="qna2_d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span><input type="radio" name="qna_kind_2" id="qna2_e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check++;
				}else if($("#qna_a").prop("checked")&&check==1){
					
				}else{
					$(".qna2_1").remove();
					check--;
				}
			if($("#qna_b").prop("checked")&&check==0){
				$("#qna_kind").append(
						'<input type="radio" name="qna_kind_2" id="qna2_a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span><input type="radio" name="qna_kind_2" id="qna2_b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span><input type="radio" name="qna_kind_2" id="qna2_c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span><input type="radio" name="qna_kind_2" id="qna2_d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span><input type="radio" name="qna_kind_2" id="qna2_e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check=0;
				}else if($("#qna_b").prop("checked")&&check==1){
					
				}else{
					$(".qna2_1").remove();
					check=1;
				}
			if($("#qna_c").prop("checked")&&check==0){
				$("#qna_kind").append(
						'<input type="radio" name="qna_kind_2" id="qna2_a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span><input type="radio" name="qna_kind_2" id="qna2_b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span><input type="radio" name="qna_kind_2" id="qna2_c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span><input type="radio" name="qna_kind_2" id="qna2_d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span><input type="radio" name="qna_kind_2" id="qna2_e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check++;
				}else if($("#qna_c").prop("checked")&&check==1){
					
				}else{
					$(".qna2_1").remove();
					check--;
				}
			if($("#qna_d").prop("checked")&&check==0){
				$("#qna_kind").append(
						'<input type="radio" name="qna_kind_2" id="qna2_a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span><input type="radio" name="qna_kind_2" id="qna2_b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span><input type="radio" name="qna_kind_2" id="qna2_c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span><input type="radio" name="qna_kind_2" id="qna2_d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span><input type="radio" name="qna_kind_2" id="qna2_e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check++;
				}else if($("#qna_d").prop("checked")&&check==1){
					
				}else{
					$(".qna2_1").remove();
					check--;
				}
			if($("#qna_e").prop("checked")&&check==0){
				$("#qna_kind").append(
						'<input type="radio" name="qna_kind_2" id="qna2_a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span><input type="radio" name="qna_kind_2" id="qna2_b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span><input type="radio" name="qna_kind_2" id="qna2_c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span><input type="radio" name="qna_kind_2" id="qna2_d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span><input type="radio" name="qna_kind_2" id="qna2_e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check++;
				}else if($("#qna_e").prop("checked")&&check==1){
					
				}else{
					$(".qna2_1").remove();
					check--;
				}
			if($("#qna_f").prop("checked")&&check==0){
				$("#qna_kind").append(
						'<input type="radio" name="qna_kind_2" id="qna2_a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span><input type="radio" name="qna_kind_2" id="qna2_b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span><input type="radio" name="qna_kind_2" id="qna2_c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span><input type="radio" name="qna_kind_2" id="qna2_d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span><input type="radio" name="qna_kind_2" id="qna2_e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check++;
				}else if($("#qna_f").prop("checked")&&check==1){
					
				}else{
					$(".qna2_1").remove();
					check--;
				}
			if($("#qna_g").prop("checked")&&check==0){
				$("#qna_kind").append(
						'<input type="radio" name="qna_kind_2" id="qna2_a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span><input type="radio" name="qna_kind_2" id="qna2_b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span><input type="radio" name="qna_kind_2" id="qna2_c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span><input type="radio" name="qna_kind_2" id="qna2_d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span><input type="radio" name="qna_kind_2" id="qna2_e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check++;
				}else if($("#qna_g").prop("checked")&&check==1){
					
				}else{
					$(".qna2_1").remove();
					check--;
				}
			if($("#qna_h").prop("checked")&&check==0){
				$("#qna_kind").append(
						'<input type="radio" name="qna_kind_2" id="qna2_a" value="회원가입" class="qna2_1"><span class="qna2_1"> 회원가입</span><input type="radio" name="qna_kind_2" id="qna2_b" value="번호변경" class="qna2_1"><span class="qna2_1"> 번호변경</span><input type="radio" name="qna_kind_2" id="qna2_c" value="재가입" class="qna2_1"><span class="qna2_1"> 재가입</span><input type="radio" name="qna_kind_2" id="qna2_d" value="비밀번호변경" class="qna2_1"><span class="qna2_1"> 비밀번호변경</span><input type="radio" name="qna_kind_2" id="qna2_e" value="탈퇴" class="qna2_1"><span class="qna2_1"> 탈퇴</span>')
				check++;
				}else if($("#qna_h").prop("checked")&&check==1){
					
				}else{
					$(".qna2_1").remove();
					check--;
				}
			
			
			});
	</script>
</body>
</html>