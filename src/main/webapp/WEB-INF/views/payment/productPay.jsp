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
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<c:import url="../template/style.jsp"></c:import>

	<div class="container">
		<br><br><br>
		<font style="font-size: x-large;"><b>주문</b></font>
		<hr style="border: solid 1px #5c2392;">
		<br><br><br><br>
		
		<div style="border: 1px solid white">
			<font style="font-size: x-large;"><b>상품 정보</b></font>
			<hr style="border: solid 1px #5c2392;">
			<div style="width: 385px; height: 500px; border: 2px solid #5c2392; background-color display: inline-block; float: right;">
			
				<div style="margin-top: 10px;">
					<font style="color: red; font-size: large; margin-left: 10px; float: left"><b>총 상품 금액</b></font>
					<font style="color: red; font-size: large; margin-right: 10px; float: right;"><b>${sell_price}  원</b></font>
					<br><br><br>
				</div>
				<div style="margin-top:40px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>배송비</b></font>
					<font style="color: red; font-size: large; margin-right: 10px; float: right;"><b>2500  원</b></font> 	
				</div>
				<hr style="border: solid 1px #e4e4e4;">
				
				<div style="margin-top:40px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>특별 할인 5%</b></font>
					<font style="color: blue; font-size: large; margin-right: 10px; float: right;"><b><fmt:parseNumber var="test" value="${sell_price*0.05 }" integerOnly="true"/>${test}  원</b></font> 	
				</div>
				<hr style="border: solid 1px #e4e4e4;">
				
				<div style="margin-top:40px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>보유하신 포인트</b></font>
					<font style="color: blue; font-size: large; margin-right: 10px; float: right;"><b>${point}  원</b></font> 	
				</div>
				<hr style="border: solid 1px #e4e4e4;">
				
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
			<div style="width: 715px; height: 500px; margin-right:15px; display: inline-block; float: left;">
				<table class="table" style="margin-top: 10px;">
					<tr style="border-top: 2px solid black; border-bottom:2px solid black; text-align: center; background-color:#c2d6d6; ">
						<td>상풍 정보</td>
						<td>상품 금액</td>
						<td style="width: 15%">적립 예정</td>
						<td style="width: 10%;">배송비</td>
					</tr>
					<tr style="height: 250px; text-align: center; font-size: 25px; border-bottom: 1px solid #e4e4e4;">
						<td style="text-align: left; border-right: 1px solid #e4e4e4;">
							<div style="display: inline-block;"><img alt="images" src="${pageContext.request.contextPath}/upload/product/${image}" style="width: 200px; height: 200px;"></div>					
							<div style="display: inline-block;">&nbsp&nbsp&nbsp${sell_product}</div>
							</td>
						<td style="vertical-align: middle; border-right: 1px solid #e4e4e4;">${sell_price}</td>
						<td style="vertical-align: middle; border-right: 1px solid #e4e4e4; color: red"><b>test</b></td>
						<td style="vertical-align: middle ;">2500</td>
					</tr>
				</table>
			</div>
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
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>