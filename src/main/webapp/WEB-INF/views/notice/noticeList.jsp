<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body style="background-color: #f5f0f5;">
<c:import url="../template/woozoo_nav.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

<div class="container">

	<div></div>
	
	<!-- notice nav -->
	<div class="list-group" align="center" style="margin-top: 20px; margin-bottom: 20px;">
		<button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
		text-align: center;line-height: 20px; border-left-color: #f5f0f5; border-right-color: #f5f0f5; border-top-color: #f5f0f5; border-bottom-color: #5c2392;
		border-bottom-width: 2px;">
		공지사항</button>
		<a href="./policy"><button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
		text-align: center;line-height: 20px; border-color: #f5f0f5;">
		운영정책</button></a>
		<a href="./ban"><button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
		text-align: center;line-height: 20px; border-color: #f5f0f5;">
		거래 금지 품목</button></a>
	</div>

	<div class="list-group" align="center">
		<c:forEach items="${no_list}" var="list" varStatus="i">
			<button type="button" class="more list-group-item" style="width: 85%;" id="${i.count}">
			<b style="font-size: large;">${list.notitle}</b><br>
			<b>${list.no_regDate}</b>
			<span class="badge" style="background-color: white;"><img src="${pageContext.request.contextPath}/resources/images/down.png" style="width: 10px; height: 10px;"></span>
			</button>
			<div id="hiddenCont${i.count}" hidden="" style="background:#f2f2f2; width: 85%; border: solid 1px white;" align="left">
			${list.no_contents}
			</div>
		</c:forEach>
	</div>
			
</div>

<script type="text/javascript">
$(".more").click(function(){							// 모든 리스트가 같은 click이벤트를 사용하므로 class식별자로 받아옴
	var i = $(this).attr("id");							// 문의내역은 1,2,3 순으로 증가함 / more클래스의 id도 같은식으로 증가함 / 클릭이벤트가 나왔을때 변수에 id값 넣기
	if($("#hiddenCont"+i).is(":visible")){ 				// 실행
		$("#hiddenCont"+i).slideUp(); 
		}else{ 
			$("#hiddenCont"+i).slideDown(); 
		} 
});

</script>
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>