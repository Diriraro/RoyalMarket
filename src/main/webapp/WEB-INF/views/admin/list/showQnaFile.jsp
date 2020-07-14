<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부파일 확인</title>
</head>
<body>
	<c:forEach items="${qfvo}" var="vo">
		<img src="/upload/qna/${vo.file_name}"
			style="width: 700px; height: 448px;">
		<br>
	</c:forEach>
</body>
</html>