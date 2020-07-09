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

.logo{
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.container{
	
}




</style>
</head>

<body>


<div class="logo"><img src="../../resources/images/nav_logo2.png"	class="sc-fYiAbW knQFFQ"></div>

<ul>
<li id="show1" title="hide">등록된 전화번호로 아이디 찾기</li>
<form:form modelAttribute="memberVO" action="./findIdByEmail"
		method="post" class="show1">
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

<li id="show2"><a href="./findIdByEmail">등록된 이메일로 아이디 찾기</a></li>

<li id="show3">등록된 전화번호로 비밀번호 찾기</li>

<li id="show4">등록된 이메일로 비밀번호 찾기</li>
</ul>


<script type="text/javascript">

$("#show1").click(function(){
	if($(this).prop("title")=="hide"){
		$(".show1").show(500);
		$(this).prop("title","show");
	}else{
		$(".show1").hide(500);
		$(this).prop("title","hide");
		}
		
	});

</script>

</body>


</html>