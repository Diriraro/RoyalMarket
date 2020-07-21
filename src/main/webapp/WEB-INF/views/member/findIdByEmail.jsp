<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 찾기</title>
<c:import url="../template/boot.jsp"></c:import>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.logo {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;

}

#find_id {
	text-align:center;
	background-color: white;
	padding-bottom: 10px;
	

}

#find_pw{
	text-align:center;
	background-color: white;
	padding-bottom: 10px;
}

h3 {
	text-align: center;
	color: rgb(102, 0, 102);
	font-family: "Noto Sans KR", sans-serif;
    font-weight: 1000;
}

h4 {

	cursor: pointer;
	font-family: "Noto Sans KR", sans-serif;
    font-weight: 1000;
}

body {
	background-color: rgb(249, 249, 249);
}

html, body {
	height: 100%;
	width: 100%;
	font-family: -apple-system, BlinkMacSystemFont, "Apple SD Gothic Neo",
		"Helvetica Neue", "맑은 고딕", sans-serif;
	font-size: 16px;
}

.kVlvmu {
	width: 40px;
	display: flex;
	height: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	flex-shrink: 0;
}

button, input {
	padding: 0px;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
}

body, input, textarea, select, button {
	-webkit-font-smoothing: antialiased;
	direction: ltr;
	text-align: left;
	color: rgb(33, 33, 33);
	letter-spacing: -0.5px;
	outline: 0px;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
}

.liBHhX:last-child {
	margin-bottom: 0px;
}

.liBHhX {
	height: 50px;
	box-shadow: rgb(76, 76, 76) 0px 1px 0px 0px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.wmnsE {
	width: 650px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;
	background: rgb(255, 255, 255);
	padding: 70px;
}

.fSETiC {
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	padding: 100px 0px;
}

.MGjwe {
	min-width: 1236px;
}

body, input, textarea, select {
	-webkit-font-smoothing: antialiased;
	direction: ltr;
	text-align: left;
	color: rgb(33, 33, 33);
	letter-spacing: -0.5px;
	outline: 0px;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
}

#back {
	width: 100px;
	height: 32px;
	flex-shrink: 0;
	text-align: center;
	color: rgb(255, 255, 255);
	font-size: 13px;
	border-radius: 2px;
	margin: 0px 7px 0px 30px;
	background: rgb(102, 0, 102);
	margin-left: 80%;
	border-radius: 10px;
	font-weight: bold;
	margin-top: 20px;
}

body {
	background-color: rgb(249, 249, 249);
	font-size: 14px;
}

.tNFPZ {
	font-size: 30px;
}

.tNFPZ {
	font-size: 30px;
}

.fCwiRj {
	height: 50px;
	box-shadow: rgb(76, 76, 76) 0px 1px 0px 0px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.kVlvmu {
	width: 40px;
	display: flex;
	height: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	flex-shrink: 0;
}

.kThGwo {
	margin-bottom: 45px;
}

.biGiRA {
	margin-bottom: 45px;
	text-align: center;
}

#rq_num {
	width: 100px;
	height: 32px;
	flex-shrink: 0;
	text-align: center;
	color: rgb(255, 255, 255);
	font-size: 13px;
	border-radius: 2px;
	margin: 0px 7px 0px 30px;
	background: rgb(102, 0, 102);
}

.mail {
	width: 100px;
	height: 32px;
	flex-shrink: 0;
	text-align: center;
	color: rgb(255, 255, 255);
	font-size: 13px;
	border-radius: 2px;
	margin: 0px 7px 0px 40px;
	background: rgb(102, 0, 102);
}

.mail:hover{
	background-color: rgb(102, 0, 102);
	color: white; 
}





#address {
	width: 100px;
	height: 32px;
	flex-shrink: 0;
	text-align: center;
	color: rgb(255, 255, 255);
	font-size: 13px;
	border-radius: 2px;
	margin: 0px 7px 0px 180px;
	background: rgb(179, 179, 179);
}

.gqqaLP {
	color: rgb(255, 255, 255);
	width: 100%;
	height: 56px;
	text-align: center;
	font-size: 18px;
	background: rgb(247, 47, 51);
	margin-top: 30px;
}

.error_msg {
	color: red;
	font-size: small;
	font-weight: bold;
}

#ViewTimer {
	margin: 0px 7px 0px 140px;
}

.ubhSQ {
	margin-bottom: 50px;
}

