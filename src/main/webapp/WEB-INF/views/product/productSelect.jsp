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
<h3>price : ${vo.sell_price}</h3>
<h3>info : ${vo.sell_info}</h3>
<h3>hit : ${vo.sell_hit}</h3>
<h3>date : ${vo.sell_date}</h3>
<h3>address : ${mvo.mem_address}</h3>

</body>
</html>