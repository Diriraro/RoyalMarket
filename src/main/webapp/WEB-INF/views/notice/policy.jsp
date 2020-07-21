<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운영 정책 - 우주장터</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body style="background-color: #f5f0f5;">
<c:import url="../template/woozoo_nav.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

<div class="container">

	<div style=""></div>
	
	<!-- notice nav -->
	
		<div class="list-group" align="center" style="margin-top: 20px; margin-left:58px; width: 1024px;">
			<a href="./noticeList"><button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
			text-align: center;line-height: 20px; border-color: #f5f0f5;
			border-bottom-width: 2px;">
			공지사항</button></a>
			<button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
			text-align: center;line-height: 20px; border-left-color: #f5f0f5; border-right-color: #f5f0f5; border-top-color: #f5f0f5; 
			border-bottom-color: #5c2392; border-bottom-width: 2px;">
			운영정책</button>
			<a href="./ban"><button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
			text-align: center;line-height: 20px; border-color: #f5f0f5;">
			거래 금지 품목</button></a>
		</div>
		<div align="center" style="width: 966px; margin-left:86px; background-color: white;">
			<br>
			<img src="${pageContext.request.contextPath}/resources/images/policy1.png" style="width: 230px; height: 93px;">
			<h2>
			<b style="color: #5c2392;">우주장터</b>는 모두가
			<br>
			이용하는 열린공간 입니다.
			</h2>
			<br>
			<h5>공정한 거래문화를 위해 우주장터는 다음과 같은 약속들을 준수합니다.</h5>
			<br><hr width="880px">
			<ul class="list-unstyled">
				<li style=" padding-top: 15px;">
					<div style="background-image: url('${pageContext.request.contextPath}/resources/images/policy2.png'); background-size: 92px 87px; 
					background-position: center center; background-repeat: no-repeat; width: 92px; height: 87px; display:inline-block;" align="left"></div>
					<div style="display:inline-block; text-align: left; width:728.03px; height: 75px; line-height: 10px;">
					<h4><b>거래 금지 품목 거래시 제재 받을 수 있습니다</b></h4>
					<p>전자 통신판매법 등에 의해 저촉되어 인터넷 거래기준에 적용되는 상품으로 1회 적발 즉시 이용제한이 될 수 있습니다.</p><p><br></p></div>
				</li>
				<li>
				<hr width="880px">
				</li>
				<li style="padding-top: 10px;">
					<div style="background-image: url('${pageContext.request.contextPath}/resources/images/policy3.png'); background-size: 92px 87px; 
					background-position: center center; background-repeat: no-repeat; width: 92px; height: 87px; display:inline-block;" align="left"></div>
					<div style="display:inline-block; text-align: left; width:728.03px; height: 75px; line-height: 15px;">
					<h4><b>랜덤박스(비공개/반공개)는 분쟁의 원인이 되고 있습니다</b></h4>
					<p>랜덤박스는 상품의 상태 및 내용물을 확인할 수 없거나 모호하여 분쟁과 신고 접수의 원인이 되고 있어 운영자에 의해 제재 받을 수 있습니다.</p></div>
				</li>
				<li>
				<hr width="880px">
				</li>
				<li style="padding-top: 15px; height: 110px;">
					<div style="background-image: url('${pageContext.request.contextPath}/resources/images/policy4.png'); background-size: 92px 87px; 
					background-position: center center; background-repeat: no-repeat; width: 92px; height: 87px; display:inline-block;" align="left"></div>
					<div style="display:inline-block; text-align: left; width:728.03px; height: 75px; line-height: 10px;">
					<h4><b>상품, 댓글의 10회 이상 도배 등록을 피해주세요</b></h4>
					<p><br><br></p></div>
				</li>
				<li>
				<hr width="880px">
				</li>
				<li style="padding-top: 15px;">
					<div style="background-image: url('${pageContext.request.contextPath}/resources/images/policy5.png'); background-size: 92px 87px; 
					background-position: center center; background-repeat: no-repeat; width: 92px; height: 87px; display:inline-block;" align="left"></div>
					<div style="display:inline-block; text-align: left; width:728.03px; height: 75px; line-height: 10px;">
					<h4><b>욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 합니다</b></h4>
					<p>비매너 행위에 관한 게시물과 댓글은 운영진에 의해 제재 받을 수 있습니다.</p><p><br></p></div>
				</li>
				<li>
				<hr width="880px">
				</li>
				<li style="padding-top: 15px;">
					<div style="background-image: url('${pageContext.request.contextPath}/resources/images/policy6.png'); background-size: 92px 87px; 
					background-position: center center; background-repeat: no-repeat; width: 92px; height: 87px; display:inline-block;" align="left"></div>
					<div style="display:inline-block; text-align: left; width:728.03px; height: 75px; line-height: 10px;">
					<h4><b>선정적이거나 판매 상품에 적절치 않은 이미지는 사용자 혼란을 일으킵니다</b></h4>
					<p>판매하려는 상품을 명확히 표현하는 사진을 사용해주세요.</p><p><br></p></div>
				</li>
				<li>
				<hr width="880px">
				</li>
				<li style="padding-top: 15px;">
					<div style="background-image: url('${pageContext.request.contextPath}/resources/images/policy7.png'); background-size: 92px 87px; 
					background-position: center center; background-repeat: no-repeat; width: 92px; height: 87px; display:inline-block;" align="left"></div>
					<div style="display:inline-block; text-align: left; width:728.03px; height: 75px; line-height: 10px;">
					<h4><b>상품명, 키워드에 판매 상품과 관계없는 단어 삽입은 제재 받을 수 있습니다</b></h4>
					<p>상품 노출을 높여보고자 인기 검색어를 마구 집어 넣는 행위는 여러 유저들에게 불편을 일으키는 원인이 됩니다.</p><p><br></p></div>
				</li>
				<li>
				<hr width="880px">
				</li>
				<li style="padding-top: 15px;">
					<div style="background-image: url('${pageContext.request.contextPath}/resources/images/policy8.png'); background-size: 92px 87px; 
					background-position: center center; background-repeat: no-repeat; width: 92px; height: 87px; display:inline-block;" align="left"></div>
					<div style="display:inline-block; text-align: left; width:728.03px; height: 75px; line-height: 15px;">
					<h4><b>정확한 상품 가격 정보를 입력해 주세요</b></h4>
					<p>실제 판매하려는 가격과 다른 상품 가격정보를 써 놓아 구매자에게 혼돈을 주지 마세요.</p><p><br></p></div>
				</li>
				<li>
				<hr width="880px">
				</li>
			</ul>
		</div>
</div>


<c:import url="../template/footer.jsp"></c:import>

</body>
</html>