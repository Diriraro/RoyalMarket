<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test님의 코인 충전</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
.wrap1{
	width: 100%;
	
}

</style>
</head>
<body>
	<div style="width: 100%; height:50px ;background-color: #5c2392;"class="wrap1" >
		<div style="color:white; font-size: x-large; text-align: center; line-height:50px;"><b style="margin-top: 100px;">포인트 충전하기</b></div>
	</div>
	
	<div class="container">
		<div style="border: 1px solid black; display: block; height:50px; border-radius: 4px; margin-top:30px;">
			<div style="display: inline-block; float: left; margin-top: 4px; margin-left: 3px;"><h4><b>현재 ${member.mem_id}님의 보유 포인트</b></h4></div>
			<div style="display: inline-block; float: right; margin-top: 4px; margin-right: 3px; "> <h4><b> ${point}원 </b></h4></div>
		</div>
		
		<h3>충전 선택</h3>
		<div style="width: 100%; height: 50px;">
			<div style="float: left; height: 30px; width: 80px; border-radius:4px; background-color: #00e6e6; text-align: center; line-height: 30px; ">카카오페이</div>
		</div>
		
		<form action="/payment/pay" method="get">
			<div style=" height: 20px; width: 70px; margin-top: 35px; float: left;"><b>충전 금액</b> </div>
			<div><input type="text" id="amount" name="amount" style="height:40px; border-radius: 4px; margin-top:30px;"></div>
			<hr>
			<div>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
			<div><button type="submit" style="background-color: #5c2392; height: 30px; color: white; float: left">충전하기</button></div>
		</form>

	</div>
	
</body>
</html>