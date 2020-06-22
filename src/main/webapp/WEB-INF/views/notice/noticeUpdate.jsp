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
		<form action="noticeUpdate" method="post" enctype="multipart/form-data">
		<input type="hidden" id="no_num" name="no_num" value="${no_select.no_num}">
		<input type="hidden" id="no_regDate" name="no_regDate" value="${no_select.no_regDate}">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="no_title" name="no_title" value="${no_select.no_title}">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea rows="" cols="" class="form-control" id="summernote"
					name="no_contents">${no_select.no_contents}</textarea>
			</div>
	
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>


</body>
</html>