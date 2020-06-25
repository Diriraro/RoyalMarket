<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test님의 코인 충전</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<c:import url="../template/nav.jsp"></c:import>
	
<h1> ${memberVO.mem_id}님의 코인 결제</h1>
	<div class="container">
	<h1>${point}코인</h1>
	<form action="/payment/pay" method="get">
		<input type="text" id="amount" name="amount">
		<button type="submit">충전하기</button>
	</form>
	
	</div>
</body>
</html>