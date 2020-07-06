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
.logo {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

#find_id {
	margin-bottom: 100px;
}

h3{
	color: rgb(102, 0, 102);
	font-weight: bold;
	text-align: center;
}
h4{
	text-align: center;
	font-weight: bold;
}
body{

background-color: rgb(249, 249, 249);
}
</style>
</head>

<body>


	<div class="logo">
		<img src="../../resources/images/logo4.JPG"
			class="sc-fYiAbW knQFFQ">
	</div>

	<div style="padding: 0 20% 0% 20%">
		<div id="find_id">
			<h3>아이디 찾기</h3>

			<h4 id="show1" class="sh" title="hide">등록된 전화번호로 아이디 찾기</h4>
			<div class="show1" style="display: none;">
				<form:form modelAttribute="memberVO" action="./findIdByEmail"
					method="post">
					<input name="mem_name" value="" type="hidden">
					<input name="road_address" value="" type="hidden">

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

					<input type="button" value="휴대폰으로 아이디 찾기" class="btn btn-default"
						id="btn" onclick="checkPhone()">


				</form:form>
			</div>

			<h4 id="show2" class="sh">등록된 이메일로 아이디 찾기</h4>
			<div class="show2" style="display: none;">
				<form:form modelAttribute="memberVO" action="./findIdByEmail"
					method="post">
					<input name="mem_name" value="" type="hidden">
					<input name="road_address" value="" type="hidden">

					<div class="form-group">
						<label class="control-label col-sm-2" for="mem_name">name:</label>
						<div class="col-sm-10">
							<form:input path="mem_name" type="text" class="form-control"
								id="mem_name1" placeholder="Enter name" />
							<form:errors path="mem_name"></form:errors>
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
					<input type="button" value="메일로 아이디 찾기" class="btn btn-default"
						id="btn" onclick="checkEmail()">


				</form:form>

			</div>

		</div>

		<div id="find_pw">


			<h3>Password 찾기</h3>





			<h4 id="show3" class="sh">등록된 전화번호로 비밀번호 찾기</h4>
			<div class="show3" style="display: none;">
				<form:form modelAttribute="memberVO" action="./findPwByPhone"
					method="post">
					<input name="mem_name" value="" type="hidden">
					<input name="road_address" value="" type="hidden">
					<input name="mem_email" value="" type="hidden">

					<div class="form-group">
						<label class="control-label col-sm-2" for="mem_id">ID:</label>
						<div class="col-sm-10">
							<form:input path="mem_id" type="text" class="form-control"
								id="mem_id3" placeholder="Enter id" />
							<form:errors path="mem_id"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="mem_phone">Phone:</label>
						<div class="col-sm-10">
							<form:input path="mem_phone" type="text" class="form-control"
								id="mem_phone3" placeholder="휴대폰 번호(숫자만 허용)" />
							<form:errors path="mem_phone"></form:errors>
						</div>
					</div>
					<input type="button" value="인증번호 요청" class="btn btn-default"
						id="btn" onclick="checkPhone3()">

					<div id="divCheck">
						<label class="control-label col-sm-2" for="phoneCheck">인증번호:</label>
						<div class="col-sm-10">
							<form:input path="phoneCheck" type="text" class="form-control"
								id="phoneCheck" placeholder="인증번호" />
							<div id="ViewTimer3"></div>
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
							<button type="submit" class="btn btn-default" id="frm">Submit</button>
						</div>
					</div>
				</form:form>


			</div>

			<h4 id="show4" class="sh">등록된 이메일로 비밀번호 찾기</h4>
			<div class="show4" style="display: none;">
				<form:form modelAttribute="memberVO" action="./findPwByEmail"
					method="post">
					<input name="mem_name" value="" type="hidden">
					<input name="road_address" value="" type="hidden">

					<div class="form-group">
						<label class="control-label col-sm-2" for="mem_id">ID:</label>
						<div class="col-sm-10">
							<form:input path="mem_id" type="text" class="form-control"
								id="mem_id4" placeholder="Enter id" />
							<form:errors path="mem_id"></form:errors>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="mem_email">Email:</label>
						<div class="col-sm-10">
							<form:input path="mem_email" type="text" class="form-control"
								id="mem_email4" placeholder="Enter Email" />
							<form:errors path="mem_email"></form:errors>
						</div>
					</div>
					<input type="button" value="인증번호 요청" class="btn btn-default"
						id="btn" onclick="checkEmail4()">

					<div id="divCheck">
						<label class="control-label col-sm-2" for="phoneCheck">인증번호:</label>
						<div class="col-sm-10">
							<form:input path="phoneCheck" type="text" class="form-control"
								id="phoneCheck" placeholder="인증번호" />
							<div id="ViewTimer4"></div>
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
			</div>

		</div>
	</div>




	<script type="text/javascript">
	var name="";
		$("#show1").click(function() {
			if ($(this).prop("title") == "hide") {
				$(".show2").hide(500);
				$(".show3").hide(500);
				$(".show4").hide(500);

				$(".show1").show(500);
				$(this).prop("title", "show");
			} else {
				$(".show1").hide(500);
				$(this).prop("title", "hide");
			}

		});

		$("#show2").click(function() {
			if ($(this).prop("title") == "hide") {
				$(".show1").hide(500);
				$(".show3").hide(500);
				$(".show4").hide(500);

				$(".show2").show(500);
				$(this).prop("title", "show");
			} else {
				$(".show2").hide(500);
				$(this).prop("title", "hide");
			}

		});

		$("#show3").click(function() {
			if ($(this).prop("title") == "hide") {
				$(".show1").hide(500);
				$(".show2").hide(500);
				$(".show4").hide(500);

				$(".show3").show(500);
				$(this).prop("title", "show");
			} else {
				$(".show3").hide(500);
				$(this).prop("title", "hide");
			}

		});

		$("#show4").click(function() {
			if ($(this).prop("title") == "hide") {
				$(".show1").hide(500);
				$(".show2").hide(500);
				$(".show3").hide(500);

				$(".show4").show(500);
				$(this).prop("title", "show");
			} else {
				$(".show4").hide(500);
				$(this).prop("title", "hide");
			}
		});

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
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				alert("인증번호가 만료되었습니다.");
			}
			
		}



		function TimerStart3(){ tid=setInterval('msg_time3()',1000) };

		function TimerStart4(){ tid=setInterval('msg_time4()',1000) };
		
		var show3 = "${show3}";
		var show4 = "${show4}";
	

		if(show4){
				$(".show4").show(0);
			}

		if(show3){
			$(".show3").show(0);
		}
		
			function checkEmail4(result2) {
				
				SetTime=300;
				var email = $('#mem_email4').val();
				var id = $('#mem_id4').val();
				$(".pw").css("display", "block")

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
				SetTime=300;
				var id = $('#mem_id3').val();
				$(".pw").css("display", "block")

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