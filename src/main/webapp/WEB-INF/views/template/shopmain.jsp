<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!-- shop 페이지가 공통으로 가져갈곳  -->

<div class="container">
<!-- 모든 컨트롤에서는 이름을 출력해줘야함.  -->
	<%-- <h2>${mem_storeName}</h2>  --%> 
	<%-- <h2>${msname}님 접속중 </h2> --%>
		<c:if test="${msnum eq mem_storeNum }">
	<div style="border: 1px solid black; width: 1024px; height: 340px;">

		<!-- div 1번 -->
		<div style="width: 340px; float: left;">
			<div style="border: 1px solid black; width: 330px; height: 330px; background-size : cover;  background-image: url('${pageContext.request.contextPath}/resources/images/shopback.jpg');">
				<!-- 사진  -->
				<div style="width: 130px; width: 130px; margin-top: 40px;  margin-left: 30%;border-radius: 70%;overflow: hidden;">
					<!-- 카카오 이미지 확인  -->
					<img alt="" src="${pageContext.request.contextPath}/resources/images/user11.png" style="width: 100%; height: 100%;">
				</div>
				<div style=" height: 100px; margin-top: 60px; text-align: center;">
					<button>상품 관리</button>
				
				
				</div>
			</div>
		</div>
		<!-- div 2번  -->
		
		<div style="border: 0px solid black; width: 680px; height: 330px; float: left; font-size: large;">

			<div style="border: 1px solid black; height: 80px;margin-bottom: 1px; margin-top: 2px;">
			
				<!--  상점명 수정   승범이형  plz  -->
				<span>${mem_storeName}</span><button>상점명 수정</button>
				<a> </a>
			</div>

			<div style="border: 1px solid black; height: 80px; margin-bottom: 1px; margin-top: 2px;">
				<span>상점오픈일 :: ${getregDate} </span>
			</div>

			<div style="border: 1px solid black; height: 80px;">
			<c:if test="${avg eq 0.0}">
			<a> 거래내역이 없습니다. </a>			
			</c:if>
			
			<c:if test="${avg ne 0.0}">
			<a>평점 : ${avg }</a>
			</c:if>
			</div>
			
			<div style="border: 1px solid black; height: 80px;">
				<c:forEach var="i" begin="1" end="${flo}">
					<a><img style="cursor: pointer; width: 14px; height: 15px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star22.png"></a>
				</c:forEach>
				<c:if test="${substar eq 1}">
					<a><img style="cursor: pointer; width: 14px; height: 15px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star23.png"></a>
				</c:if>
			</div>
		</div>
	</div>
		</c:if>
		
		<c:if test="${msnum ne mem_storeNum }">
						
	<div style="border: 1px solid black; width: 1024px; height: 340px;">

		<!-- div 1번 -->
		<div style="width: 340px; float: left;">
			<div style="border: 1px solid black; width: 330px; height: 330px; background-size : cover;  background-image: url('${pageContext.request.contextPath}/resources/images/shopback.jpg');">
				<!-- 사진  -->
				<div style="width: 130px; width: 130px; margin-top: 40px;  margin-left: 30%;border-radius: 70%;overflow: hidden;">
				<!-- 카카오 이미지 확인  -->
					<img alt="" src="${pageContext.request.contextPath}/resources/images/user11.png" style="width: 100%; height: 100%;">
				</div>
				
				<!-- 팔로우가 아니면 팔로우버튼 출력 -->
				<div style=" height: 100px; margin-top: 60px; text-align: center;">
				
				<c:if test="${fonum.follow_Num eq null}">
				<div>
					<a href="./setinsertFollow?give_storeNum=${msnum}&take_storeNum=${mem_storeNum}&mem_storeNum=${mem_storeNum}"
						class="btn btn-info" id="pi"><span
						class="	glyphicon glyphicon glyphicon-plus-sign"></span>팔로우</a>
				</div>
				</c:if>
				
				
				<!-- 팔로우 상태라면 언팔버튼 출력  -->
				<c:if test="${fonum.follow_Num ne null}">
				<div>
				<a href="./setDeleteFollow?follow_Num=${fonum.follow_Num}&mem_storeNum=${mem_storeNum}"
						class="btn btn-danger" id="mi"><span
						class="	glyphicon glyphicon-remove-sign"></span>언팔</a>
				</div>
				</c:if>
	
						
				<%-- <a>${fonum.follow_Num}</a> --%><!-- 팔로우 번호   ******  -->
				</div>
				
			</div>
		</div>
		<!-- div 2번  -->
		
		<div style="border: 0px solid black; width: 680px; height: 330px; float: left; font-size: large;">

			<div style="border: 1px solid black; height: 80px;">
			<!--  상점명 수정   승범이형  plz  -->
				<span>${mem_storeName }</span>
				<a> </a>
			</div>

			<div style="border: 1px solid black; height: 80px;">
				<span>상점오픈일  :: ${getregDate }</span>
			</div>

			<div style="border: 1px solid black; height: 80px;">
			<c:if test="${avg eq 0.0}">
			<a> 거래내역이 없습니다. </a>			
			</c:if>
			
			<c:if test="${avg ne 0.0}">
			<a>평점 : ${avg }</a>
			</c:if>
			</div>
			<div style="border: 1px solid black; height: 80px;">
				<c:forEach var="i" begin="1" end="${flo}">
					<a><img style="cursor: pointer; width: 14px; height: 15px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star22.png"></a>
				</c:forEach>
				<c:if test="${substar eq 1}">
					<a><img style="cursor: pointer; width: 14px; height: 15px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star23.png"></a>
				</c:if>
			</div>
		</div>
	</div>
		</c:if>

</div>

<script type="text/javascript">





</script>
