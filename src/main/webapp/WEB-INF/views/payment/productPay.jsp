<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<font style="font-size: x-large;"><b>로고</b></font>
		<hr style="border: solid 1px gray">
		<br><br><br><br>
		
		<div style="border: 1px solid white">
			<font style="font-size: x-large;"><b>상품 정보</b></font>
			<hr style="border: solid 1px gray">
			<div style="width: 400px; height: 500px; border: solid 1px black; display: inline-block; float: right;">
			
				<div style="margin-top: 10px;">
					<font style="color: red; font-size: large; margin-left: 10px; float: left"><b>총 상품 금액</b></font>
					<font style="color: red; font-size: large; margin-right: 10px; float: right;"><b>${sell_price}  원</b></font>
					<br><br><br>
				</div>
				<div style="margin-top:40px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>배송비</b></font>
					<font style="color: red; font-size: large; margin-right: 10px; float: right;"><b>2500  원</b></font> 	
				</div>
				<hr style="border: solid 1px gray">
				
				<div style="margin-top:40px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>특별 할인 5%</b></font>
					<font style="color: blue; font-size: large; margin-right: 10px; float: right;"><b><fmt:parseNumber var="test" value="${sell_price*0.05 }" integerOnly="true"/>${test}  원</b></font> 	
				</div>
				<hr style="border: solid 1px gray">
				
				<div style="margin-top:40px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>보유하신 포인트</b></font>
					<font style="color: blue; font-size: large; margin-right: 10px; float: right;"><b>${point}  원</b></font> 	
				</div>
				<hr style="border: solid 1px gray">
				
				<div style="margin-top:20px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>결제 예정 포인트</b></font>
					<font style="color: red; font-size: large; margin-right: 10px; float: right;"><b>${sell_price-test+2500}  원</b></font> 	
				</div>
				
				<c:if test="${point lt sell_price-test+2500}">
					<div style="margin-top:20px; height: 20px;">
						<font style="color: red; font-size: large; margin-left: 10px; float: left;"><b>포인트가 부족합니다!!</b></font> 	
					</div>
					<div style="margin-top: 10px;">
						<button class="btn btn-danger" id="pointCharge" style="float: right; margin-right: 10px; margin-top: 5px;">포인트 충전하기</button>
					</div>
				</c:if>
					<c:if test="${point gt sell_price-test+2500}">
					<div style="margin-top:20px; height: 20px;">
						<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>결제 후 잔여 포인트</b></font>
						<font style="color: blue; font-size: large; margin-right: 10px; float: right;"><b>${point-(sell_price-test+2500)}  원</b></font> 	
					</div>
					<div style="margin-top: 10px;">
						<button class="btn btn-primary" id="productPay" style="float: right; margin-right: 10px; margin-top: 5px;">상품 결제하기</button>
					</div>
				</c:if>
				
	
			</div>
			<div style="width: 730px; height: 500px; border: solid 1px black; display: inline-block; float: left;">
				<table class="table table-bordered" style="margin-top: 10px;">
					<tr>
						<td>상풍 정보</td>
						<td>상품 금액</td>
						<td>적립 예정</td>
						<td>배송비</td>
					</tr>
					<tr>
						<td>
							<div><img alt="images" src="${pageContext.request.contextPath}/upload/product/${image}"></div>					
							${sell_product}</td>
						<td>${sell_price}</td>
						<td> test</td>
						<td>2500</td>
					</tr>
				</table>
			</div>
		</div>
	
		


<script type="text/javascript">
	$("#pointCharge").click(function(){
		location.href="javascript:popup()";
	})	
	$("#productPay").click(function() {
		var check = confirm("상품을 결제 하시겠습니까?");
		if(check){
			location.href="./productTrading?sell_num=${sell_num}&sell_price=${sell_price}";
		}
	});

	function popup(){
	    var url = "payment/pointCharge";
	    var name = "포인트 충전";
	    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	    window.open(url, name, option);
	}
		
</script>
</body>
</html>