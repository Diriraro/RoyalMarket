<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/boot.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<h1>phone</h1>
	<form:form modelAttribute="memberVO" action="./findMemberByEmail"
		method="post">

		<div class="form-group">
			<label class="control-label col-sm-2" for="mem_id">ID:</label>
			<div class="col-sm-10">
				<form:input path="mem_id" type="text" class="form-control"
					id="mem_id" placeholder="Enter id" />
				<form:errors path="mem_id"></form:errors>
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
		<input type="button" value="인증번호 요청" class="btn btn-default" id="btn"
			onclick="checkEmail()">

		<div id="divCheck">
			<label class="control-label col-sm-2" for="phoneCheck">인증번호:</label>
			<div class="col-sm-10">
				<form:input path="phoneCheck" type="text" class="form-control"
					id="phoneCheck" placeholder="인증번호" />
				<div id="ViewTimer"></div>
				<form:errors path="phoneCheck"></form:errors>
			</div>
		</div>

		<div class="form-group pw">
			<label class="control-label col-sm-2" for="mem_pw">Password:</label>
			<div class="col-sm-10">
				<form:input path="mem_pw" type="password" class="form-control"
					id="mem_pw" placeholder="Enter password" />
				<form:errors path="mem_pw"></form:errors>
			</div>
		</div>
		<div class="form-group pw">
			<label class="control-label col-sm-2" for="pwCheck">Password
				Check:</label>
			<div class="col-sm-10">
				<form:input path="pwCheck" type="password" class="form-control"
					id="pwCheck" placeholder="Check password" />
				<form:errors path="pwCheck"></form:errors>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">Submit</button>
			</div>
		</div>
	</form:form>

	<script type="text/javascript">
		function checkEmail() {
			var email = $('#mem_email').val();
			var id = $('#mem_id').val();
			$(".pw").css("display", "block")

			$.post("./check/sendEmail", {
				id : id,
				email : email,
			}, function(result) {
				alert(result.trim())
			})
		}
	</script>

</body>
</html>