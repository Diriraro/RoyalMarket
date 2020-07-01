<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.buttons{ 
	border: 1px solid white; 
	background-color: rgba(0,0,0,0);  
	padding: 5px; 
	display: inline-block;
	width: 300px;
	margin-top: 50px;
}

</style>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	
	<div class="container">
		<div style="text-align: center;"><h2><b>거래내역</b></h2></div>
		<div>
			<button type="button" data-index="0" class="buttons" style="margin-left: 257px; border-bottom: 2px solid red;" id="buy_his"><b style="color: red">구매 내역</b></button>
			<button type="button" data-index="0" class="buttons" id="sell_his">판매 내역</button>
		</div>
		<c:forEach items="${buy}" var="vo">
			<div style=" margin-top: 10px; margin-left: 257px;">
				<div style="height: 100px;float: left;"><img alt="images" src="${pageContext.request.contextPath}/upload/product/${vo.file_name}" style="width: 100px;height: 100px;"></div>
				<div style="height: 100px; display: inline-block; margin-left: 10px;">
					<div style="display: inline-block;"><font style="font-size: large;"><a href="./buyer_page?sell_num=${vo.sell_num}">${vo.sell_product}</a></font></div><br>
					<div style="display: inline-block;"><font style="font-size: large;"><b>${vo.sell_price} 원</b></font></div><br>
					<div style="display: inline-block;">${vo.seller_id}</div><br>
					<div style="display: inline-block;">${vo.buy_date}</div><br>
					<c:if test="${vo.status eq 0}">
						<div style="display: inline-block;">구매 대기중</div>
					</c:if>
					<c:if test="${vo.status eq 1}">
						<div style="display: inline-block;">인수 완료</div>
					</c:if>
					<c:if test="${vo.status eq 2}">
						<div style="display: inline-block;">구매 완료</div>
					</c:if>
					<c:if test="${vo.status eq 3}">
						<div style="display: inline-block;">취소된 거래입니다.</div>
						<button class="btn btn-primary buyDelete" id="buyDelete"  title="${vo.sell_num}" style="background-color: white; border: white;"><font style="color: red;">삭제하기</font></button>
					</c:if>		
				</div>
			</div>
		</c:forEach>
	
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
	
	$("#buy_his").click(function() {	
		location.href="./buy_History";
		
	}); 
	$("#sell_his").click(function() {	
		location.href="./sell_History";
		
	}); 
		
</script>
	<c:import url="../template/footer.jsp"></c:import>

</body>
</html>