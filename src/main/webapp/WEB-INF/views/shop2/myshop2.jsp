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
</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>
	<!-- 내상점 버튼 누르면 처음으로 들어오는 곳  -->
	<c:import url="../template/shopmain.jsp"></c:import>

	<h2> 여기는 다른사람 메인</h2>
	
	<div class="container">
		<div style="border: 1px solid black; width: 1024px; height: 340px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
				<button class="btn btn-danger">
					<a href="./myshop2">상품2</a>
				</button>

				<button class="btn btn-info">
					<a href="./comments2">상점문의2</a>
				</button>

				<button class="btn btn-info">
					<a href="./favorites2"> 찜2</a>
				</button>

				<button class="btn btn-info">
					<a href="./reviews2">상점후기2</a>
				</button>

				<button class="btn btn-info">
					<a href="./followings2">팔로잉2</a>
				</button>

				<button class="btn btn-info">
					<a href="./followers2">팔로워2</a>
				</button>

			</div>


			<div>
				<h2>내용</h2>

			</div>

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->


</body>
</html>