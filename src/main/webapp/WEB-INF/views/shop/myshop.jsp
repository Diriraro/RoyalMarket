<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.img{
        position: relative;                                   
        height: 190px;
        width: 197px;
        background-size: cover;
    }

.img-cover{

       height: 100%;
       width: 100%;
       background-color: rgba(0, 0, 0, 0.7);                                                                 
       z-index:1;
    }

.img .content{
         position: absolute;
         top:50%;
         left:50%;
         transform: translate(-50%, -50%);                                                                   
         font-size:1rem;
         color: white;
         z-index: 2;
         text-align: center;
  }




</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
<c:import url="../template/shopstyle.jsp"></c:import>

</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<!-- 내상점 버튼 누르면 처음으로 들어오는 곳  -->
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
				<td class="td1"><a class="tds" href="./myshop?mem_storeNum=${mem_storeNum}">상품&nbsp;&nbsp;   ${prodco}</a></td>
				<td bgcolor="#f2f2f2"><a class="tds" href="./comments?mem_storeNum=${mem_storeNum}">상점문의 &nbsp;&nbsp;${coco}</a></td>
				<c:if test="${msnum eq mem_storeNum }">
				<td bgcolor="#f2f2f2">
					<a class="tds" href="./favorites?mem_storeNum=${mem_storeNum}"> 찜&nbsp;&nbsp; ${zico}</a>
				</td>
				</c:if>
				<td bgcolor="#f2f2f2"><a class="tds" href="./reviews?mem_storeNum=${mem_storeNum}">상점후기&nbsp;&nbsp;  ${reco }</a></td>
				<td bgcolor="#f2f2f2"><a class="tds" href="./followings?mem_storeNum=${mem_storeNum}">팔로잉&nbsp;&nbsp;  ${giveco}</a></td>
				<td bgcolor="#f2f2f2"><a class="tds" href="./followers?mem_storeNum=${mem_storeNum}">팔로워 &nbsp;&nbsp;  ${takeco} </a></td>
				</tr>
			
			</table>
			<!--  -->
			</div>
		
			<div>  <!-- 내용보여줄 div -->
				<h2>상품&nbsp;<a id="redd">${prodco}</a></h2>
				<hr>
				
				<div style="border: 1px solid white; min-height: 340px; overflow: auto;"  >
					<!-- 상품판매중인 리스트를 밑에다 뿌릴것.  -->
					
					<c:forEach items="${mylist }" var="vo">
					
					
					<div style="width: 200px; height: 300px; border: 1px solid gray ; float: left; margin-left: 4px; margin-bottom: 4px;  background-color: #f0f0f5; border-color: rgba(0,0,0,0.25);"  onclick="location.href='../product/productSelect?sell_num=${vo.sell_num}'">
					
				<!--status 2이면   판매완료 -->	
				<c:if test="${vo.sell_status eq 2}">
					
				<div style="width: 198px;">
				<c:forEach items="${pfile}" var="pfile" varStatus="status" >
				
				<c:if test="${vo.sell_num eq pfile.sell_num}">
				
				<!--  -->
					<%-- <img  src="../upload/product/${pfile.file_name}"	alt="${pfile.ori_name}"	style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 197px; height: 190px;"> --%>
				<!--  -->
				
					<div class=img style="height: 190px; width:197px;float: left;  background-size: 197px 190px; background-image: url('${pageContext.request.contextPath}/upload/product/${pfile.file_name}');">
						<div class="content">
							<h5 style="margin-bottom: 30px;">판매 <br> 완료</h5>
						</div>
						<div class="img-cover">
						</div>
					</div>
					
				</c:if>
				
				
				</c:forEach>
				</div>
				</c:if>	
				
				<!--0,1 일떄 판매중  -->
					<c:if test="${vo.sell_status ne 2}">
					
				<div style="width: 198px;">
				<c:forEach items="${pfile}" var="pfile" varStatus="status" >
				
				<c:if test="${vo.sell_num eq pfile.sell_num}">
					<img  src="../upload/product/${pfile.file_name}"	alt="${pfile.ori_name}"	style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 197px; height: 190px;">
				</c:if>
				
				
				</c:forEach>
				</div>
				</c:if>	
				
					<div class="s1 s2">
					<span style="font-size: 17px;" class="s2">
					${vo.sell_product }
					</span>
					</div>
					<div class="s1 s3">
					<span style="font-weight: bold;">
					<fmt:formatNumber> ${vo.sell_price } </fmt:formatNumber>
					</span>
					<span style="font-weight: bold; font-size: 17px;">원</span>
					<span class="badge" style="float: right; font-size: 13px;">
					${vo.sell_date }
					</span>
					</div>
					<div class="s1">
					<span style="font-size: 17px;">
				 	# ${vo.sell_kind}
					</span>
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