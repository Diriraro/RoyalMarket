<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"></c:import>
</head>
<body>
</head>
<body>
	<c:import url="./template/nav.jsp"></c:import>


	<div class="container">
		<h1>Index PAGe</h1>
		
		<a href="./product/productNew"><button>판매하기</button></a>

		<ul class="allKind">
			<li><input type="button" class="kind" id="category0" value="패션잡화"></li>
			<li><input type="button" class="kind" value="여성의류"></li>
			<li><input type="button" class="kind" value="남성의류"></li>
			<li><input type="button" class="kind" value="디지털/가전"></li>
			<li><input type="button" class="kind" value="생활/문구/가구/식품"></li>
			<li><input type="button" class="kind" value="유아동/출산"></li>
			<li><input type="button" class="kind" id="category6" value="스타굿즈"></li>
			<li><input type="button" class="kind" value="스포츠/레저"></li>
			<li><input type="button" class="kind" value="뷰티/미용"></li>
		</ul>

		<a href="${pageContext.request.contextPath}/shop/rei"><span class="glyphicon glyphicon-user"></span> 지울것</a>

	</div>

	<script type="text/javascript">
		$("#category0").click(
				function() {
					location.href = "/product/productList?kind=sk&search=패션잡화";
				});
		$("#category6").click(
				function() {
					location.href = "/product/productList?kind=sk&search=스타굿즈";
				});
	</script>


</body>
</html>