<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<form:form modelAttribute="memberVO" action="memberJoin" method="post">
	  <div class="form-group">
	    <label for="email">Id:</label>
	    <form:input path="id" type="text" id="id"/>
	     <form:errors path="id"></form:errors>
	  </div>
	  <div class="form-group">
	    <label for="pw">Password:</label>
	    <form:input path="pw" type="password" id="pw" />
	    <form:errors path="pw"></form:errors>
	  </div>
	    <div class="form-group">
	    <label for="pwCheck">Password:</label>
	    <form:input path="pwCheck" type="password" id="pwCheck" />
	    <form:errors path="pwCheck"></form:errors>
	  </div>
	  
	   <div class="form-group">
	    <label for="age">age:</label>
	    <form:input path="age" type="text" id="age"/>
	    <form:errors path="age"></form:errors>
	  </div>
	  
	    <div class="form-group">
	    <label for="email">Email:</label>
	    <form:input path="email" type="text" id="email"/>
	    <form:errors path="email"></form:errors>
	  </div>
	  
	  
	  <button type="submit" class="btn btn-default">Submit</button>
	</form:form>
</div>
</body>
</html>