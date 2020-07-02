<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<div class="container"> 
		<h2><b>주문 상세정보</b></h2>
		<div style="width: 100%; height: 100px; border: 4px solid #cccccc;">
			<div style="display: inline-block; margin-top: 10px;margin-left: 20px;"><b style="font-size: large;">주문자</b> <font style="font-size: large;">: ${memberVO.mem_id}</font></div>
			<div style="display: inline-block; margin-left: 100px;"><b style="font-size: large;">주문 일자</b> <font style="font-size: large;">: ${buy_date}</font></div>
			<div style="display: inline-block; margin-left: 100px;"><b style="font-size: large;">주문 번호</b> <font style="font-size: large;">: ${productVO.sell_num }</font></div>
			<div style="display: inline-block; margin-left: 100px;"><b style="font-size: large;">구매자 전화번호</b> <font style="font-size: large;">: ${memberVO.mem_phone}</font></div>
			<div style="display: inline-block; margin-top: 10px;margin-left: 20px;"><b style="font-size: large;">구매자 주소</b> <font style="font-size: large;">: ${memberVO.mem_address }</font></div>
		</div>
		<table style="width: 100%; margin-top: 20px;">
			<tr style="text-align: center; height: 50px; border-top: 3px solid black; border-bottom: 2px solid #cccccc">
				<td>상품 번호</td>
				<td></td>
				<td>상품 정보</td>
				<td>상품 금액</td>
				<td style="border-right: 1px solid #cccccc;background: #F7F7F7">배송비 / 판매자</td>
				<td colspan="2" style="text-align: center; background: #F7F7F7">진행 상태</td>
			</tr>
			<tr style="height: 200px; text-align: center; border-bottom: 2px solid #cccccc;">
				<td>${productVO.sell_num }</td>
				<td><img alt="images" src="${pageContext.request.contextPath}/upload/product/${image}" style="width: 200px; height: 200px;"></td>
				<td>${productVO.sell_product }</td>
				<td>${productVO.sell_price} 원</td>
				<td style="border-right: 1px solid #cccccc; background:#F7F7F7; ">2500 원</td>
				<td style="width: 100px; border-right: 1px solid #cccccc; background: #F7F7F7;">
					<c:if test="${status eq 0}"> 인계 대기중</c:if>
					<c:if test="${status eq 1}"> 인수 완료</c:if>
					<c:if test="${status eq 2}"> 판매 완료</c:if>
					<c:if test="${status eq 3}"> 취소 완료</c:if>
					<c:if test="${status eq 4}"> 구매자가 취소 요청을 하였습니다. </c:if>
					
				</td>
					<c:if test="${status eq 0}">
						<td style="width: 100px;background: #F7F7F7">
							<button class="btn btn-primary" id="productGive" title="${sell_num}" style=" width:115px; margin-bottom: 10px;  margin-left: 10px; margin-right: 10px;">상품 인계완료</button>
							<button class="btn btn-danger" id="productCancel" title="${sell_num}" style=" width:115px; margin-left: 10px; margin-right: 10px;">상품 거래 취소</button> 
						</td>
					</c:if>
					<c:if test="${status eq 1}"><td></td></c:if>
					<c:if test="${status eq 2}"><td></td></c:if>
					<c:if test="${status eq 3}"><td></td></c:if>
					<c:if test="${status eq 4}">
						<td style="width: 100px;background: #F7F7F7">
							<button class="btn btn-danger" id="productCancel" title="${sell_num}" style=" width:115px; margin-left: 10px; margin-right: 10px;">상품 거래 취소</button> 
						</td>
					</c:if>
					
			</tr>
		</table>
		

	</div>

<script type="text/javascript">
	$("#productCancel").click(function(){
		var check = confirm("상품 주문을 취소하시겠습니까?");
		var num = $("#productCancel").attr("title");
		if(check){
			location.href="./productCancel?sell_num="+num+"&check=sell";
		}
	});	
	
	$("#productGive").click(function() {
		var check = confirm("상품 인계완료를 하시겠습니까?");
		var num = $("#productGive").attr("title");
		if(check){
		location.href="./productGive?sell_num="+num;
		
		}
	});
</script>

<c:import url="../template/footer.jsp"></c:import>
</body>
</html>