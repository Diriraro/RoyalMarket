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
		
		<c:forEach items="${no_list}" var="list">
			<tr>
				<td><a href="./noticeSelect?no_num=${list.no_num}">${list.no_title}</a></td>
				<td>${list.no_regDate}</td>
				<td>${list.no_contents}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="./noticeWrite">
	<input type="button" value="공지 작성" class="btn btn-primary">
	</a>
	
</div>

</body>
</html>