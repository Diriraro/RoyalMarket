<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
#recentBox {
	position: fixed;
	right: calc(50% - 830px);
	top:200px;
	width: 200px;
	text-align: center;
	border-top: 1px solid rgb(204, 204, 204);
	border-left: 1px solid rgb(204, 204, 204);
	border-right: 1px solid rgb(204, 204, 204);
	border-bottom: 1px solid rgb(204, 204, 204);
	padding: 10px;
	overflow: hidden;
	padding: 10px;
	box-sizing: border-box;
}

.recentSearchContainer {
	text-align: center;
}

.recentSearchContainer>img {
	border-radius: 50%;
	width: 100px;
}

#header_top {
	width: 1900px;
	height: 39px;
	position: absolute;
	top: 0px;
	z-index: 50;
	margin: 0 auto;
	background-color: white;
	clear: both;
	font-size: 12px;
	padding: 0px;
	text-align: center;
	z-index: 1
}

#header_wrap {
	position: absolute;
	top: 39px;
	width: 1900px;
	height: 146px;
	background-color: white;
	border-bottom: 1px solid rgba(255, 255, 255, .3);
	z-index: 1
}

body {
	padding-top: 185px;
	/* 생략 */
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
	font-family: "Noto Sans KR", sans-serif;
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

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; 
    // remove the gap so it doesn't close
    
 }
 
 .glyphicon:hover{
 	color: #5c2392;
 }
 .kind{
 color: #212121;
 }
 
  .kind:hover{
 	background-color: #5c2392;
 	color: white;
 }

