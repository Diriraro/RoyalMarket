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

<h1>상품 결제</h1>

	<div class="container">
		<h2> 상품 이름</h2> <br>
		<h2> 상품 가격(Test로 10원) </h2> <br>
		<h2> ${point}</h2> <br>
		
		<c:if test="${point gt 10}">
			<h3>상품결제 완료 페이지 이동</h3>
			<button class="btn btn-primary" id="productPay">상품 결제하기</button>
		</c:if>
		<c:if test="${point lt 10 }">
			<h3>포인트 부족 -> pointCharge로 이동</h3>
			<button class="btn btn-danger" id="pointCharge">포인트 충전하기</button>
		</c:if>
		
	
	</div>

<script type="text/javascript">
	$("#pointCharge").click(function(){
		location.href="./pointCharge";
	})	
	$("#productPay").click(function() {
		var check = confirm("상품을 결제 하시겠습니까?");
		if(check){
			location.href="./productTrading";
		}
	});
		
</script>
</body>
</html>