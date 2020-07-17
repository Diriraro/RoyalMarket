<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공 - 우주장터</title>
</head>
<body>
	<h1>결제 성공</h1>
	
<script type="text/javascript">
/* 	window.opener.location.reload();    //부모창 reload
	window.close();    //현재 팝업창 Close */
</script>
</body>
</html>