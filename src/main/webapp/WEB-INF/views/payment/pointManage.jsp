<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 포인트 현황 - 우주장터</title>
<c:import url="../template/boot.jsp"></c:import>

<c:import url="../template/style.jsp"></c:import>
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
</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<div class="container">
		<div style="text-align: center;"><h2><b>포인트 관리</b></h2></div>
		<div>
			<button type="button" data-index="0" class="buttons" style="margin-left: 257px; border-bottom: 2px solid #5c2392;" id="buy_his"><b style="color: #5c2392">포인트 사용 내역</b></button>
			<button type="button" data-index="0" class="buttons" id="calcul">정산하기</button>
		</div>
		<table class="table table-hover" style="margin-top: 30px;">
			<tr>
				<td>구분</td>
				<td>포인트량</td>
				<td>잔여 포인트</td>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<c:if test="${vo.pay_in eq 1}">
						<td>입금</td>
					</c:if>
					<c:if test="${vo.pay_in eq 2}">
						<td>상품 판매</td>	
					</c:if>
					<c:if test="${vo.pay_in eq 3}">
						<td>구매 취소</td>	
					</c:if>
					<c:if test="${vo.pay_out eq 1}">
						<td>상품 구매</td>	
					</c:if>
					<c:if test="${vo.pay_out eq 2}">
						<td>정산</td>	
					</c:if>
					<c:if test="${vo.pay_in eq 1}">
						<td>+${vo.pay_price}</td>
					</c:if>
					<c:if test="${vo.pay_in eq 2}">
						<td>+${vo.pay_price}</td>
					</c:if>
					<c:if test="${vo.pay_in eq 3}">
						<td>+${vo.pay_price}</td>
					</c:if>
					<c:if test="${vo.pay_out eq 1}">
						<td>-${vo.pay_price}</td>
					</c:if>
					<c:if test="${vo.pay_out eq 2}">
						<td>-${vo.pay_price}</td>
					</c:if>
					
					<td>${vo.point_rest}</td>
				</tr>
			</c:forEach>
		</table>
			<div class="p" style="width: 1024px;height: 40px;float: left;">
				<ul class="pagination" >

					<c:if test="${pager.curBlock gt 1}">
						<li><a
							href="./pointManage?curPage=${pager.startNum-1}">이전</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li><a
							href="./pointManage?curPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<li><a
							href="./pointManage?curPage=${pager.lastNum+1}">다음</a></li>
					</c:if>
				</ul>
			</div>
	</div>
	
	

	
	<script type="text/javascript">

	$("#calcul").click(function(){
		location.href="javascript:popup_cal()";
		
		});
	
		function popup_cal() {
		var url = "../payment/calculate";
		var name = "정산";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
	</script>
	
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>