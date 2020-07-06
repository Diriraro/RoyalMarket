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

 a:visited { color: black; text-decoration: none;}



</style>
</head>

<body>


<div class="logo"><img src="../../resources/images/nav_logo2.png"	class="sc-fYiAbW knQFFQ"></div>

<ul>
<li><a href="./findIdByPhone" style="text-decoration: none;">등록된 전화번호로 아이디 찾기</a></li>

<li><a href="./findIdByEmail">등록된 이메일로 아이디 찾기</a></li>

<li><a href="./findPwByPhone">등록된 전화번호로 비밀번호 찾기</a></li>

<li><a href="./findPwByEmail">등록된 이메일로 비밀번호 찾기</a></li>
</ul>


</body>

</html>