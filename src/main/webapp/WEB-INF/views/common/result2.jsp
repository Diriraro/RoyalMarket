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

	
	if(${close}==1){
		window.close();
		}
</script>
</head>
<body>
</body>
</html>