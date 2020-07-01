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
		<h1>kakao member join</h1>
		<%-- <div>${profile}</div>
		<img alt="profile" src="${profile}"> --%>
		<form:form modelAttribute="memberVO" action="./kakaoMemberJoin"
			method="post">
			
		<input type="hidden" name="mem_id" value="id">
		<input type="hidden" name="mem_name" value="name">
		<input type="hidden" name="mem_pw" value="kakaoPw">
		<input type="hidden" name="mem_email" value="email@email">
		
			<div class="form-group">
				<label class="control-label col-sm-2" for="mem_phone">Phone:</label>
				<div class="col-sm-10">
					<form:input path="mem_phone" type="text" class="form-control"
						id="mem_phone" placeholder="휴대폰 번호(숫자만 허용)" />
					<form:errors path="mem_phone"></form:errors>
				</div>
			</div>

			<input type="button" value="인증번호 요청" class="btn btn-default"
				id="rq_num" onclick="checkPhone()">
			

			<div id="divCheck">
				<label class="control-label col-sm-2" for="phoneCheck">인증번호:</label>
				<div class="col-sm-10">
					<form:input path="phoneCheck" type="text" class="form-control"
						id="phoneCheck" placeholder="인증번호" />
					
					<form:errors path="phoneCheck"></form:errors>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="road_address">주소:</label>
				<div class="col-sm-10">
					<form:input path="road_address" type="text" class="form-control"
						id="road_address" placeholder="Enter Address" />
					<form:errors path="road_address"></form:errors>
				</div>
			</div>

			<input type="button" value="주소 검색" class="btn btn-default"
				onclick="openChild()">
			<br>

			<div class="form-group" >
				<label class="control-label col-sm-2" for="detail_address">상세
					주소:</label>
				<div class="col-sm-10">
					<form:input path="detail_address" type="text" class="form-control"
						id="detail_address" placeholder="Enter Address" />
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" id="btn_submit">Submit</button>
				</div>
			</div>
		
		</form:form>
	</div>
	 


	<script type="text/javascript">
	
		var check = false;
		
		
		function checkPhone(result2) {
			var phoneNumber = $('#mem_phone').val();

			$.post("./check/sendSMS2", {
				phoneNumber : phoneNumber
			}, function(result) {
				alert(result.trim());
			}) 		
		} 
	
		var openWin;

		function openChild() {
			// window.name = "부모창 이름"; 
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("./findAddress", "childForm",
					"width=570, height=350, resizable = no, scrollbars = no");
		}

	

	</script>


</body>
</html>