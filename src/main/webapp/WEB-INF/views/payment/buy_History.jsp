<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<table class="table table-hover">
			<tr>
				<td>상품번호</td>
				<td>상품 가격</td>
				<td>상태</td>
		<%-- 		<c:if test="${buy.status eq 0}">
					<td>결제 취소</td>
				</c:if> --%>
			</tr>
			<c:forEach items="${buy}" var="vo">
				<tr>
					<td>${vo.sell_num}</td>
					<td>${vo.sell_price}</td>
					
				
					<c:if test="${vo.status eq 0}">
						<td><button class="btn btn-primary" id="productTake" title="${vo.sell_num}">상품정보</button></td>
					</c:if>
					<c:if test="${vo.status eq 1}">
						<td>구매 완료</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">

 	$("#productTake").click(function() {	
		var num = $(this).attr("title");
		alert(num);
		location.href="./buyer_page?sell_num="+num;
		
	}); 
		
</script>


</body>
</html>