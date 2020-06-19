<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		<h1>member join</h1>
		<form:form modelAttribute="memberVO" action="./memberJoin"
			method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">ID:</label>
				<div class="col-sm-10">
					<form:input path="mem_id" type="text" class="form-control" id="mem_id"
						placeholder="Enter id" />
					<form:errors path="mem_id"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_pw">Password:</label>
				<div class="col-sm-10">
					<form:input path="mem_pw" type="password" class="form-control"
						id="mem_pw" placeholder="Enter password" />
					<form:errors path="mem_pw"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwCheck">Password Check:</label>
				<div class="col-sm-10">
					<form:input path="pwCheck" type="password" class="form-control"
						id="pwCheck" placeholder="Check password" />
					<form:errors path="pwCheck"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_name">name:</label>
				<div class="col-sm-10">
					<form:input path="mem_name" type="text" class="form-control" id="mem_name"
						placeholder="Enter name" />
					<form:errors path="mem_name"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_phone">Phone:</label>
				<div class="col-sm-10">
					<form:input path="mem_phone" type="text" class="form-control" id="mem_phone"
						placeholder="Enter Phone" />
					<form:errors path="mem_phone"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_address">Adress:</label>
				<div class="col-sm-10">
					<form:input path="mem_address" type="text" class="form-control" id="mem_address"
						placeholder="Enter Address" />
					<form:errors path="mem_address"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_email">Email:</label>
				<div class="col-sm-10">
					<form:input path="mem_email" type="text" class="form-control"
						id="mem_email" placeholder="Enter Email" />
					<form:errors path="mem_email"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form:form>
		<a href="./check/sendSMS?phoneNumber=01046265193">인증번호 전송</a>
	</div>
</body>
</html>