<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
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
</style>
<div>
	<header>
		<nav id="header_top">
		<div style="float: left;width: 450px;">
		&nbsp;
		</div>
		<div style="margin-right: 600px;float: left;">
			<a style="margin-right:;" href="/splash"><img
				src="${pageContext.request.contextPath}/resources/images/nav_logo.png"
				width="26" height="39" alt="앱다운로드버튼 이미지"> &nbsp;<font
				style="color: #2a2a2a; font-size: 12px; font-weight: 600;">앱다운로드</font></a>
				&nbsp;&nbsp;&nbsp;
			<a style="margin-right: ;" href="/splash"><img
				src="${pageContext.request.contextPath}/resources/images/favorite.png"
				width="26" height="39" alt="즐겨찾기 이미지"> &nbsp;<font
				style="color: #2a2a2a; font-size: 12px; font-weight: 600;">즐겨찾기</font></a>
		</div>
		<div style="display: inline-block; margin-right: 100px;">
		
	<c:if test="${empty sessionScope.memberVO}">
	<div style="margin-right: 250px;margin-top: 9px;">
	  <a href="${pageContext.request.contextPath}/member/memberLogin"><font style="font-weight: 800; font-size: 13px;color: #666666;">로그인</font></a>
      <font>&nbsp;ㅣ&nbsp;</font>
      <a href="${pageContext.request.contextPath}/member/memberJoin"><font style="font-weight: 800; font-size: 13px;color: #666666;">회원가입</font></a>
    </div>
    </c:if>
    
     <c:if test="${not empty sessionScope.memberVO}">
     <div style="margin-right: 250px;margin-top: 9px;">
      <a href="${pageContext.request.contextPath}/member/memberLogout"> <font style="font-weight: 800; font-size: 13px;color: #666666;">로그아웃</font></a>
      <font>&nbsp;ㅣ&nbsp;</font>
      <a href="${pageContext.request.contextPath}/member/memberPage"> <font style="font-weight: 800; font-size: 13px;color: #666666;">내 상점</font></a>
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
							</select>
						</div>
						<div class="input-group input-group-sm col-xs-2 "
							style="width: 400px;">

							<input type="text" class="form-control" placeholder="Search"
								name="search"
								style="height: 40px; margin-top: 1px; border-bottom: solid 2px #5c2392; 
								border-left: solid 2px #5c2392; 
								border-right: solid 2px #5c2392; 
								border-top: solid 2px #5c2392;">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit" style="height:40px;margin-top:1px;
							border-bottom: solid 2px #5c2392; border-left: solid 1px #5c2392; 
							border-right: solid 2px #5c2392; border-top: solid 2px #5c2392;">
									<i style="color:#5c2392;" class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 검색창 끝 -->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a style="margin-right:;" href="./productNew"><img
				src="${pageContext.request.contextPath}/resources/images/pn_logo.png"
				width="23" height="26" alt="판매하기 이미지"> &nbsp;<font
				style="color: #2a2a2a; font-size: 13px; font-weight: 600;">판매하기</font></a>
				<font>&nbsp;ㅣ&nbsp;</font>
			<a style="margin-right: ;" href="/splash"><img
				src="${pageContext.request.contextPath}/resources/images/ms_logo.png"
				width="23" height="24" alt="나의상점 이미지"> &nbsp;<font
				style="color: #2a2a2a; font-size: 13px; font-weight: 600;">내상점</font></a>


			</div>
		</nav>
	</header>
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


