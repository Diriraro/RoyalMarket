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
		<form action="noticeWrite" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="no_title" name="no_title">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea rows="" cols="" class="form-control" id="summernote"
					name="no_contents"></textarea>
			</div>
	
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>


</body>
</html>