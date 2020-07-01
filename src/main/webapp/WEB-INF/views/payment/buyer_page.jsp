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
		<button class="btn btn-primary" id="productTake" title="${sell_num}">상품 인수완료</button>
		<button class="btn btn-danger" id="productCancel" title="${sell_num}">상품 거래 취소</button>
	</div>

	<script type="text/javascript">
	$("#productCancel").click(function(){
		var check = confirm("상품 주문을 취소하시겠습니까?");
		var num = $("#productCancel").attr("title");
		if(check){
			location.href="./productCancel?sell_num="+num+"&check=buy";
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