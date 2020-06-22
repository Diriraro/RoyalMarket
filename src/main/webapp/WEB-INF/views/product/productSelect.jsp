<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>
	
<h3>Title : ${vo.sell_product}</h3>
<h3>Writer : ${vo.sell_price}</h3>
<h3>contents : ${memberVO.mem_addres}</h3>
	
</body>
</html>