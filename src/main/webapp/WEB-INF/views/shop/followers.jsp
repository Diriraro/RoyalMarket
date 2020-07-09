<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<style type="text/css">

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
<c:import url="../template/shopstyle.jsp"></c:import>

</head>
<body>
<c:import url="../template/woozoo_nav.jsp"></c:import>
<h2></h2>
		
		<c:import url="../template/shopmain.jsp"></c:import>
<c:if test="${mdata.mem_access ne 1}">

	<div class="container">
		<div style="border: 1px solid black; width: 1024px; min-height: 340px; border-color: rgba(0,0,0,0.25);">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
			<!-- 이동버튼  -->
			<hr>
			<table border="1" style="height: 80px; border-color: rgba(0,0,0,0.25);">
				<tr>
				<td bgcolor="#f2f2f2" ><a class="tds" href="./myshop?mem_storeNum=${mem_storeNum}">상품&nbsp;&nbsp;   ${prodco}</a></td>
				<td bgcolor="#f2f2f2"><a class="tds" href="./comments?mem_storeNum=${mem_storeNum}">상점문의 &nbsp;&nbsp;${coco}</a></td>
				<c:if test="${msnum eq mem_storeNum }">
				<td bgcolor="#f2f2f2">
					<a class="tds" href="./favorites?mem_storeNum=${mem_storeNum}">찜&nbsp;&nbsp; ${zico}</a>
				</td>
				</c:if>
				<td bgcolor="#f2f2f2"><a class="tds" href="./reviews?mem_storeNum=${mem_storeNum}">상점후기&nbsp;&nbsp;  ${reco }</a></td>
				<td bgcolor="#f2f2f2"><a class="tds" href="./followings?mem_storeNum=${mem_storeNum}">팔로잉&nbsp;&nbsp;  ${giveco}</a></td>
				<td class="td1"><a class="tds" href="./followers?mem_storeNum=${mem_storeNum}">팔로워 &nbsp;&nbsp;  ${takeco} </a></td>
				</tr>
			
			</table>
			<!--  -->
			</div>

				<div>  <!-- 내용보여줄 div -->
				<h2>팔로워&nbsp;<a id="redd">${takeco}</a></h2>
				<hr>
				
				<div style="border: 0px solid red; min-height: 340px; overflow: auto;" >
					<c:forEach items="${owelist}" var="vo">
							<%--<td>${vo.follow_Num}</td> --%>
							<%-- <td>${vo.give_storeNum}</td> --%>
							<%-- <td>${vo.take_storeNum}</td> --%>
						
					
					<div style="width: 200px; height: 320px; border: 1px solid gray; float: left; margin-left: 4px; margin-bottom: 4px; overflow: auto; background-color: #f0f0f5">
					
				<%-- 	<div style="width: 198px;">
					<img src="${pageContext.request.contextPath}/resources/images/showimage.png" alt="main" style="width: 197px; height: 190px;">
					</div> --%>
					
					<div style="width: 198px; width: 130px; margin-top: 40px;  margin-left: 17%;border-radius: 70%;overflow: hidden;" onclick="location.href='./myshop?mem_storeNum=${vo.give_storeNum }'">
					<!-- 카카오 이미지 확인  -->
					<img alt="" src="${pageContext.request.contextPath}/resources/images/user11.png" style="width: 100%; height: 100%; background-color: gray;" >
					</div>
					<h2></h2>					
					<div style="text-align: center;">
				    <a href="./myshop?mem_storeNum=${vo.give_storeNum }" class="btn btn-success" >${vo.give_storeName}</a><br>
				    <span>별점 : </span>
					</div>
							
					<div style=" text-align: center; margin-top: 40px;" >
						<span>상품   ${vo.pco}</span> | <span>팔로워  ${vo.fco}</span><br>
					</div>
					
					
					</div>	
									
						
						
					</c:forEach>
				</div>

			</div>

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->
	</c:if>
	<c:import url="../template/footer.jsp"></c:import>

	
</body>
</html>