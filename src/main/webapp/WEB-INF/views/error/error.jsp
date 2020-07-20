	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(우주마켓) ${code}</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/1a953cf392.js"
	crossorigin="anonymous"></script>
	<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
<style type="text/css">
.container {
	text-align: center;
}

.container {
	cursor: pointer;
}

header {
margin : 10px 0px;
padding-bottom : 20px;
border-bottom : 1px solid #d9d9d9;;
	
}



#myModal {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 800px;
	overflow: hidden;
	height: 800px;
}

.bvbxpR {
	margin-bottom: 10px;
	position: relative;
}

.hkyRQC input {
	width: 100%;
	height: 42px;
	box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 7px 0px;
	padding: 0px 42px 0px 15px;
	border-radius: 4px;
	border-width: 1px;
	border-style: solid;
	border-color: transparent;
	border-image: initial;
}

.hkyRQC {
	margin-bottom: 16px;
	padding: 0px 70px;
}

.cjHLSv {
	width: 222px;
	height: 48px;
	text-align: center;
	color: rgb(255, 255, 255);
	font-weight: bold;
	background: rgb(102, 0, 102);
	border-radius: 4px;
	border: none;
}

button {
	background-color: transparent;
	cursor: pointer;
	outline: none;
}

.cwGThO {
	font-size: 20px;
	line-height: 1.5;
	margin-bottom: 15px;
	text-align: center;
	font-weight: bold;
}

.pmCck {
	line-height: 1.5;
	margin-bottom: 35px;
	text-align: center;
	font-weight: bolder;
}

#login_logo {
	margin-bottom: 30px;
}

#join_btn {
	color: rgb(102, 0, 102);
	text-decoration: none;
}

#find_id {
	text-decoration: none;
	color: black;
	cursor: pointer;
}

#foot {
	font-weight: bold;
}


</style>
</head>
<body>
	<header>
		<nav id="header_top">
			<div style="float: left; width: 450px;">&nbsp;</div>
			<div style="margin-right: 600px; float: left;">
				<a style="margin-right:;" href="../payment/prepare"><img
					src="${pageContext.request.contextPath}/resources/images/nav_logo.png"
					width="26" height="39" alt="앱다운로드버튼 이미지"> &nbsp;<font
					style="color: #2a2a2a; font-size: 12px; font-weight: 600;">앱다운로드</font></a>
				&nbsp;&nbsp;&nbsp; <a style="margin-right:;"
					href="../payment/prepare"><img
					src="${pageContext.request.contextPath}/resources/images/favorite.png"
					width="26" height="39" alt="즐겨찾기 이미지"> &nbsp;<font
					style="color: #2a2a2a; font-size: 12px; font-weight: 600;">즐겨찾기</font></a>
			</div>
			<div style="display: inline-block; margin-right: 100px;">

				<c:if test="${empty sessionScope.member}">
					<div style="margin-right: 250px; margin-top: 9px;">
						<a href="#" data-toggle="modal" data-target="#myModal"> <font
							style="font-weight: 800; font-size: 13px; color: #666666;">로그인</font></a>
						<font>&nbsp;ㅣ&nbsp;</font> <a
							href="${pageContext.request.contextPath}/member/memberJoin"><font
							style="font-weight: 800; font-size: 13px; color: #666666;">회원가입</font></a>
					</div>
				</c:if>

				<c:if test="${not empty sessionScope.member}">
					<div style="margin-right: 250px; margin-top: 9px;">
						<a href="${pageContext.request.contextPath}/member/memberLogout">
							<font style="font-weight: 800; font-size: 13px; color: #666666;">로그아웃</font>
						</a> <font>&nbsp;ㅣ&nbsp;</font> <a
							href="${pageContext.request.contextPath}/shop/myshop?mem_storeNum=${member.mem_storeNum}">
							<font style="font-weight: 800; font-size: 13px; color: #666666;">내
								상점</font>
						</a> <font>&nbsp;ㅣ&nbsp;</font> <a
							href="${pageContext.request.contextPath}/member/memberUpdate">
							<font style="font-weight: 800; font-size: 13px; color: #666666;">계정설정</font>
						</a>
					</div>
				</c:if>
			</div>


		</nav>
	</header>
	<br>
	<section>
		<div class="container">
			<img
				src="${pageContext.request.contextPath}/resources/images/error.png">
			<p>에러 발생 !! : ${code}
			<p>에러 발생 시간 : ${timestamp}</p>
			<br>
			<a id="getHome">우주마켓 홈으로 가기! <i class="fas fa-home"></i></a>
		</div>
	</section>
	
	<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div id="login_logo">
					<img src="../../resources/images/nav_logo2.png"
						class="sc-fYiAbW knQFFQ">
				</div>
				<div class="cwGThO">우주장터로 중고거래 시작하기</div>
				<div class="pmCck">
					15초만에 간편하게 가입하고 <br>상품을 확인하세요!
				</div>

				<div class="sc-dymIpo hkyRQC">
					<form
						action="${pageContext.request.contextPath}/member/memberLogin"
						method="post">
						<div class="sc-bnXvFD bvbxpR">
							<input id="mem_id" type="text" class="form-control" name="mem_id"
								placeholder="ID" value="${cookie.cId.value}">
						</div>
						<div class="sc-gFaPwZ jFjtUg">
							<input id="mem_pw" type="password" class="form-control"
								name="mem_pw" placeholder="비밀번호">
						</div>
						<br> <br>
						<div style="text-align: center;">
							<button type="submit" class="sc-fhYwyz cjHLSv">우주장터 이용하기
							</button>
							<br> <br>
							<div id="kakao-login-btn"></div>
						</div>
					</form>
				</div>


				<div class="modal-footer" id="foot">
					아직 계정이없으세요? <a
						href="${pageContext.request.contextPath}/member/memberJoin"
						id="join_btn">회원가입하기</a><br> <a onclick="openChild()"
						id="find_id">아이디 또는 비밀번호를 잊어버리셨나요?</a><br>
				</div>
			</div>

		</div>
	</div>

</div>
	<c:import url="../template/footer.jsp"></c:import>
	<script type="text/javascript">
		$("#getHome").click(function() {
			location.href = "/";
		})
		var openWin;
	function openChild() {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window
				.open("${pageContext.request.contextPath}/member/findMember",
						"childForm",
						"width=500, height=600, resizable = no, scrollbars = no, toolbar = no");
	}

	Kakao.init('59e57c59aff3a79eda4531bb82ae7989');

	var Referer = '${Referer}';

	Kakao.Auth
			.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					Kakao.API
							.request({
								url : '/v2/user/me',
								success : function(res) {
									$
											.ajax({
												type : "post",
												url : "${pageContext.request.contextPath}/member/kakaoLogin",
												data : {
													mem_id : res.id,
													mem_email : res.kakao_account['email'],
													mem_name : res.kakao_account.profile['nickname'],
													profile : res.properties.profile_image,
												},
												success : function(result) {
													result = result.trim();
													if (result != null
															&& result != 'newMember') {
														location.href = "../"
																+ Referer;
													} else if (result == 'newMember') {
														location.href = "${pageContext.request.contextPath}/member/kakaoMemberJoin";
													}
												}
											});
								}

							});
				},
				fail : function(err) {
				}
			});

	var openWin;
	function openChild() {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open(
				"${pageContext.request.contextPath}/member/findMember",
				"childForm",
				"width=600, height=800, resizable = no, scrollbars = no");
	}
	</script>
</body>
</html>