<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
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
</head>
<c:import url="../template/boot.jsp"></c:import>

<body>
<c:import url="../template/nav.jsp"></c:import>

<h1>리뷰페이지</h1>
<c:import url="../template/shopmain.jsp"></c:import>

	<div class="container">
		<div style="border: 1px solid black; width: 1024px;  min-height: 340px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
			<!-- 이동버튼  -->
			<hr>
			<table border="1" style="height: 80px;">
				<tr>
				<td bgcolor="#f2f2f2"><a href="./myshop?mem_storeNum=${mem_storeNum}">상품</a></td>
				<td bgcolor="#f2f2f2"><a href="./comments?mem_storeNum=${mem_storeNum}">상점문의</a></td>
				<c:if test="${msnum eq mem_storeNum }">
				<td bgcolor="#f2f2f2">
					<a href="./favorites?mem_storeNum=${mem_storeNum}"> 찜</a>
				</td>
				</c:if>
				<td class="td1"><a href="./reviews?mem_storeNum=${mem_storeNum}">상점후기</a></td>
				<td bgcolor="#f2f2f2"><a href="./followings?mem_storeNum=${mem_storeNum}">팔로잉</a></td>
				<td bgcolor="#f2f2f2"><a href="./followers?mem_storeNum=${mem_storeNum}">팔로워</a></td>
				</tr>
			
			</table>
			<!--  -->
			</div>


			<div>
				<h2>내용</h2>
			<c:forEach items="${reli}" var="vo" varStatus="i">
				 <!-- 리스트 감쌀디아이브이  -->
				<div style="border: 1px solid yellow; min-height: 150px; overflow: auto;">
				
				<div style="float: left; width: 80px; height: 250px; border: 1px solid red;">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/user11.png" width="80px;">			
				</div><!-- 왼쪽 옆에 이미지 박스  -->
				
				<div style="font-size: large;">
				<a href="./myshop?mem_storeNum=${vo.re_storeNum}">	${vo.re_storeName}</a>  <button class="btn btn-sm btn-info">인증</button>
				<span style="float: right;">${vo.re_wDate}</span>
				<%-- ${vo.re_storeNum}  리뷰남김사람 번호 --%>
				</div>
				<%-- 리뷰번호 :${vo.re_num} 지울떄 사용--%>
				<div>
				<%-- 점수 : ${vo.re_rate} --%>
				<c:forEach var="i" begin="1" end="${vo.re_rate}">
					<a><img style="cursor: pointer; width: 14px; height: 15px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star22.png"></a>
				</c:forEach>
				</div>
				<br>
				
				<div>
				<button class="btn-default">${vo.sell_product}</button>
				</div>
				<br>
				
				<div>
					${vo.re_context}
				</div>
				
				
				<c:forEach items="${pfile}" var="pfile" varStatus="status" >
				
				<c:if test="${vo.re_num eq pfile.re_num}">
				<div>
					<img src="../upload/review/${pfile.file_name}"	alt="${pfile.ori_name}"	style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 70px; height: 70px; float: left;">
				</div>
				
				</c:if>
				</c:forEach>
			
				
				
				
				
				</div>  <!-- 리스트 감쌀디아이브이  -->
			</c:forEach>
				</div>

			

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->
</body>
</html>