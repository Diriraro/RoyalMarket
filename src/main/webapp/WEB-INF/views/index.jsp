<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
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
		<h1>Index Page</h1>
	</div>

<button><a href="../shop/myshop">내상점</a></button>

<button><a href="../shop2/myshop2?mem_storeNum=25&mem_storeName=cotest"> cotest상점</a></button>

<button><a href="../shop2/myshop2?mem_storeNum=27&mem_storeName=yhlim12">yhlim12 상점 </a></button>
</body>
</html>