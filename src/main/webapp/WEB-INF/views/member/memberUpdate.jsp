<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dJCpmB {
	min-width: 1236px;
}

.hDxWCi {
	height: 100vh;
	width: 100%;
	max-width: 600px;
	display: block;
	background: rgb(255, 255, 255);
	margin: auto;
}

.gFPFTs {
	position: fixed;
	top: 0px;
	width: 100%;
	max-width: 600px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 999;
	height: 50px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	font-size: 18px;
	font-weight: bold;
	padding: 0px 10px;
}

.kEHDol {
	display: flex;
	width: 2rem;
	height: 2rem;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	position: absolute;
	left: 10px;
	top: 9px;
}

button {
	background-color: transparent;
	cursor: pointer;
	outline: none;
}

button, input[type="text"], input[type="tel"], input[type="number"] {
	-webkit-appearance: none;
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

.hnoHdo {
	padding-top: 62px;
	width: 100%;
}

.hnoHdo button, .hnoHdo a {
	height: 4rem;
	width: 100%;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	font-size: 15px;
	-webkit-box-pack: justify;
	justify-content: space-between;
	padding: 0px 1rem;
	border-bottom: 1px solid rgb(234, 233, 241);
}

button, [type="button"], [type="reset"], [type="submit"] {
	-webkit-appearance: button;
}

button {
	background-color: transparent;
	cursor: pointer;
	outline: none;
}

.hnoHdo button, .hnoHdo a {
	height: 4rem;
	width: 100%;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	font-size: 15px;
	-webkit-box-pack: justify;
	justify-content: space-between;
	padding: 0px 1rem;
	border-bottom: 1px solid rgb(234, 233, 241);
}

a {
	color: rgb(33, 33, 33);
	cursor: pointer;
	text-decoration: none;
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

body {
	background-color: rgb(249, 249, 249);
	font-size: 14px;
	font-weight: bold;
}

body {
	margin: 0;
	padding: 0;
}

.aa{
	text-decoration: none;
}

.inputPw{
	display: block;
    width: 70%;
    margin: 0 auto;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.cjHLSv {
	width: 150px;
	height: 30px;
	text-align: center;
	color: rgb(255, 255, 255);
	font-weight: bold;
	background: rgb(102, 0, 102);
	border-radius: 4px;
	border: none;
}
</style>
</head>
<body>

	<div class="sc-dfRKBO hDxWCi">
		<header class="sc-iqtXtF gFPFTs">
			<a href="javascript:history.back();" class="sc-jiTwWT kEHDol">
				<img
					src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiMxRTFEMjkiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTE5IDguOTk2SDMuNjZMOS42NTcgMy43NWExIDEgMCAwIDAtMS4zMTYtMS41MDZsLTggN2MtLjAwOC4wMDctLjAxLjAxOC0uMDE5LjAyNWEuOTc1Ljk3NSAwIDAgMC0uMTc3LjI0Yy0uMDE4LjAzLS4wNDUuMDU0LS4wNTkuMDg3YS45NzUuOTc1IDAgMCAwIDAgLjgwMmMuMDE0LjAzMy4wNDEuMDU3LjA2LjA4OC4wNS4wODcuMTAzLjE3LjE3Ni4yMzkuMDA4LjAwNy4wMTEuMDE4LjAyLjAyNWw4IDdhLjk5Ni45OTYgMCAwIDAgMS40MS0uMDk1IDEgMSAwIDAgMC0uMDk1LTEuNDExTDMuNjYgMTAuOTk2SDE5YTEgMSAwIDEgMCAwLTIiLz4KPC9zdmc+Cg=="
					alt="back" width="20" height="20">
			</a>
			계정설정
		</header>


		<div class="sc-jtEaiv hnoHdo">
			<a href="./memberLogout" style="text-decoration: none; height: 70px" class="aa">&nbsp;&nbsp;로그아웃</a> 
			<c:if test="${member.mem_kakao eq 0}">
			<a href="./memberUpdatePage" style="text-decoration: none; height: 70px;">&nbsp;&nbsp;회원정보수정</a> 
			</c:if>
			<c:if test="${member.mem_kakao eq 1}">
			<a href="./kakaoMemberUpdate" style="text-decoration: none; height: 70px;">&nbsp;&nbsp;회원정보수정</a> 
			</c:if>
			<a href="#" data-toggle="modal" data-target="#memberDelete" style="text-decoration: none; height: 70px;">&nbsp;&nbsp;탈퇴</a>
		</div>
	</div>


	<div class="modal fade" id="memberDelete" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="text-align: center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div id="login_logo">
						<img src="../../resources/images/nav_logo2.png"
							class="sc-fYiAbW knQFFQ">
					</div>
					<br><br>
					<div class="cwGThO">정말 탈퇴하시겠습니까?</div>
					<br>
					<div class="pmCck">
						탈퇴하시려면 현재 비밀번호를 입력해주세요
					</div>
					<br>
					<div class="sc-dymIpo hkyRQC">
						<form
							action="${pageContext.request.contextPath}/member/memberDelete"
							method="post">
							
						
							<div class="sc-gFaPwZ jFjtUg">
							<input type="hidden" name="mem_id" value="${member.mem_id}">
								<input id="mem_pw" type="password" class="inputPw"
									name="mem_pw" placeholder="비밀번호" width="70%">
							</div>
							<br>
							
							<div style="text-align: center;">
								<button type="submit" class="sc-fhYwyz cjHLSv">탈퇴하기</button>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
<script type="text/javascript">
 function goBack(){
	window.history.back();
	 }
</script>
</body>
</html>