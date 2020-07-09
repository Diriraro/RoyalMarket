<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
<c:import url="../template/shopstyle.jsp"></c:import>



<body>
<c:import url="../template/woozoo_nav.jsp"></c:import>
<h2></h2>
<c:import url="../template/shopmain.jsp"></c:import>
<c:if test="${mdata.mem_access ne 1}">

	<div class="container">
		<div style="border: 1px solid black; width: 1024px;  min-height: 340px; border-color: rgba(0,0,0,0.25);">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
			<!-- 이동버튼  -->
			<hr>
			<table border="1" style="height: 80px; border-color: rgba(0,0,0,0.25);">
				<tr>
				<td bgcolor="#f2f2f2"><a class="tds" href="./myshop?mem_storeNum=${mem_storeNum}">상품&nbsp;&nbsp;   ${prodco}</a></td>
				<td bgcolor="#f2f2f2"><a class="tds" href="./comments?mem_storeNum=${mem_storeNum}">상점문의 &nbsp;&nbsp;${coco}</a></td>
				<c:if test="${msnum eq mem_storeNum }">
				<td bgcolor="#f2f2f2">
					<a class="tds" href="./favorites?mem_storeNum=${mem_storeNum}"> 찜&nbsp;&nbsp; ${zico}</a>
				</td>
				</c:if>
				<td class="td1"><a class="tds" href="./reviews?mem_storeNum=${mem_storeNum}">상점후기&nbsp;&nbsp;  ${reco }</a></td>
				<td bgcolor="#f2f2f2"><a class="tds" href="./followings?mem_storeNum=${mem_storeNum}">팔로잉&nbsp;&nbsp;  ${giveco}</a></td>
				<td bgcolor="#f2f2f2"><a class="tds" href="./followers?mem_storeNum=${mem_storeNum}">팔로워 &nbsp;&nbsp;  ${takeco} </a></td>
				</tr>
			
			</table>
			<!--  -->
			</div>


			<div>
				<h2>인증후기&nbsp;<a id="redd">${reco}</a></h2>
				<hr>
			<c:forEach items="${relist}" var="vo" varStatus="i">
				 <!-- 리스트 감쌀디아이브이  -->
				<div style="border-top: 1px solid gray ; min-height: 150px; overflow: auto; background-color: #f0f0f5">
				
				<div style="float: left; width: 80px; height: 250px;">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/user11.png" width="80px;">			
				</div><!-- 왼쪽 옆에 이미지 박스  -->
				
				<div style="font-size: large;">
				<a href="./myshop?mem_storeNum=${vo.re_storeNum}">	${vo.re_storeName}</a>
				<span style="float: right;" class="badge pull-right">${vo.re_wDate}</span>
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
				<button class="btn-default go" title="${vo.sell_num }">${vo.sell_product}</button>
				</div>
				<hr>
				<br>
				
				<div>
					<p style="font-size: large;">
					${vo.re_context}
					</p>
				</div>
				
				
				<c:forEach items="${pfile}" var="pfile" varStatus="status" >
				
				<c:if test="${vo.re_num eq pfile.re_num}">
				<div>
					<img src="../upload/review/${pfile.file_name}"	alt="${pfile.ori_name}"	style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 70px; height: 70px; float: left;">
				</div>
				
				</c:if>
				</c:forEach>
				
				
				<c:if test="${msnum eq vo.re_storeNum}">
							<a href="./setDeleteReview?re_num=${vo.re_num}&mem_storeNum=${vo.mem_storeNum}"	class="btn btn-danger pull-right"><span	class="	glyphicon glyphicon-remove-sign"></span>Delete</a>
				</c:if>
				
				</div>  <!-- 리스트 감쌀디아이브이  -->
				<hr>
			</c:forEach>
				</div>

			

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->
	</c:if>
	<script type="text/javascript">
		$(".go").click(function(){
		var tt=	$(this).attr("title");
			console.log(tt);
			location.href = "../product/productSelect?sell_num="+tt;


			
			});

	</script>
	
		<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>