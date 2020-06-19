<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<div class="container">
	<h1>test</h1>	
	<div style="border: 1px solid black; width: 100%; height: 500px;">
			<div style="border: 1px solid black; width: 330px; height: 330px;"><!-- 사진  -->
					<span>사진</span>
			</div>
			
			<div style="border: 1px solid black;">
				<span>상점명</span>
			</div>
		
			<div style="border: 1px solid black;">
				<span>상점오픈일 \상점방문수\상품판매 \택배발송 </span>
			</div>			
			
			<div style="border: 1px solid black;">
				<span>상점코멘트</span>
			</div>
	</div>
	
	<button class="btn btn-info"><a href="./myshop">상품</a></button>
	
	<button class="btn btn-info"><a href="./reviews">상점문의</a></button>
	
	<button class="btn btn-info"><a href="./favorites"> 찜</a></button>
	
	<button class="btn btn-info"><a href="./reviews">상점후기</a></button>
	
	<button class="btn btn-info"><a href="./followings">팔로잉</a></button>
	
	<button class="btn btn-info"><a href="./followers">팔로워</a></button>
</div>