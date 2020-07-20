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
<h4 id="show4" class="sh box">E-MAIL인증으로 비밀번호 찾기</h4>
			<div class="show4">
				<form:form modelAttribute="memberVO" action="./findPwByEmail"
					method="post" name="findPwByEmail">
					<input name="mem_name" value="이름" type="hidden">
					<input name="road_address" value="도로명 주소" type="hidden">

					<div class="sc-lhLRcH csuEuq">
						<div class="sc-jMtzgO liBHhX">
							<div class="sc-kAKrxA kVlvmu">
								<i class="far fa-id-card"
									style="width: 25; height: 25; color: gray"></i>
							</div>
							<form:input path="mem_id" type="text" id="mem_id4"
								placeholder="아이디" />

						</div>
					</div>
					<form:errors path="mem_id" class="error_msg"></form:errors>


					<div class="sc-lhLRcH csuEuq">
						<div class="sc-jMtzgO liBHhX">
							<div class="sc-kAKrxA kVlvmu">
								<img alt="이메일 Input 아이콘"
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAeCAYAAABE4bxTAAAAAXNSR0IArs4c6QAAAmNJREFUWAntlz9IG1Ecx3OXZFCSTUhLN0EoxTrUqYOgdOrYRZ2UTtmv2RIv/whZYvZMpVPRReriVKo4CKVmsB0KmYsG3C60kL9+v+m9xxnvvAvkzgz+4HHvfr/fe98Pv/e7u0TJ5XKD0BSZOkUsQ5SIAEKlFDF/iKs4qamrkASqVCpzD1EZalq1JVCr1fpqDQQFR01qCz0JBMdS0FAWmCU7oIsgoUZgqD00WaFYLPYGnkCgRmFM7dtAqVTqOggoOxhq/69PKCQrRIffUG4wZLgF5CeUFxhbID+gvMI4Ak0SahyYe4EcoE7K5fI8Y16MuXi3nSCX75kLPjTWBrbb404PjSZZGr2O2It2u/29UChsDQYDx7WMMYe5XINR9wJDbUV8Zd2+9tVqdcYwjI8Q2+BC2G+MfUVRjqPR6B86Op3OM8RXMV3HeI4RQnwvHo+/1zTtH++dTHDInx9OicJvbriZz+c/w1eE8EtcdVx1VEKkyStAfuJmJ5vNfpFODxPPQGIvCgDisFQqLfd6vbeYLyL2xIxfAeRXOBw+SqfT55iP/Wt0bCAKm0I/MOWwtUwmY+t3czo2pttCv+KPQG6VVdEPBpPQpE/dkv2KC22yqHhKGhTqdruv/BJ027ff7y8zhywq7MBc8AGOwP8KURNAGhnIoiYSiSpK1UBgrVgs7gQJRS1Tc40MQxaS4bvzGsFTjDAC3+DajUQidbzcLhmftLFnzBbhqRCmh7Gi6/qZPCIT6hMSFiYNcN9+AGlgbBOGeRKIN7VabbbZbGo403dIWgBcnP5JG/Y2sDcb+IDHlEwm/wqNGyY5cTR18XRcAAAAAElFTkSuQmCC"
									width="18" height="15">
							</div>
							<form:input path="mem_email" type="text" id="mem_email4"
								placeholder="이메일 입력" />
							<input type="button" value="인증번호 요청" class="btn btn-default mail"
								id="btn_mail2" onclick="checkEmail4()">

						</div>
					</div>
					<form:errors path="mem_email" class="error_msg"></form:errors>

					<div class="sc-lhLRcH csuEuq">
						<div class="sc-jMtzgO liBHhX">
							<div class="sc-kAKrxA kVlvmu">
								<img alt="인증번호 Input 아이콘"
									src="data:image/png;base64,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"
									width="19" height="20">
							</div>
							<form:input path="phoneCheck" type="text" id="phoneCheck"
								placeholder="인증번호" />
							<div id="ViewTimer4"></div>

						</div>
					</div>
					<form:errors path="phoneCheck" class="error_msg"></form:errors>

					<div class="sc-lhLRcH csuEuq">
						<div class="sc-jMtzgO liBHhX">
							<div class="sc-kAKrxA kVlvmu">
								<img alt="비밀번호 확인 Input 아이콘"
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAoCAYAAACfKfiZAAAAAXNSR0IArs4c6QAAAktJREFUWAntVk1IYlEU9j0fKi2GCINoEbOJGLdFthtdtGhhQZEQBTMQRBBEm8gJ/9ei4CIwoha1cBbNajZu1GhTMtN2ZtMmJKQg0DQURp3vhj7svVO8VGpzLxzuved85+d+790fQaehhUIhc6lUWgTUUa/XR9APQCSF6x3mWUhSFMW41+s9V9jJqUBqG0okE4PB4Cb6bag+vIQlbD9NJtOay+W6Imyy6tkCYrFYTy6XiyO5o4FOCoKwbzQaT61W67Xdbv8nR8EgHA73FYvF4VqtNo3pKqQPciNJ0ozb7T7DmGxkAUgqYOXf0c8j6T0o/erxeH6QEQhlJBLpLRQKO/BfgPlOr9ePw/+SgOr0lBIJl+H8DbYHjG34nkkK95wukUiU0+n0sc1mMwPzGbEmMN+j8KJSGY1GjXAIMj1Wv47kv5UYrXOLxbIBbAYyHggE5ig/VQH5fH4SwEEk/4PkB5STVp3T6ayC/q0G/gvlpyqgWq1OMSAKiENqlNNrdPgBT4DPgtXJVCql3Lo6VQEAf2QJ4NA29cy/2bCIOsYXEFMmk2Hnx5OmKgAO/QyB/uYJsrPJY6xKpfIYuzWUqgAYm7qO6W9J1IzVjC2bVArZ8kYDXgBngF06o63/G/b/IeQTtuES5G+rrd0xbkh2nc8qYxoMhlsJxl9UYBRxBKFMbeuUMcvl8q58NKK6rpx8WqpDIexAGmJYuQCfzzemxbkbGHz2FTAfY7H4LuAMcAY4A5wBzgBngDPAGZCfZH6/v7sv0BfebniOydZ3/wT/AfO7xyldFzaLAAAAAElFTkSuQmCC"
									width="16" height="20">
							</div>
							<form:input path="mem_pw" type="password" id="mem_pw"
								placeholder="새로운 비밀번호 6-16자" />

						</div>
					</div>
					<form:errors path="mem_pw" class="error_msg"></form:errors>
					
					<div class="sc-lhLRcH csuEuq">
						<div class="sc-jMtzgO liBHhX">
							<div class="sc-kAKrxA kVlvmu">
								<img alt="비밀번호 확인 Input 아이콘"
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAoCAYAAACfKfiZAAAAAXNSR0IArs4c6QAAAktJREFUWAntVk1IYlEU9j0fKi2GCINoEbOJGLdFthtdtGhhQZEQBTMQRBBEm8gJ/9ei4CIwoha1cBbNajZu1GhTMtN2ZtMmJKQg0DQURp3vhj7svVO8VGpzLxzuved85+d+790fQaehhUIhc6lUWgTUUa/XR9APQCSF6x3mWUhSFMW41+s9V9jJqUBqG0okE4PB4Cb6bag+vIQlbD9NJtOay+W6Imyy6tkCYrFYTy6XiyO5o4FOCoKwbzQaT61W67Xdbv8nR8EgHA73FYvF4VqtNo3pKqQPciNJ0ozb7T7DmGxkAUgqYOXf0c8j6T0o/erxeH6QEQhlJBLpLRQKO/BfgPlOr9ePw/+SgOr0lBIJl+H8DbYHjG34nkkK95wukUiU0+n0sc1mMwPzGbEmMN+j8KJSGY1GjXAIMj1Wv47kv5UYrXOLxbIBbAYyHggE5ig/VQH5fH4SwEEk/4PkB5STVp3T6ayC/q0G/gvlpyqgWq1OMSAKiENqlNNrdPgBT4DPgtXJVCql3Lo6VQEAf2QJ4NA29cy/2bCIOsYXEFMmk2Hnx5OmKgAO/QyB/uYJsrPJY6xKpfIYuzWUqgAYm7qO6W9J1IzVjC2bVArZ8kYDXgBngF06o63/G/b/IeQTtuES5G+rrd0xbkh2nc8qYxoMhlsJxl9UYBRxBKFMbeuUMcvl8q58NKK6rpx8WqpDIexAGmJYuQCfzzemxbkbGHz2FTAfY7H4LuAMcAY4A5wBzgBngDPAGZCfZH6/v7sv0BfebniOydZ3/wT/AfO7xyldFzaLAAAAAElFTkSuQmCC"
									width="16" height="20">
							</div>
							<form:input path="pwCheck" type="password" id="pwCheck"
								placeholder="비밀번호 확인" />
						</div>
					</div>
					<form:errors path="pwCheck" class="error_msg"></form:errors>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default"  value="확인"   style="width: 100%; background:rgb(102, 0, 102); color: white; margin-top: 10px;" onclick="timeSend();">확인</button>
						</div>
					</div>
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