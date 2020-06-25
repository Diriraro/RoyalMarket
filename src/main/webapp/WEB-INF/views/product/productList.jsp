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
<style type="text/css">

	 .img{
        position: relative;
        background-image: url('${pageContext.request.contextPath}/resources/qna_images/${file[i.index]}');                                                               
        height: 100px;
        width: 80px;
        background-size: cover;
    }

    .img-cover{
       position: absolute;
       height: 100%;
       width: 100%;
       background-color: rgba(0, 0, 0, 0.7);                                                                 
       z-index:1;
    }

    .img .content{
         position: absolute;
         top:50%;
         left:50%;
         transform: translate(-50%, -50%);                                                                   
         font-size:1rem;
         color: white;
         z-index: 2;
         text-align: center;
    }
	
</style>
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
						onclick="location.href='./productSelect?sell_num=${vo.sell_num}'">
						
						
				<%-- 		<img style="height:100px; width:80px; cursor: pointer;" alt="" src="${pageContext.request.contextPath}/upload/product/${file[i.index]}">
						<tr>
							<td>${vo.sell_num}</td>
							<td>${vo.sell_product}</td>
							<td>${vo.sell_price}</td>
						</tr>
 --%>
 				<tr>
 				<c:if test="${vo.sell_status eq 1}">
	 				<td><div class="img" style="background-image: url('${pageContext.request.contextPath}/upload/product/${file[i.index]}')">
					<div class="content">
						<h5 style="margin-bottom: 30px;">예약완료</h5>
					</div>
					<div class="img-cover"></div></td>
				</c:if>
				<c:if test="${vo.sell_status eq 0 }">
				<td><div class="img" style="cursor:pointer; background-image: url('${pageContext.request.contextPath}/upload/product/${file[i.index]}')" onclick="location.href='./productSelect?sell_num=${vo.sell_num}'"></td>
				
				</c:if>
				
				<td>${vo.sell_num}</td>
				<td>${vo.sell_product}</td>
				<td>${vo.sell_price}</td>
				</tr>
			</div>




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