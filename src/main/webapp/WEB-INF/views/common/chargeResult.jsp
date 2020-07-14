<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('${result}');
	location.href="${path}";

	window.opener.location.reload();    //부모창 reload
	window.close();    //현재 팝업창 Close
</script>

</head>
<body>
</body>
</html>