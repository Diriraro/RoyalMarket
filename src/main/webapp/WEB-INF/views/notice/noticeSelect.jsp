<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<c:import url="../template/nav.jsp"></c:import>

<div class="container">
	<table class="table table-hover">
		<tr>
			<td>제목</td>
			<td>날짜</td>
			<td>내용</td>
		</tr>
		
		<tr>
			<td>${no_select.no_title}</td>
			<td>${no_select.no_regDate}</td>
			<td>${no_select.no_contents}</td>
		</tr>
	</table>
	<a href="./noticeUpdate?no_num=${no_select.no_num}">
		<button class="btn btn-success">수정하기</button>
	</a>
	
	
</div>

</body>
</html>