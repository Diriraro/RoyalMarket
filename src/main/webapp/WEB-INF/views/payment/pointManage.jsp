<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>
	<div class="container">
		<h1>${member.mem_id}님의 Point 내역</h1>
		<table class="table table-hover">
			<tr>
				<td>구분</td>
				<td>포인트량</td>
				<td>잔여 포인트</td>
			</tr>
			<c:forEach  items="${payVO}" var="vo">
				<tr>
					<c:if test="${vo.pay_in eq 1}">
						<td>입금</td>
					</c:if>
					<c:if test="${vo.pay_out eq 1}">
						<td>상품 구매</td>	
					</c:if>
					<c:if test="${vo.pay_in eq 1}">
						<td>+${vo.pay_price}</td>
					</c:if>
					<c:if test="${vo.pay_out eq 1}">
						<td>-${vo.pay_price}</td>
					</c:if>
					
					<td>${vo.point_rest}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>