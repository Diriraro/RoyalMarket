<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<form action="memberLogin" method="post">
	  <div class="form-group">
	    <label for="email">Id:</label>
	    <input type="text" class="form-control" id="mem_id" name="mem_id">
	  </div>
	  <div class="form-group">
	    <label for="pwd">Password:</label>
	    <input type="password" class="form-control" id="mem_pw" name="mem_pw">
	  </div>
	  
	  <button type="submit" class="btn btn-default">Submit</button>
	</form>

</div>
	
</body>
</html>