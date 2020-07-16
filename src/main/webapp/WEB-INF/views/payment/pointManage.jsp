<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<c:if test="${vo.pay_out eq 1}">
						<td>상품 구매</td>	
					</c:if>
					<c:if test="${vo.pay_in eq 1}">
						<td>+${vo.pay_price}</td>
					</c:if>
					<c:if test="${vo.pay_out eq 1}">
						<td>-${vo.pay_price}</td>
					</c:if>
					
					<td>${vo.point_rest}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
			<div class="p" style="width: 1024px;height: 40px;float: left;">
				<ul class="pagination" >

					<c:if test="${pager.curBlock gt 1}">
						<li><a
							href="./productList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li><a
							href="./productList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<li><a
							href="./productList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
					</c:if>
				</ul>
			</div>
	
	<div>
		<a href="javascript:popup_cal()">정산하기 </a>
	</div>
	
	<script type="text/javascript">
	
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