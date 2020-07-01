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
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<div class="container">
		<font style="font-size: x-large;"><b>주문 완료</b></font>
		<hr style="border: solid 1px gray">
		<div style="width: 100%; height: 300px;">
			<div class="container">	
				<div style="display: inline-block;"><img alt="" src="${pageContext.request.contextPath}/resources/images/pay_complete.png" style="width: 200px;height: 250px;"></div>
				<div style="display: inline-block; margin-left: 40px; margin-top: 50px; border-bottom: 1px solid black; width: 850px;"><h1> ${member.mem_id}님 주문이 성공적으로 완료 되었습니다.</h1>
					<button class="btn btn-primary" id="buy_History" style="margin-top: 20px; margin-bottom: 20px;">나의 구매내역 가기</button>
					<button class="btn btn-primary" id="home" style="margin-top: 20px; margin-bottom: 20px;">홈으로 가기</button>
				</div>	
			</div>
		</div>
		<div style="width:100%; height:100px; ">
			<div style="display: inline-block;"><h2>주문 상품 내역</h2></div>
			<div>
				<table class="table table-bordered">
					<tr style="background-color:#f0e6ff; font-size: large;text-align: center;">
						<td><b>상품 구분</b></td>
						<td><b>상품명</b></td>
						<td><b>가격</b></td>
					</tr>
					<tr style="font-size: medium; text-align: center;">
						<td><b>${productVO.sell_kind}</b></td>
						<td><b>${productVO.sell_product}</b></td>
						<td><font style="color: red"><b>${tradingVO.sell_price}</b></font></td>
					</tr>
				</table>
			</div>
		</div>
	
	</div>

<script type="text/javascript">

	$("#buy_History").click(function() {
		location.href="./buy_History";
		
	}); 

	$("#home").click(function() {
		location.href="../";
		
	}); 

 
		
</script>
</body>
</html>