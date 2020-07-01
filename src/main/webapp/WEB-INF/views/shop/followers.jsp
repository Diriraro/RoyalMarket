<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<style type="text/css">
td{
width: 220px;
font-size: large;
text-align: center;
font-weight: bold;

}

.td1{
border-bottom: 2px solid white;
border-left: 2px solid black;
border-right: 2px solid black;
border-top: 2px solid black;

}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<c:import url="../template/nav.jsp"></c:import>

		<h1> 팔로워 페이지</h1>
		
		<c:import url="../template/shopmain.jsp"></c:import>

	<div class="container">
		<div style="border: 1px solid black; width: 1024px; min-height: 340px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
			<!-- 이동버튼  -->
			<hr>
			<table border="1" style="height: 80px;">
				<tr>
				<td bgcolor="#f2f2f2" ><a href="./myshop?mem_storeNum=${mem_storeNum}">상품</a></td>
				<td bgcolor="#f2f2f2"><a href="./comments?mem_storeNum=${mem_storeNum}">상점문의</a></td>
				<c:if test="${msnum eq mem_storeNum }">
				<td bgcolor="#f2f2f2">
					<a href="./favorites?mem_storeNum=${mem_storeNum}"> 찜</a>
				</td>
				</c:if>
				<td bgcolor="#f2f2f2"><a href="./reviews?mem_storeNum=${mem_storeNum}">상점후기</a></td>
				<td bgcolor="#f2f2f2"><a href="./followings?mem_storeNum=${mem_storeNum}">팔로잉</a></td>
				<td class="td1"><a href="./followers?mem_storeNum=${mem_storeNum}">팔로워</a></td>
				</tr>
			
			</table>
			<!--  -->
			</div>

				<div>  <!-- 내용보여줄 div -->
				<h2>${mem_storeName } 의 팔로워 목록</h2>
				
				<div style="border: 1px solid red;">
					<c:forEach items="${list}" var="vo">
							<%--<td>${vo.follow_Num}</td> --%>
							<%-- <td>${vo.give_storeNum}</td> --%>
							<%-- <td>${vo.take_storeNum}</td> --%>
							
					<div style="border: 1px solid blue; height: 250px;">
														
						<div style="border: 1px solid red; width: 250px; height: 250px; float:left;"> <!-- 왼쪽 작은박스  -->
							
							<div style="align-content: center; margin-left: 28%; margin-top: 10%;"  >
							<img src="${pageContext.request.contextPath}/resources/images/showimage.png" alt="main" style="width: 100px; height: 100px;">
							</div>
							<br>
							<br>
							<div style="align-content: center; margin-left: 28%;">
							<a href="./myshop?mem_storeNum=${vo.give_storeNum }" class="btn btn-info">${vo.give_storeName}</a>
						
							
							</div>
												
							
						</div>  <!-- 옆에 팔로우목록의 대표상품  -->
						<div style="border: 3px solid red; width: 750px; height: 250px; float: left;" >
						</div>
							
							
						
						
					</div>	
						<br>
						<br>
					</c:forEach>
				</div>

			</div>

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->
	
	
	
	
</body>
</html>