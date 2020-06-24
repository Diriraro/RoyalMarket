<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
		
		<c:import url="../template/shopmain.jsp"></c:import>

	<div class="container">
		<div style="border: 1px solid black; width: 1024px; height: 340px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
				<button class="btn btn-info">
					<a href="./myshop?mem_storeNum=${mem_storeNum}">상품</a>
				</button>

				<button class="btn btn-info">
					<a href="./comments?mem_storeNum=${mem_storeNum}">상점문의</a>
				</button>

			<!-- 찜페이지 버튼은 나의 상점에서만 가능  -->
			<c:if test="${msnum eq mem_storeNum }">
				<button class="btn btn-info">
					<a href="./favorites?mem_storeNum=${mem_storeNum}"> 찜</a>
				</button>
			</c:if>

				<button class="btn btn-info">
					<a href="./reviews?mem_storeNum=${mem_storeNum}">상점후기</a>
				</button>

				<button class="btn btn-danger">
					<a href="./followings?mem_storeNum=${mem_storeNum}">팔로잉</a>
				</button>

				<button class="btn btn-info">
					<a href="./followers?mem_storeNum=${mem_storeNum}">팔로워</a>
				</button>

			</div>


			<div>
				<h2>내용</h2>
				
				<div style="border: 1px solid red;">
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.take_storeNum}</td>
						</tr>
						
						<br>
						<br>
					</c:forEach>
				</div>
				
				
				

			</div>

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->
</body>
</html>