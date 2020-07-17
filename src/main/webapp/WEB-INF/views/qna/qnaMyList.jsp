<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상담 내역 - 우주장터</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body style="background-color: #f5f0f5;">
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<c:import url="../template/style.jsp"></c:import>

	<div class="container">
		<!-- qna nav -->
		<div class="list-group" align="center" style="margin-top: 20px; margin-bottom: 20px;">
			<a href="./qnaWrite"><button class="list-group-item" type="button" style="width: 512px; height: 44px; display: inline-block; 
			text-align: center;line-height: 20px; border-color: #f5f0f5;">
			1:1 상담하기</button></a>
			<button class="list-group-item" type="button" style="width: 512px; height: 44px; display: inline-block; 
			text-align: center;line-height: 20px; border-left-color: #f5f0f5; border-right-color: #f5f0f5; border-top-color: #f5f0f5; border-bottom-color: #5c2392;
			border-bottom-width: 2px;">
			상담내역</button>
		</div>
		
		<div class="list-group" align="center">
			<c:forEach items="${qna_list}" var="list" varStatus="i">
				<button type="button" class="more list-group-item" style="width: 85%;" id="${i.count}">
				<b style="font-size: large;">${list.qna_title}</b><br>
				<b>문의 날짜:${list.qna_regDate}</b>
				<span class="badge" style="float: right;">
				<img src="${pageContext.request.contextPath}/resources/images/down.png" style="width: 10px; height: 10px;"></span>
				<span style="float: right;"><b style="color: red;">
					<c:if test="${list.qna_check eq 0}">답변대기중</c:if> 
					<c:if test="${list.qna_check ne 0}">답변완료</c:if>
					<c:if test="${list.qna_checkDate eq null}"></c:if> 
					<c:if test="${list.qna_checkDate ne null}">${list.qna_checkDate}</c:if>
				&nbsp;</b></span>
				</button>
				
				<textarea id="hiddenCont${i.count}" readonly="readonly"	disabled="disabled"
				style="margin: 0px; width: 969px; height: 240px; display: none; background-color: white; resize: none;">${list.qna_contents}</textarea>
			</c:forEach>
		</div>
		
	</div>

	<script type="text/javascript">
		$(".more").click(function() { // 모든 리스트가 같은 click이벤트를 사용하므로 class식별자로 받아옴
			var i = $(this).attr("id"); // 문의내역은 1,2,3 순으로 증가함 / more클래스의 id도 같은식으로 증가함 / 클릭이벤트가 나왔을때 변수에 id값 넣기
			if ($("#hiddenCont" + i).is(":visible")) { // 실행
				$("#hiddenCont" + i).slideUp();
			} else {
				$("#hiddenCont" + i).slideDown();
			}
		});
	</script>


<c:import url="../template/footer.jsp"></c:import>
</body>
</html>