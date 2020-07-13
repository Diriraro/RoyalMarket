<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
<c:import url="../template/woozoo_nav.jsp"></c:import>
<h2></h2>
		
		<c:import url="../template/shopmain.jsp"></c:import>

	<div class="container">
		<div style="border: 1px solid black; width: 1024px; min-height: 340px; ">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
		<div>
			<!-- 이동버튼  -->
			<hr>
			<table border="1" style="height: 80px;">
				<tr>
				<td bgcolor="#f2f2f2"><a href="./myshop?mem_storeNum=${mem_storeNum}">상품&nbsp;&nbsp;   ${prodco}</a></td>
				<td bgcolor="#f2f2f2"><a href="./comments?mem_storeNum=${mem_storeNum}">상점문의 &nbsp;&nbsp;${coco}</a></td>
				<c:if test="${msnum eq mem_storeNum }">
				<td bgcolor="#f2f2f2">
					<a href="./favorites?mem_storeNum=${mem_storeNum}"> 찜&nbsp;&nbsp; ${zico}</a>
				</td>
				</c:if>
				<td bgcolor="#f2f2f2"><a href="./reviews?mem_storeNum=${mem_storeNum}">상점후기&nbsp;&nbsp;  ${reco }</a></td>
				<td class="td1"><a href="./followings?mem_storeNum=${mem_storeNum}">팔로잉&nbsp;&nbsp;  ${giveco}</a></td>
				<td bgcolor="#f2f2f2"><a href="./followers?mem_storeNum=${mem_storeNum}">팔로워 &nbsp;&nbsp;  ${takeco} </a></td>
				</tr>
			
			</table>
			<!--  -->
			</div>


			<div>  <!-- 내용보여줄 div -->
				<h2>${mem_storeName } 의 팔로잉 목록</h2>
				<hr>
				
				<div style="border: 1px solid white; min-height: 340px; overflow: auto;" >
					<c:forEach items="${owilist}" var="vo">
							<%--<td>${vo.follow_Num}</td> --%>
							<%-- <td>${vo.give_storeNum}</td> --%>
							<%-- <td>${vo.take_storeNum}</td> --%>
							
							
					<div style="width: 200px; height: 320px; border: 1px solid gray ; float: left; margin-left: 4px; margin-bottom: 4px; overflow: auto; background-color: #f0f0f5" onclick="location.href='./shop/myshop?mem_storeNum=${vo.take_storeNum }'">
														
					<%-- <div style="width: 198px;">			
									
							<img src="${pageContext.request.contextPath}/resources/images/showimage.png" alt="main" style="width: 197px; height: 190px;">
							
					</div> --%>
					<div style="width: 198px; width: 130px; margin-top: 40px;  margin-left: 17%;border-radius: 70%;overflow: hidden; background-color: gray;">
					<!-- 카카오 이미지 확인  -->
					<img alt="" src="${pageContext.request.contextPath}/resources/images/user11.png" style="width: 100%; height: 100%;">
					</div>	
					
					
					<br>
							<div style=" text-align: center; margin-top: 40px;" >
							<a href="./myshop?mem_storeNum=${vo.take_storeNum }" class="btn btn-info">${vo.take_storeName }</a>
							</div>
							
						</div>  <!-- 옆에 팔로우목록의 대표상품  -->
												
					
					</c:forEach>
				</div>

			</div>

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->
</body>
</html>