.llQLqu {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.ettlGe {
	margin-bottom: 20px;
}

.lerNRt {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.dDiVis {
	width: 24px;
	height: 24px;
	cursor: pointer;
	position: relative;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(238, 238, 238);
	border-image: initial;
	transition: border 0.2s ease 0s, background-color 0.2s ease 0s;
}

.kZHPTS {
	margin-left: 12px;
	-webkit-box-flex: 1;
	flex-grow: 1;
}

.ettlGe {
	margin-bottom: 20px;
}

.lerNRt {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.dDiVis {
	width: 24px;
	height: 24px;
	cursor: pointer;
	position: relative;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(238, 238, 238);
	border-image: initial;
	transition: border 0.2s ease 0s, background-color 0.2s ease 0s;
}

.kZHPTS {
	margin-left: 12px;
	-webkit-box-flex: 1;
	flex-grow: 1;
	font: Noto Sans CJK KR;
}

.bOqqay {
	color: rgb(247, 47, 51);
	margin-right: 5px;
}

.dDiVis::before {
	content: "";
	position: absolute;
	bottom: 5px;
	left: 2px;
	width: 8px;
	height: 14px;
	transform: rotate(40deg);
	transform-origin: 100% 100%;
	border-top: 2px solid transparent;
	border-left: 2px solid transparent;
	border-right: 2px solid rgb(204, 204, 204);
	border-bottom: 2px solid rgb(204, 204, 204);
}

.dDiVis::after {
	content: "";
	position: absolute;
	bottom: 5px;
	left: 2px;
	width: 0px;
	height: 0px;
	transform: rotate(40deg);
	transform-origin: 100% 100%;
	border-top: 2px solid transparent;
	border-left: 2px solid transparent;
	border-right: 2px solid transparent;
	border-bottom: 2px solid transparent;
	transition: width 0.1s ease-out 0s, height 0.1s ease-out 0.1s;
}

.ivGQtp::before {
	content: "";
	position: absolute;
	bottom: 5px;
	left: 2px;
	width: 8px;
	height: 14px;
	transform: rotate(40deg);
	transform-origin: 100% 100%;
	border-top: 2px solid transparent;
	border-left: 2px solid transparent;
	border-right: 2px solid rgb(204, 204, 204);
	border-bottom: 2px solid rgb(204, 204, 204);
}

*, ::before, ::after {
	box-sizing: border-box;
}

button, input {
	padding: 0px;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
}

body, input, textarea, select, button {
	-webkit-font-smoothing: antialiased;
	direction: ltr;
	text-align: left;
	color: rgb(33, 33, 33);
	letter-spacing: -0.5px;
	outline: 0px;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
}

.dcHFEn img {
	transition: all 0.5s ease 0s;
}

img {
	vertical-align: bottom;
}

img {
	border-style: none;
}

html, body {
	height: 100%;
	width: 100%;
	font-family: -apple-system, BlinkMacSystemFont, "Apple SD Gothic Neo",
		"Helvetica Neue", "맑은 고딕", sans-serif;
	font-size: 16px;
}

.fFrJW {
	width: 100%;
}

iframe {
	width: 100%;
	margin-bottom: 20px;
}

.ivGQtp {
	width: 24px;
	height: 24px;
	cursor: pointer;
	position: relative;
	background: rgb(247, 47, 51);
	border-width: 1px;
	border-style: solid;
	border-color: rgb(247, 47, 51);
	border-image: initial;
	transition: border 0.2s ease 0s, background-color 0.2s ease 0s;
}

input {
	width: 100%;
}

.jRNgFE {
    background: rgb(249, 249, 249);
}

.isYAvJ {
	text-align: center;
	margin-top: 100px;
	margin-left : 
	height:500px;
    padding: 60px;
    background: rgb(255, 255, 255);
}

.box{
	padding:3px;
	background: rgb(244, 244, 250);
	margin: 10px 10px 10px 10px;
}

body{
	padding: 0 10%;
}

.box{
	margin-top: 50px;
}
</style>
</head>
<body>

<h4 id="show2" class="sh box">E-MAIL로 아이디 찾기</h4>
			<div class="show2">
				<form:form modelAttribute="memberVO" action="./findIdByEmail"
					method="post">
					<input name="mem_name" value="" type="hidden">
					<input name="road_address" value="" type="hidden">

					<div class="sc-lhLRcH csuEuq">
						<div class="sc-jMtzgO liBHhX">
							<div class="sc-kAKrxA kVlvmu">
								<i class="glyphicon glyphicon-user"
									style="width: 20; height: 20; color: gray"></i>
							</div>
							<form:input path="mem_name" type="text" id="mem_name1"
								placeholder="이름" />

						</div>
					</div>
					<form:errors path="mem_name" class="error_msg"></form:errors>

					<div class="sc-lhLRcH csuEuq">
						<div class="sc-jMtzgO liBHhX">
							<div class="sc-kAKrxA kVlvmu">
								<img alt="이메일 Input 아이콘"
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAeCAYAAABE4bxTAAAAAXNSR0IArs4c6QAAAmNJREFUWAntlz9IG1Ecx3OXZFCSTUhLN0EoxTrUqYOgdOrYRZ2UTtmv2RIv/whZYvZMpVPRReriVKo4CKVmsB0KmYsG3C60kL9+v+m9xxnvvAvkzgz+4HHvfr/fe98Pv/e7u0TJ5XKD0BSZOkUsQ5SIAEKlFDF/iKs4qamrkASqVCpzD1EZalq1JVCr1fpqDQQFR01qCz0JBMdS0FAWmCU7oIsgoUZgqD00WaFYLPYGnkCgRmFM7dtAqVTqOggoOxhq/69PKCQrRIffUG4wZLgF5CeUFxhbID+gvMI4Ak0SahyYe4EcoE7K5fI8Y16MuXi3nSCX75kLPjTWBrbb404PjSZZGr2O2It2u/29UChsDQYDx7WMMYe5XINR9wJDbUV8Zd2+9tVqdcYwjI8Q2+BC2G+MfUVRjqPR6B86Op3OM8RXMV3HeI4RQnwvHo+/1zTtH++dTHDInx9OicJvbriZz+c/w1eE8EtcdVx1VEKkyStAfuJmJ5vNfpFODxPPQGIvCgDisFQqLfd6vbeYLyL2xIxfAeRXOBw+SqfT55iP/Wt0bCAKm0I/MOWwtUwmY+t3czo2pttCv+KPQG6VVdEPBpPQpE/dkv2KC22yqHhKGhTqdruv/BJ027ff7y8zhywq7MBc8AGOwP8KURNAGhnIoiYSiSpK1UBgrVgs7gQJRS1Tc40MQxaS4bvzGsFTjDAC3+DajUQidbzcLhmftLFnzBbhqRCmh7Gi6/qZPCIT6hMSFiYNcN9+AGlgbBOGeRKIN7VabbbZbGo403dIWgBcnP5JG/Y2sDcb+IDHlEwm/wqNGyY5cTR18XRcAAAAAElFTkSuQmCC"
									width="18" height="15">
							</div>
							<form:input path="mem_email" type="text" id="mem_email"
								placeholder="이메일 입력" />
							<input type="button" value="아이디 찾기" class="btn btn-default mail"
								id="btn_mail" onclick="checkEmail()">

						</div>
					</div>
					<form:errors path="mem_email" class="error_msg"></form:errors>

				</form:form>

			</div>
				<a class="btn btn-default" id="back" href="./findMember">뒤로가기</a>
			
			
			<script type="text/javascript">
	/*  var time = "${time}";

	 if(time=="time"){
		TimerStart4();
	}   */
	
	
	var name="";

		
		function checkEmail() {
			var email = $('#mem_email').val();
			var name = $('#mem_name1').val();
			$.post("./check/findIdByEmail", {
				name : name,
				email : email,
			}, function(result) {
				alert(result.trim())
			})
		}
		
		function checkPhone() {
			var phoneNumber = $('#mem_phone').val();
			var name = $('#mem_name').val();
			$.post("./check/findIdByPhone", {
				name : name,
				phoneNumber : phoneNumber,
			}, function(result) {
				alert(result.trim())
			})
		}

		function setParentText() {

			window.close();
		}

		var SetTime = 300;
		
		var tid=0;

		function msg_time3() {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + ":" + (SetTime % 60);	// 남은 시간 계산
			
			var msg = "<font color='red'>" + m + "</font>";
			
			document.all.ViewTimer3.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소

			$("#time").val(SetTime);
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				alert("인증번호가 만료되었습니다.");
			}
		}
		
		
		function msg_time4() {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + ":" + (SetTime % 60);	// 남은 시간 계산
			
			var msg = "<font color='red'>" + m + "</font>";
			
			document.all.ViewTimer4.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소

			$("#time").val(SetTime);
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				alert("인증번호가 만료되었습니다.");
			}
			
		}



		function TimerStart3(){ tid=setInterval('msg_time3()',1000) };

		function TimerStart4(){ tid=setInterval('msg_time4()',1000) };
		
		var again = "${again}";

		if(again=="again"){
				alert("입력정보가 틀립니다. 인증번호를 재발급하고 다시 시도해주세요!")
			}
	

		
		
			function checkEmail4(result2) {
				
				var email = $('#mem_email4').val();
				var id = $('#mem_id4').val();
				$(".pw").css("display", "block");
				SetTime= 300;

				$.post("./check/sendEmail", {
					id : id,
					email : email,
				},function(result) {
					alert(result.trim());
					
					if(result.trim()=="인증 메일을 전송했습니다") {
						clearInterval(tid);
						TimerStart4();
					} else {
						return;
					}
				})
			}


			function checkPhone3(result2) {
				var phoneNumber = $('#mem_phone3').val();
				var id = $('#mem_id3').val();
				$(".pw").css("display", "block")
				SetTime= 300;
	
				$.post("./check/sendSMS", {
					id : id,
					phoneNumber : phoneNumber
				}, function(result) {
					
					alert(result.trim());
					if(result.trim()=="인증 메세지를 전송했습니다") {
						clearInterval(tid);
						TimerStart3();
					} else {
						return;
					}
				})
			}

	

		
	
		
		
		
	</script>

</body>
</html>