<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>
	<div class="container">
		<h1>Login Page</h1>

		<form action="./memberLogin" method="post">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="mem_id"
					type="text" class="form-control" name="mem_id" placeholder="ID"
					value="${cookie.cId.value}">
			</div>
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-lock"></i></span> <input id="mem_pw"
					type="password" class="form-control" name="mem_pw"
					placeholder="mem_pw">
			</div>
			
			<!-- <div class="checkbox">
				<label><input type="checkbox" name="remember">
					Remember me</label>
			</div> -->
			<br>
			<button type="submit" class="btn btn-default">로그인</button>
			<a onclick="openChild()">아이디 또는 비밀번호를 잊어버리셨나요?</a>
			<br>
			<br>
			
		</form>
			<div id="kakao-login-btn"></div>
			

	</div>
	
	
	<script type="text/javascript">
	
	var openWin;
	function openChild() {
			// window.name = "부모창 이름"; 
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("./findMember", "childForm",
					"width=600, height=800, resizable = no, scrollbars = no");
		}

	



	Kakao.init('59e57c59aff3a79eda4531bb82ae7989');

	var Referer = '${Referer}';
	
	 Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			Kakao.API.request({
				url : '/v2/user/me',
				success : function(res) {
					$.ajax({
						type : "post",
						url : "./kakaoLogin",
						data : {
							mem_id : res.id,
							mem_email : res.kakao_account['email'],
							mem_name : res.kakao_account.profile['nickname'],
							profile : res.properties.profile_image,
						},
						success : function(result) {
							result = result.trim();
							if (result != null && result != 'newMember') {
								location.href = "../"+Referer;
							} else if (result == 'newMember') {
								location.href = "./kakaoMemberJoin";
							}
						}
					});
				}
				
			});
		},
		fail : function(err) {
		}
	}); 



	</script>

</body>
</html>