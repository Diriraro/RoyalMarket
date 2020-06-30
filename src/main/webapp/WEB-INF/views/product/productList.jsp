<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link href="./css/test.css" rel="stylesheet" type="text/css">
</head>
<body> 
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	
	<div style="height: 88px; background-color: #fafafd;">
		<div style="width: 300px; height: 300px;">
			<img style="width: 20px;height: 20px;float: left;margin-top: 30px;" alt="홈이미지" src="${pageContext.request.contextPath}/resources/images/home_logo.png">
			<font style="float: left;color: #4d555e;margin-top: 31px;">&nbsp;홈&nbsp;&nbsp;</font>
			<img style="width: 16px;height: 15px;float: left;margin-top: 33px;" alt="방향이미지" src="${pageContext.request.contextPath}/resources/images/arrow_logo2.png">
			<div style="float: left;margin-top: 24px;" class="dropdown">
				<button id="d" style="width: 164px; color: #4d555e" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">

					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a id="c1" href="${pageContext.request.contextPath}/product/productList?kind=sk&search=패션잡화">패션잡화</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=여성의류">여성의류</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=남성의류">남성의류</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=디지털/가전">디지털/가전</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=생활/문구/가구/식품">생활/문구/가구/식품</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=유아동/출산">유아동/출산</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=스타굿즈">스타굿즈</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=스포츠/레저">스포츠/레저</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=뷰티/미용">뷰티/미용</a></li>
				</ul>
			</div>



		</div>
		</div>

	<div class="container">

		<div class="row">
			<h1>productList</h1>
			<form action="./productList" class="form-inline">
				<div class="input-group input-group-sm col-xs-2">
					<select class="form-control" id="sel1" name="kind">
						<option value="sp">product</option>
						<option value="sk">kind</option>
						<option value="st">tag</option>
					</select>
				</div>
				<div class="input-group input-group-sm col-xs-4">

					<input type="text" class="form-control" placeholder="Search"
						name="search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>



		<br>


		<table class="table table-hover">

			<c:forEach items="${list}" var="vo" varStatus="i">
				<div class="col-sm-4" style="display: inline-block;">
					<div class="panel panel-info" style="height:100px; width:80px; cursor: pointer;"
						onclick="location.href='./productSelect?sell_num=${vo.sell_num}'">
						
						
						<img style="height:100px; width:80px; cursor: pointer;" alt="" src="${pageContext.request.contextPath}/upload/product/${file[i.index]}">
						<tr>
							<td>${vo.sell_num}</td>
							<td>${vo.sell_product}</td>
							<td>${vo.sell_price}</td>
						</tr>





					</div>
				</div>
			</c:forEach>


		</table>

	</div>


	<div>
		<ul class="pagination">
			<c:if test="${pager.curBlock gt 1}">
				<li><a
					href="./${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a
					href="./${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock}">
				<li><a
					href="./${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
			</c:if>
		</ul>
	</div>

<script type="text/javascript">

$("#c1").click(function(){
	$( "#d" ).append( "<font>패션잡화</font>" );

});

</script>


</body>
</html>