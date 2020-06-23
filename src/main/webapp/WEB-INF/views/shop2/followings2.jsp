<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
<c:import url="../template/nav.jsp"></c:import>

		<h1> 팔로잉페이지</h1>
		
		<c:import url="../template/shopmain2.jsp"></c:import>

	<div class="container">
		<div style="border: 1px solid black; width: 1024px; height: 340px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
				<button class="btn btn-info">
					<a href="./myshop2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">상품</a>
				</button>

				<button class="btn btn-info">
					<a href="./comments2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">상점문의</a>
				</button>

				<button class="btn btn-info">
					<a href="./favorites2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}"> 찜</a>
				</button>

				<button class="btn btn-info">
					<a href="./reviews2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">상점후기</a>
				</button>

				<button class="btn btn-danger">
					<a href="./followings2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">팔로잉</a>
				</button>

				<button class="btn btn-info">
					<a href="./followers2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">팔로워</a>
				</button>

			</div>


			<div>
				<h2>내용</h2>

			</div>

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->
</body>
</html>