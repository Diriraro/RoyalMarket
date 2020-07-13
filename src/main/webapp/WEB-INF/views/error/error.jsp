<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${code}에러페이지</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/1a953cf392.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
.container {
	text-align: center;
}

.container {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<img src="${pageContext.request.contextPath}/resources/images/error.png">
		<p>에러 발생 !! : ${code}
		<p>에러 메세지 : ${msg}
		<p>에러 발생 시간 : ${timestamp}</p>
		<a id="getHome">우주마켓 홈페이지로 가기! <i class="fas fa-home"></i></a>
	</div>
	<script type="text/javascript">
		$("#getHome").click(function() {
			location.href = "/";
		})
	</script>
</body>
</html>