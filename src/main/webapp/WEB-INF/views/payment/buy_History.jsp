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
				<td>상품명</td>
				<td>상품 가격</td>
				<td>상태</td>
				<td>　</td>
		<%-- 		<c:if test="${buy.status eq 0}">
					<td>결제 취소</td>
				</c:if> --%>
			</tr>
			<c:forEach items="${buy}" var="vo">
				<tr>
					<td>${vo.sell_num}</td>
					<td>${vo.sell_product}</td>
					<td>${vo.sell_price}</td>
					
				
					<c:if test="${vo.status eq 0}">
						<td><button class="btn btn-primary productTake" id="productTake"  title="${vo.sell_num}">상품정보</button></td>
					</c:if>
					<c:if test="${vo.status eq 1}">
						<td>인수 완료</td>
						<td>　</td>
					</c:if>
					<c:if test="${vo.status eq 2}">
						<td>구매 완료</td>
						<td><a href="../shop/rei?sell_num=${vo.sell_num}"> 리뷰남기기</a>　</td>
					</c:if>
					<c:if test="${vo.status eq 3}">
						<td>취소된 거래입니다.</td>
						<td><button class="btn btn-primary buyDelete" id="buyDelete"  title="${vo.sell_num}">삭제하기</button></td>
					</c:if>	
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">

 	$(".productTake").click(function() {	
		var num = $(this).attr("title");
		location.href="./buyer_page?sell_num="+num;
		
	}); 

	$(".buyDelete").click(function() {	
		var num = $(this).attr("title");
		location.href="./buyDelete?sell_num="+num;
		
	}); 
		
</script>


</body>
</html>