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
	<h1>관리자 1:1문의 페이지</h1>	
	<table class="table table-hover">
			<tr>
				<td>상담 카테고리</td>
				<td>내용</td>
				<td>문의 날짜</td>
				<td>문의 상황</td>
				<td>문의 답변날짜</td>
			</tr>
			
		<c:forEach items="${qna_list}" var="list">
			<tr>
				<td>${list.qna_kind}</td>
				<td><textarea readonly="readonly" style="margin: 0px; width: 740px; height: 240px;">${list.qna_contents}</textarea> </td>
				<td>${list.qna_regDate}</td>
				<td><c:if test="${list.qna_check eq 0}">답변대기중</c:if>
				<c:if test="${list.qna_check ne 0}">답변완료</c:if></td>
				<td><c:if test="${list.qna_checkDate eq null}">답변대기중</c:if>
				<c:if test="${list.qna_checkDate ne null}">${list.qna_checkDate}</c:if></td>
			</tr>
		</c:forEach>
	</table>
	
	
</div>

</body>
</html>