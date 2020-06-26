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
	<h1>Find ID By E-mail</h1>
	<form:form modelAttribute="memberVO" action="./findIdByEmail"
		method="post">
		<input name="mem_name" value="name" type="hidden">
		<input name="road_address" value="road_address" type="hidden">

		<div class="form-group">
			<label class="control-label col-sm-2" for="mem_name">name:</label>
			<div class="col-sm-10">
				<form:input path="mem_name" type="text" class="form-control"
					id="mem_name" placeholder="Enter name" />
				<form:errors path="mem_name"></form:errors>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="mem_phone">Phone:</label>
			<div class="col-sm-10">
				<form:input path="mem_phone" type="text" class="form-control"
					id="mem_phone" placeholder="휴대폰 번호(숫자만 허용)" />
				<form:errors path="mem_phone"></form:errors>
			</div>
		</div>

		<input type="button" value="휴대폰으로 아이디 찾기" class="btn btn-default"
			id="btn" onclick="checkPhone()">

		<input type="button" value="닫기" class="btn btn-default" onclick="setParentText()">

	</form:form>

	<script type="text/javascript">
		function checkPhone() {
			var phoneNumber = $('#mem_phone').val();
			var name = $('#mem_name').val();
			$.post("./check/findIdByPhone", {
				name : name,
				phoneNumber : phoneNumber,
			}, function(result) {
				alert(result.trim())
			})
		}
		
		 function setParentText(){
  
             window.close();
        }
	</script>
</body>
</html>