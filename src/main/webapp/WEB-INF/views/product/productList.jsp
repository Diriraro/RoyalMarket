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
	<c:import url="../template/nav.jsp"></c:import>

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
						onclick="location.href='./productListSelect?sell_num=${vo.sell_num}'">
						
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



</body>
</html>