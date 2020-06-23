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
						<td><button class="btn btn-primary" id="productTake" title="${vo.sell_num}">상품 인수완료</button></td>
						<td><button class="btn btn-danger" id="productCancel">상품 결제 취소</button></td>
					</c:if>
					<c:if test="${vo.status eq 1}">
						<td>구매 완료</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script type="text/javascript">
	$("#productCancel").click(function(){
		var check = confirm("상품 주문을 취소하시겠습니까?");
		if(check){
			location.href="./productCancel";
		}
	})	
	$("#productTake").click(function() {
		var check = confirm("상품 인수완료를 하시겠습니까?");
		var num = $("#productTake").attr("title");
		if(check){
			location.href="./productTake?sell_num="+num;
		}
	}); 
		
</script>

</body>
</html>