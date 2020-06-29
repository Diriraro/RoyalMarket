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
	<!-- 구매자용 페이지? -->
	<h1>결제완료</h1>
	
	<div class="container">
		<h3>상품가격 : ${tradingVO.sell_price}</h3>
		<h3>구매자 아이디 : ${tradingVO.buyer_id}</h3>
		
		<button class="btn btn-primary" id="buy_History">구매내역</button>
	</div>

<script type="text/javascript">
	$("#productCancel").click(function(){
		var check = confirm("상품 주문을 취소하시겠습니까?");
		if(check){
			location.href="./productCancel";
		}
	})	
	$("#buy_History").click(function() {
		location.href="./buy_History";
		
	}); 
		
</script>
</body>
</html>