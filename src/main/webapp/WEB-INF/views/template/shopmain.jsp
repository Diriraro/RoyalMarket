<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!-- shop 페이지가 공통으로 가져갈곳  -->
<div class="container">
<!-- 모든 컨트롤에서는 이름을 출력해줘야함.  -->
	<h2>${mem_storeName} 님의 상점   </h2>  
	
	<h2>${msname}님 접속중 </h2>
		<c:if test="${msnum eq mem_storeNum }">
						<a class="btn btn-info">내글</a>
	<div style="border: 1px solid black; width: 1024px; height: 340px;">

		<!-- div 1번 -->
		<div style="width: 340px; float: left;">
			<div style="border: 1px solid black; width: 330px; height: 330px;">
				<!-- 사진  -->
				<span>사진</span>
				
				<button  class="btn btn-default">상품관리</button>
					
				
			</div>
		</div>
		<!-- div 2번  -->
		
		<div
			style="border: 1px solid black; width: 680px; height: 330px; float: left;">

			<div style="border: 1px solid black; height: 80px;">
				<span>상점명</span><button>상점명 수정</button>
				<a> </a>
			</div>

			<div style="border: 1px solid black; height: 80px;">
				<span>상점오픈일 \상점방문수\상품판매 \택배발송 </span>
			</div>

			<div style="border: 1px solid black; height: 80px;">
				<span>상점코멘트</span>
				<a>${vo2 }</a>
			</div>
			<div style="border: 1px solid black; height: 80px;">
				<button>코멘트 수정</button>
			</div>
		</div>
	</div>
		</c:if>
		
		<c:if test="${msnum ne mem_storeNum }">
						<a class="btn btn-info">남상점</a>
	<div style="border: 1px solid black; width: 1024px; height: 340px;">

		<!-- div 1번 -->
		<div style="width: 340px; float: left;">
			<div style="border: 1px solid black; width: 330px; height: 330px;">
				<!-- 사진  -->
				<span>사진</span>
				<!-- 팔로우가 아니면 팔로우버튼 출력 -->
				<c:if test="${fonum.follow_Num eq null}">
					<a href="./setinsertFollow?give_storeNum=${msnum}&take_storeNum=${mem_storeNum}&mem_storeNum=${mem_storeNum}"
						class="btn btn-info pull-right"><span
						class="	glyphicon glyphicon glyphicon-plus-sign"></span>팔로우</a>
				</c:if>
				
				<!-- 팔로우 상태라면 언팔버튼 출력  -->
				<c:if test="${fonum.follow_Num ne null}">
				<a href="./setDeleteFollow?follow_Num=${fonum.follow_Num}&mem_storeNum=${mem_storeNum}"
						class="btn btn-danger pull-right"><span
						class="	glyphicon glyphicon-remove-sign"></span>언팔</a>
				</c:if>
	
						
						<a>${fonum.follow_Num}</a><!-- 팔로우 번호   ******  -->
				
			</div>
		</div>
		<!-- div 2번  -->
		
		<div
			style="border: 1px solid black; width: 680px; height: 330px; float: left;">

			<div style="border: 1px solid black; height: 80px;">
				<span>상점명</span><button>남의상점</button>
				<a> </a>
			</div>

			<div style="border: 1px solid black; height: 80px;">
				<span>상점오픈일 \상점방문수\상품판매 \택배발송 </span>
			</div>

			<div style="border: 1px solid black; height: 80px;">
				<span>상점코멘트</span>
				<a>${vo2 }</a>
			</div>
			<div style="border: 1px solid black; height: 80px;">
				<button>코멘트 수정</button>
			</div>
		</div>
	</div>
		</c:if>

</div>