<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>

<h1>상품 결제</h1>

	<div class="container">
		<h2> 상품 이름</h2> <br>
		<h2> 상품 가격(Test로 10원)</h2> <br>
		<h2> ${memberVO.mem_point}</h2> <br>
		
		<c:if test="${memberVO.mem_point gt 10}">
			<h3>상품결제 완료 페이지 이동</h3>
		</c:if>
		<c:if test="${memberVO.mem_point lt 10 }">
			<h3>포인트 부족 -> pointCharge로 이동</h3>
		</c:if>
		
	
	</div>

</body>
</html>