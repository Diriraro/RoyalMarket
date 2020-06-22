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
<style type="text/css">
.wmnsE {
    width: 570px;
    box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;
    background: rgb(255, 255, 255);
    padding: 60px;
}
.kHXIxY {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    padding: 100px 0px;
}
</style>
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
			<a href="#" id="btnCheck" class="btn btn-default">인증번호 요청</a>
			<div id="divCheck" style="display: none;">
				<label class="control-label col-sm-2" for="check_num">인증번호:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="check_num"
						placeholder="인증번호" name="check_num" />
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
	</div>
	<a href="./check/sendSMS?phoneNumber=01033943097" id="btnCheck" class="btn btn-default">인증번호 요청</a>
<script type="text/javascript">
	$("#btnCheck").click(function(){
		var phoneNumber = $('#mem_phone').val();
		
		$("#divCheck").css("display","block");
		 $.ajax({
             type: "GET",
             url: "/member/check/sendSMS",
             data: {
                 "phoneNumber" : phoneNumber
             }
		 })
         
		});
	
</script>


</body>
</html>