</style>
<div class="n">
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


	<header id="header_wrap"
		style="border-bottom: solid 1px #e4e4e4; border-top: solid 1px #e4e4e4;">
		<nav class="nav navbar-nav">
			<div style="margin-top: 30px; margin-left: 430px;">
				<a href="../"><img
					src="${pageContext.request.contextPath}/resources/images/nav_logo2.png"
					alt="로고"></a>
				<!-- 검색창 -->
			<div style="margin-left: 90px; display: inline-block;">
					<form action="./productList" class="form-inline">
						<div class="input-group input-group-sm col-xs-2"
							style="display: inline-block;border-radius:3px 3px 3px 3px; width:90px;
							border-bottom: solid 2px #5c2392; 
							border-left: solid 2px #5c2392; 
							border-right: solid 2px #5c2392; 
							border-top: solid 2px #5c2392;">
							<select class="form-control" id="sel1" name="kind"
								style="height: 36px;">
								<option value="sp">제품명</option>
								<option value="sk">종류</option>
								<option value="st">태그</option>
								<option style="display: none;" value="smn"></option>
							</select>
						</div>
						<div class="input-group input-group-sm col-xs-2 "
							style="width: 400px;">

							<input type="text" class="form-control" placeholder="Search"
								name="search" id="search"
								style="height: 40px; margin-top: 1px; border-bottom: solid 2px #5c2392; border-left: solid 2px #5c2392; border-right: solid 2px #5c2392; border-top: solid 2px #5c2392;">
							<div class="input-group-btn">
								<button class="btn btn-default" id="search_btn" type="submit"
									style="height: 40px; margin-top: 1px; border-bottom: solid 2px #5c2392; border-left: solid 1px #5c2392; border-right: solid 2px #5c2392; border-top: solid 2px #5c2392;">
									<i style="color: #5c2392;" class="glyphicon glyphicon-search"></i>

								</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 검색창 끝 -->

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a style="margin-right:;" href="../product/productNew"><img
				src="${pageContext.request.contextPath}/resources/images/pn_logo.png"
				width="23" height="26" alt="판매하기 이미지"> &nbsp;<font
				style="color: #2a2a2a; font-size: 13px; font-weight: 600;">판매하기</font></a>
				<font>&nbsp;ㅣ&nbsp;</font>
				<img src="${pageContext.request.contextPath}/resources/images/ms_logo.png" width="23" height="24" alt="나의상점 이미지"> 
				
				<div class="dropdown"style="display: inline-block;">
				  <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="width: 50px; height: 50px;margin-right: 10px;">
					<font style="color: #2a2a2a; font-size: 13px; font-weight: 600;">내 상점</font>
				  <span class="caret"></span></button>
				  <ul style="width: 51px;" class="dropdown-menu"> 
				    <li><a href="../shop/myshop?mem_storeNum=${member.mem_storeNum}">내상점</a></li>
				    <li><a href="../payment/buy_History">구매내역</a></li>
				    <li><a href="../payment/sell_History">판매내역</a></li>
				  </ul>

				</div>
				<%-- 	<a style="margin-right: ;" href="../shop/myshop?mem_storeNum=${member.mem_storeNum}"><img
				src="${pageContext.request.contextPath}/resources/images/ms_logo.png"
				width="23" height="24" alt="나의상점 이미지"> &nbsp;<font
				style="color: #2a2a2a; font-size: 13px; font-weight: 600;">내상점</font></a> --%>
				<font>&nbsp;&nbsp;&nbsp;ㅣ&nbsp;</font> <a style="margin-right:;"
					href="javascript:popup()"><img
					src="${pageContext.request.contextPath}/resources/images/pointCharge22.jpg"
					width="45" height="30" alt=포인트 충전이미지"> &nbsp;<font
					style="color: #2a2a2a; font-size: 13px; font-weight: 600;">포인트
						충전</font></a>


			</div>
			<!-- 카테고리 드롭다운  -->
			<div class="dropdown"style="display: inline-block;margin-left: 410px;margin-top: 18px;">
				  <button  class="btn btn-lg dropdown-toggle" type="button" data-toggle="dropdown" >
				    <span  class="	glyphicon glyphicon-menu-hamburger"></span>
				  </button>
				  <ul class="dropdown-menu">
				   <div style="border-bottom: solid 1px #e5e5e5;height: 40px;text-align: left;line-height: 40px;">
				    <font style="margin-left:25px;;font-weight: 800;">전체 카테고리</font></div>
				    
				<a href="../payment/buy_History">
				<button type="button" class="kind" value="패션잡화" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 170px;">패션잡화</font></button></a>
				
				<button type="button" class="kind" value="여성의류" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 170px;">여성의류</font></button>
				
				<button type="button" class="kind" value="남성의류" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 170px;">남성의류</font></button>
				
				<button type="button" class="kind" value="디지털/가전" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 152px;">디지털/가전</font></button>
				
				<button type="button" class="kind" value="생활/문구/가구/식품" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 98px;">생활/문구/가구/식품</font></button>
				
				<button type="button" class="kind" value="유아동/출산" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 152px;">유아동/출산</font></button>
				
				<button type="button" class="kind" value="스타굿즈" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 170px;">스타굿즈</font></button>
				
				<button type="button" class="kind" value="스포츠/레저" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 152px;">스포츠/레저</font></button>
				
				<button type="button" class="kind" value="뷰티/미용" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 166px;">뷰티/미용</font></button>
				    
				  </ul>
				</div>
		</nav>
	</header>
</div>

<div id="recentBox">
	<div id="recent"></div>
</div>

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







<script type="text/javascript">
	$(window).scroll(function(e) {
		if ($(this).scrollTop() > 5) {
			$('body').addClass('scrolled');
			$('#header_wrap').css("top", "0px").css("position", "fixed");
		} else {
			$('body').removeClass('scrolled');
			$('#header_wrap').css("top", "39px").css("position", "absolute");
		}
	});

</script>



<script type="text/javascript">
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
	$(function() {
		var cookie = getCookie("recentSearch");
		if (cookie != null) {
			$.get(
					"${pageContext.request.contextPath}/product/recentSearchProduct?sell_num="
							+ cookie, function(result) {
						$("#recent").empty();
						$("#recent").append(result);
					})
		} else {
			$("#recent")
					.append(
							'<label>최근본 상품</label> <div style="padding-top : 5px;margin-top : 5px; border-top : 0.5px dotted black;"> 최근 본 상품이 없습니다.</div>');
		}

	})

	function getCookie(cname) {
		var name = cname + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
		return null;
	}

	function popup() {
		var url = "../payment/pointCharge";
		var name = "포인트 충전";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
</script>
