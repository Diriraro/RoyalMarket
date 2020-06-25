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
<style type="text/css">
.pw {
	/* display: none; */
}
</style>
</head>
<body>
<div class="container">
	<h1>phone</h1>
	<form:form modelAttribute="memberVO" action="./findMemberByPhone"
		method="post">
		<input name="mem_name" value="name" type="hidden">
		<input name="road_address" value="road_address" type="hidden">
		<input name="mem_email" value="email@email.com" type="hidden">

		<div class="form-group">
			<label class="control-label col-sm-2" for="mem_id">ID:</label>
			<div class="col-sm-10">
				<form:input path="mem_id" type="text" class="form-control"
					id="mem_id" placeholder="Enter id" />
				<form:errors path="mem_id"></form:errors>
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
		<input type="button" value="인증번호 요청" class="btn btn-default" id="btn"
			onclick="checkPhone()">

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
				<button type="submit" class="btn btn-default" id="frm">Submit</button>
			</div>
		</div>
	</form:form>
	</div>

	<script type="text/javascript">

	function checkPhone() {
			var phoneNumber = $('#mem_phone').val();
			var id = $('#mem_id').val();
			$(".pw").css("display", "block")

			$.post("./check/sendSMS", {
				id : id,
				phoneNumber : phoneNumber
			}, function(result) {
				alert(result.trim())
			})
		}

		/* $("#frm").click(function() {
			var mem_id = $("#mem_id").val();
			var mem_phone = $("#mem_phone").val();
			var mem_pw = $("#mem_pw").val();
			var pwCheck = $("#pwCheck").val();
			$.post("./findMemberByPhone", {
				mem_id : mem_id,
				mem_phone : mem_psshone,
				mem_pw : mem_pw,
				pwCheck : pwCheck
			}, function(result) {
				alert(result);
			})
		})
 */
		/* function getText() {
			if($("#mem_phone").val().length>9 && $("#mem_phone").val().length<12){
					$("#btn").prop("disabled","");
				}else{
					$("#btn").prop("disabled","disabled");
					}
		} */
	</script>

</body>
</html>