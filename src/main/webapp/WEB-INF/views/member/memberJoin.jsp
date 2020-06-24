<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
.wmnsE {
	width: 570px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;
	background: rgb(255, 255, 255);
	padding: 60px;
}

.kHXIxY {
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	padding: 100px 0px;
}
</style>
</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>
	<div class="container">
		<h1>member join</h1>
		<form:form modelAttribute="memberVO" action="./memberJoin"
			method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">ID:</label>
				<div class="col-sm-10">
					<form:input path="mem_id" type="text" class="form-control"
						id="mem_id" placeholder="Enter id" />
					<form:errors path="mem_id"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_pw">Password:</label>
				<div class="col-sm-10">
					<form:input path="mem_pw" type="password" class="form-control"
						id="mem_pw" placeholder="Enter password" />
					<form:errors path="mem_pw"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwCheck">Password
					Check:</label>
				<div class="col-sm-10">
					<form:input path="pwCheck" type="password" class="form-control"
						id="pwCheck" placeholder="Check password" />
					<form:errors path="pwCheck"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_name">name:</label>
				<div class="col-sm-10">
					<form:input path="mem_name" type="text" class="form-control"
						id="mem_name" placeholder="Enter name" />
					<form:errors path="mem_name"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_phone">Phone:</label>
				<div class="col-sm-10">
					<form:input path="mem_phone" type="text" class="form-control"
						id="mem_phone" placeholder="휴대폰 번호(숫자만 허용)" />
						<form:errors path="mem_phone"></form:errors>
				</div>
			</div>

			<input type="button" value="인증번호 요청" class="btn btn-default"
				onclick="checkPhone()">
			<!-- <a href="" id="btnCheck" class="btn btn-default">인증번호 요청</a> -->

			<div id="divCheck">
				<label class="control-label col-sm-2" for="phoneCheck">인증번호:</label>
				<div class="col-sm-10">
					<form:input path="phoneCheck" type="text" class="form-control"
						id="phoneCheck" placeholder="인증번호" />
					<div id="ViewTimer"></div>
					<form:errors path="phoneCheck"></form:errors>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="road_address">주소:</label>
				<div class="col-sm-10">
					<form:input path="road_address" type="text" class="form-control"
						id="road_address" placeholder="Enter Address" />
						<form:errors path="road_address"></form:errors>
				</div>
			</div>

			<input type="button" value="주소 검색" class="btn btn-default"
				onclick="openChild()">
			<br>

			<div class="form-group">
				<label class="control-label col-sm-2" for="detail_address">상세
					주소:</label>
				<div class="col-sm-10">
					<form:input path="detail_address" type="text" class="form-control"
						id="detail_address" placeholder="Enter Address" />
				</div>
			</div>
			

			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_email">Email:</label>
				<div class="col-sm-10">
					<form:input path="mem_email" type="text" class="form-control"
						id="mem_email" placeholder="Enter Email" />
					<form:errors path="mem_email"></form:errors>
				</div>
			</div>

			<select name="email1" onchange="getText(this)" id="email1">
				<option>@gmail.com</option>
				<option>@naver.com</option>
				<option>@nate.com</option>
				<option>@daum.net</option>
				<option value="">직접입력</option>
			</select>


			<div class="form-group" id="email" style="display: none;">
				<label class="control-label col-sm-2" for="email">상세 Email:</label>
				<div class="col-sm-10">
					<input name="email2" id="email2" path="email" type="text" class="form-control"
						id="email" placeholder="Enter Email" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" id="btn_submit" onclick="makeEmail()">Submit</button>
				</div>
			</div>
		</form:form>
	</div>

	<script type="text/javascript">
			
		 function checkPhone() {
			var phoneNumber = $('#mem_phone').val();

			$.post("./check/sendSMS", {
				phoneNumber : phoneNumber
			}, function(result) {
				alert(result.trim())
			}) 

		} 

		var openWin;

		function openChild() {
			// window.name = "부모창 이름"; 
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("./findAddress", "childForm",
					"width=570, height=350, resizable = no, scrollbars = no");
		}

		function getText(obj) {
			if (obj.options[obj.selectedIndex].text == "직접입력") {
				$("#email").css("display", "block");
			}else{
				$("#email").css("display", "none");
				}
		}

		function makeEmail(){
			var email = $("#mem_email").val()+$("#email1").val()+$("#email2").val();
			$("#mem_email").val(email);
		}


		var SetTime = 300;		// 최초 설정 시간(기본 : 초)

		function msg_time() {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + ":" + (SetTime % 60);	// 남은 시간 계산
			
			var msg = "<font color='red'>" + m + "</font>";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				
				clearInterval(tid);		// 타이머 해제
				alert("종료");
			}
			
		}

		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
	
		

	</script>


</body>
</html>