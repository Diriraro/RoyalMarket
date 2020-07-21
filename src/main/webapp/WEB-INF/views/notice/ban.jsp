<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 금지 품목 - 우주장터</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
	.banlist{
		font-size: 16px; 
		font-weight:600; 
		letter-spacing:-0.5px; 
		width: 934px; 
		height: 16px; 
		line-height: 16px; 
		margin-bottom: 8px; 
		display: list-item; 
		text-align: left; 
		vertical-align: baseline;
	}
</style>
</head>
<body style="background-color: #f5f0f5;">
<c:import url="../template/woozoo_nav.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

<div class="container">

	<div></div>
	
	<!-- notice nav -->
	<div class="list-group" align="center" style="margin-top: 20px; margin-bottom: 20px;">
		<a href="./noticeList"><button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
		text-align: center;line-height: 20px; border-color: #f5f0f5;">
		공지사항</button></a>
		<a href="./policy"><button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
		text-align: center;line-height: 20px; border-color: #f5f0f5;">
		운영정책</button></a>
		<button class="list-group-item" type="button" style="width: 320px; height: 44px; display: inline-block; 
		text-align: center;line-height: 20px; border-left-color: #f5f0f5; border-right-color: #f5f0f5; border-top-color: #f5f0f5; border-bottom-color: #5c2392;
		border-bottom-width: 2px;">
		거래 금지 품목</button>
	</div>
	<div align="center" style="width: 966px; margin-left:86px; background-color: white; padding: 32px 16px 64px 16px;">
		<h1><b>
		<span style="color: #5c2392;">우주장터</span><br>
		거래 금지 품목 안내
		</b>
		</h1>
		<p>인터넷에서 거래 시 법에 저촉되는 모든 상품에 대해서는 거래를 포함한 나눔까지 모두 제재 대상이 됩니다.</p>
		<p>수제 음식 및 식품을 판매하는 상점에서는 상점 메인에 <br>반드시 운영진이 확인 가능한 식품 제조 허가증과 사업자등록증 번호를 기재해 주시기 바랍니다.</p>
		
		<br><hr width="880px">
		<ul class="list-unstyled">
			<li class="banlist">주민등록증 (각종 신분증)</li>
			<li class="banlist">담배 (전자담배)</li>
			<li class="banlist">주류</li>
			<li class="banlist">의약품</li>
			<li class="banlist">수제 (음식, 화장품 등)</li>
			<li class="banlist">소분판매 (식품, 화장품 등)</li>
			<li class="banlist">불법도박글 (토토)</li>
			<li class="banlist">타투 (불법시술)</li>
			<li class="banlist">개통 불가 휴대폰</li>
			<li class="banlist">온라인게임 계정</li>
			<li class="banlist">성인용품 (콘돔제외)</li>
			<li class="banlist">대포차</li>
			<li class="banlist">대포통장</li>
			<li class="banlist">불법 소프트웨어 복제품</li>
			<li class="banlist">암표</li>
			<li class="banlist">판매가 불가능한 각종 티켓 (비매품/증정용)</li>
			<li class="banlist">렌즈</li>
			<li class="banlist">화장품 샘플</li>
			<li class="banlist">랜덤박스 (비공개/반공개박스)</li>
			<li class="banlist">온누리상품권, 지역사랑상품권, 지역화폐 등</li>
			<li class="banlist">재난기본소득 등으로 지급받은 선불카드, 지역화폐카드 등</li>
			<li class="banlist">유사군복류(전투복, 전투모, 전투화, 계급장, 야전상의, 방한복, 비행복, 특전복 등)</li>
			<li class="banlist">군용장구(권총집, 수통, 야전삽, 천막류, 침낭, 모포, 방탄모, 방탄복, 배낭 등)</li>
			<li class="banlist">건강기능식품</li>
			<li class="banlist">도수 있는 안경, 콘택트렌즈 및 썬글라스</li>
			<li class="banlist">상표권 침해 물품</li>
			<li class="banlist">저작권 침해 물품</li>
			<li class="banlist">모의총포</li>
			<li class="banlist">안전인증표시 없는 안전인증대상제품</li>
			<li class="banlist">음란물</li>
			<li class="banlist">불법현금융통 목적의 상품</li>
			<li class="banlist">청소년유해매체물, 청소년유해약물, 청소년유해물건</li>
			<li class="banlist">총포·도검·화약류·분사기·전자충격기·석궁</li>
			<li class="banlist">유해화학물질</li>
			<li class="banlist">반려동물</li>
			<li class="banlist">응모권</li>
			<li class="banlist">적합성 평가를 받지 않은 불법방송통신기자재</li>
			<li class="banlist">개인 사용 목적으로 해외직구한 전자제품</li>
			<li class="banlist">휴대폰 소액결제(통신과금서비스)를 통한 자금 융통 목적의 상품</li>
			<li class="banlist">그외 법률을 위반하는 모든 상품</li>
		</ul>
		<br>
		<div style="background-color: #f5f0f5; height: 32px; font-weight: 400; line-height: 32px;">거래 금지 상품은 지속적으로 업데이트 됩니다.</div>
	</div>
	
</div>


<c:import url="../template/footer.jsp"></c:import>

</body>
</html>