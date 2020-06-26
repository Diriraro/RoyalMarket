<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/boot.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<h1>Find PW By E-mail</h1>
	<form:form modelAttribute="memberVO" action="./findPwByEmail"
		method="post">
		<input name="mem_name" value="name" type="hidden">
		<input name="road_address" value="road_address" type="hidden">
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="mem_id">ID:</label>
			<div class="col-sm-10">
				<form:input path="mem_id" type="text" class="form-control"
					id="mem_id" placeholder="Enter id" />
				<form:errors path="mem_id"></form:errors>
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
		<input type="button" value="인증번호 요청" class="btn btn-default" id="btn"
			onclick="checkEmail()">

		<div id="divCheck">
			<label class="control-label col-sm-2" for="phoneCheck">인증번호:</label>
			<div class="col-sm-10">
				<form:input path="phoneCheck" type="text" class="form-control"
					id="phoneCheck" placeholder="인증번호" />
				<div id="ViewTimer"></div>
				<form:errors path="phoneCheck"></form:errors>
			</div>
		</div>

		<div class="form-group pw">
			<label class="control-label col-sm-2" for="mem_pw">Password:</label>
			<div class="col-sm-10">
				<form:input path="mem_pw" type="password" class="form-control"
					id="mem_pw" placeholder="Enter password" />
				<form:errors path="mem_pw"></form:errors>
			</div>
		</div>
		<div class="form-group pw">
			<label class="control-label col-sm-2" for="pwCheck">Password
				Check:</label>
			<div class="col-sm-10">
				<form:input path="pwCheck" type="password" class="form-control"
					id="pwCheck" placeholder="Check password" />
				<form:errors path="pwCheck"></form:errors>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">Submit</button>
			</div>
		</div>
	</form:form>

	<script type="text/javascript">
	var SetTime = 300;	
	var tid=0;
	
		function checkEmail(result2) {
			SetTime=300;
			var email = $('#mem_email').val();
			var id = $('#mem_id').val();
			$(".pw").css("display", "block")

			$.post("./check/sendEmail", {
				id : id,
				email : email,
			},function(result) {
				alert(result.trim());
				
				if(result.trim()=="인증 메일을 전송했습니다") {
					clearInterval(tid);
					TimerStart();
				} else {
					return;
				}
			})
		}


		function TimerStart(){ tid=setInterval('msg_time()',1000) };

		
		
		function msg_time() {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + ":" + (SetTime % 60);	// 남은 시간 계산
			
			var msg = "<font color='red'>" + m + "</font>";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				alert("인증번호가 만료되었습니다.");
			}
			
		}
	</script>

</body>
</html>