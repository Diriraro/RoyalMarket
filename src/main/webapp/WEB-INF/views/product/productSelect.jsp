<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>

	<div
		style="border-bottom: solid 1px black; width: 1024px; margin-left: 440px; height: 78px;">
		<div style="width: 300px; height: 300px;">
			<img style="width: 20px;height: 20px;float: left;margin-top: 30px;" alt="홈이미지" src="${pageContext.request.contextPath}/resources/images/home_logo.png">
			<font style="float: left;color: #4d555e;margin-top: 31px;">&nbsp;홈&nbsp;&nbsp;</font>
			<img style="width: 16px;height: 15px;float: left;margin-top: 33px;" alt="방향이미지" src="${pageContext.request.contextPath}/resources/images/arrow_logo2.png">
			<div style="float: left;margin-top: 24px;" class="dropdown">
				<button style="width: 164px; color: #4d555e" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">${vo.sell_kind}
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=패션잡화">패션잡화</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=여성의류">여성의류</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=남성의류">남성의류</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=디지털/가전">디지털/가전</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=생활/문구/가구/식품">생활/문구/가구/식품</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=유아동/출산">유아동/출산</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=스타굿즈">스타굿즈</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=스포츠/레저">스포츠/레저</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList?kind=sk&search=뷰티/미용">뷰티/미용</a></li>
				</ul>
			</div>
		</div>
		<br> <br>
	</div>
	<br>
	<!-----------------------------------사진---------------------------------  -->
	<div style="">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="width: 428px; margin-left: 440px; float: left;">

			<!-- Indicators //현재 사용 안함-->
			<ol class="carousel-indicators">
				<c:forEach items="${pfile}" var="pfile" varStatus="status">

					<c:if test="${status.index eq 0}">
						<li data-target="#myCarousel" data-slide-to="${status.index}"
							class="active"></li>
					</c:if>
					<c:if test="${status.index ne 0}">
						<li data-target="#myCarousel" data-slide-to="${status.index}"></li>
					</c:if>
				</c:forEach>

			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">

				<c:forEach items="${pfile}" var="pfile" varStatus="status">

					<c:if test="${status.count eq 1}">
						<div class="item active">
							<img src="../upload/product/${pfile.file_name}"
								alt="${pfile.ori_name}"
								style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 428px; height: 428px;">
							<div class="carousel-caption">
								<p></p>
							</div>
						</div>
					</c:if>

					<c:if test="${status.count ne 1}">
						<div class="item">
							<img src="../upload/product/${pfile.file_name}"
								alt="${pfile.ori_name}"
								style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 428px; height: 428px;">
							<div class="carousel-caption">
								<p></p>
							</div>
						</div>
					</c:if>

				</c:forEach>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- 사진끝 -->

		<div style="display: inline-block; margin-left: 50px; width: 545px;">
			<font style="font-size: 25px; font-weight: 800;">${vo.sell_product}</font>
			<br> <br> <font style="font-size: 45px">${vo.sell_price}</font><font
				style="font-size: 26px;">원</font>
			<hr>
			<img style="width: 20px; height: 20px" alt=""
				src="${pageContext.request.contextPath}/resources/images/zzim_logo.png">
			<font style="color: #cccccc; font-weight: 600; font-size: 15px;">&nbsp;${zcount}</font>
			<font style="color: #cccccc;">ㅣ</font> <img
				style="width: 24px; height: 16px" alt=""
				src="${pageContext.request.contextPath}/resources/images/hit_logo.png">
			<font style="color: #cccccc; font-weight: 600; font-size: 15px;">&nbsp;${vo.sell_hit}</font>
			<font style="color: #cccccc;">ㅣ</font> <img
				style="width: 20px; height: 20px" alt=""
				src="${pageContext.request.contextPath}/resources/images/date_logo.png">
			<font style="color: #cccccc; font-weight: 600; font-size: 15px;">&nbsp;${vo.sell_date}</font>
			<br> <br> <br> <br> <br> <br> <font
				style="color: #b1b1b1; font-size: 15px; font-weight: 600;">·&nbsp;판매자
				지역&nbsp;&nbsp;</font> <img
				style="width: 16px; height: 20px; margin-bottom: 3px;" alt=""
				src="${pageContext.request.contextPath}/resources/images/ad_logo.png">
			<font style="font-weight: 600; font-size: 15px;">&nbsp;${mvo.mem_address}</font>
			
			
			<!--  찜구현    -->

			<form action="zzimInsert" method="post">
				<input type="hidden" value="${zc.zzim_num}"> <input
					type="hidden" name="mem_storeNum" value="${member.mem_storeNum}" />
				<input type="hidden" name="sell_num" value="${vo.sell_num}" />
				
				<c:if test="${empty zc.zzim_num and (vo.mem_storeNum ne member.mem_storeNum)}">
					<button type="submit"
						style="margin-top: 65px; border-radius:0px 0px 0px 0px;width: 176px; height: 56px;background-image: url('${pageContext.request.contextPath}/resources/images/zzim_button.png');"
						class="btn btn-default zzimbtn"></button>
					<a><img style="margin-top: 65px; cursor: pointer;" alt=""
						src="${pageContext.request.contextPath}/resources/images/phone_button.png"></a>
					<a><img style="margin-top: 65px; cursor: pointer;" alt=""
						src="${pageContext.request.contextPath}/resources/images/buy_button.png"></a>
				</c:if>
			</form>

			<c:if test="${not empty zc.zzim_num and (vo.mem_storeNum ne member.mem_storeNum)}">
				<a class="zzimbtn"  href="zzimDelete?zzim_num=${zc.zzim_num}"><img
					style="margin-top: 65px; cursor: pointer;" alt=""
					src="${pageContext.request.contextPath}/resources/images/zzimaft_button.png"></a>
				<a><img style="margin-top: 65px; cursor: pointer;" alt=""
					src="${pageContext.request.contextPath}/resources/images/phone_button.png"></a>
				<a><img style="margin-top: 65px; cursor: pointer;" alt=""
					src="${pageContext.request.contextPath}/resources/images/buy_button.png"></a>
			</c:if>

			<c:if test="${vo.mem_storeNum eq member.mem_storeNum}">
				<a class="zzimbtn"  href="myProductList?kind=sp&mem_storeNum=${member.mem_storeNum}"><img
					style="margin-top: 65px; cursor: pointer;" alt=""
					src="${pageContext.request.contextPath}/resources/images/myshopgo_logo.png"></a>
			</c:if>
  <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

</div>	
			<!-- 찜 끝 -->

		</div>
	</div>
	
	<!-- 상품정보 -->
	
	<div style="width: 348px;margin-left: 440px;margin-top:100px;" > </div>
	
	<div style="width: 1024px; height: 360px; margin-left: 440px;">
	
	<div style="float:left; height: 50px;width: 348px;
	border-left:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;
	background-image: url('${pageContext.request.contextPath}/resources/images/pro_info.png');">
	</div>
	<div style="float:left;height: 50px;width: 676px;border-bottom:solid 1px black;">
	</div>
	<br><br><br><br><br>
	<font style="font-size: 18px;font-weight: 900;">상품정보</font>
	<hr><br>
	<pre style="background-color: white; border-color: white;">${vo.sell_info}</pre>
	<br><br><hr>
	
	<div style="float:left; height: 70px;width: 341px;">
	<img style="margin-left: 120px; width: 16px;height: 18px;" alt="" src="${pageContext.request.contextPath}/resources/images/ad_logo.png">
	<font style="color: #b1b1b1; font-size: 14px; font-weight: 600;">&nbsp;판매자지역</font>
	<br>
	<div style="text-align:center; color: #4d555e; font-size: 14px; font-weight: 600;margin-top: 10px;">${mvo.mem_address}</div>
	</div>
	
	<div style="float:left; height: 70px;width: 341px;border-left: solid 1px #b1b1b1;border-right: solid 1px #b1b1b1;">
	<img style="margin-left: 125px; width: 16px;height: 18px;" alt="" src="${pageContext.request.contextPath}/resources/images/cate_logo.png">
	<font style="color: #b1b1b1; font-size: 14px; font-weight: 600;">&nbsp;카테고리</font>
	<br>
	<div style="text-align:center; color: #4d555e; font-size: 14px; font-weight: 600;margin-top: 10px;">${vo.sell_kind}</div>
	</div>
	
	<div style="float:left; height: 70px;width: 341px;">
	<img style="margin-left: 125px; width: 15px;height: 18px;" alt="" src="${pageContext.request.contextPath}/resources/images/tag_logo.png">
	<font style="color: #b1b1b1; font-size: 14px; font-weight: 600;">&nbsp;상품태그</font>
	<br>
	<div style="text-align:center; color: #4d555e; font-size: 14px; font-weight: 600;margin-top: 10px;">${vo.sell_tag}</div>
	</div>
	</div>

	
	<!-- 상품정보 끝 -->

		
		
		
	<!--  상품문의  -->
	<br>
	<hr style="width: 1024px;">
	<div style="width: 663px; margin-left:440px;float: left;border-right: solid 1px #e4e4e4;">
	<font style="font-size: 18px;font-weight: 900;">상품문의</font>
	<hr style="width: 630px;">

	<div class="container">
		<form name="qnaInsertForm">
			<div class="input-group">
				<input type="hidden" name="sell_num" value="${vo.sell_num}" /> 
				<input type="hidden" name="pq_storeNum" value="${member.mem_storeNum}" />
				<input type="hidden" id="pq_storeName" name="pq_storeName" value="${member.mem_storeName}" /> 
					<textarea style="width: 630px;height: 80px;" class="form-control" id="pq_contents" name="pq_contents"placeholder="내용을 입력하세요."></textarea>
					<div>
					<button id="qnaInsert" class="btn btn-default" type="button" name="qnaInsertBtn">등록</button>
					</div>
			</div>
		</form>
	</div>

	<div class="container">
		<div class="qnaList"></div>
	</div>
	
	</div>
	<!-- 상품문의끝 -->
	
	
	<!-- 상점정보 -->
	<div style="float: left;width: 360px;">
	<font style="font-size: 18px;font-weight: 900;">&nbsp;&nbsp;상점정보</font>
	<hr style="width: 330px;">
	<img style="width: 50px;height: 50px;margin-left: 29px;" alt="" src="${pageContext.request.contextPath}/resources/images/logo.png">
	  <a href="${pageContext.request.contextPath}/shop/myshop?mem_storeNum=${vo.mem_storeNum}"> 
	  <font style="font-weight: 800; font-size: 16px;color: black;">&nbsp;${mvo2.mem_storeName}</font></a>

	  <c:if test="${fonum.follow_Num eq null}">
					<a href="../shop/setinsertFollow?give_storeNum=${member.mem_storeNum}&take_storeNum=${vo.mem_storeNum}&mem_storeNum=${vo.mem_storeNum}"
					class="btn" id="pi"style="margin-top:9px; margin-left: 15px;">
					<img style="border: solid 1px #808080;" alt="" src="${pageContext.request.contextPath}/resources/images/follow_logo.png"></a>
				</c:if>
				
				<!-- 팔로우 상태라면 언팔버튼 출력  -->
				<c:if test="${fonum.follow_Num ne null}">
				<a href="../shop/setDeleteFollow?follow_Num=${fonum.follow_Num}&mem_storeNum=${vo.mem_storeNum}" 
				class="btn" id="mi"style="margin-top:9px; margin-left: 15px;">
				<img style="border: solid 1px #f0595b;" alt="" src="${pageContext.request.contextPath}/resources/images/following_logo.png"></a>
				</c:if>

				<br>
				<div style="height: 10px;"></div>
				<a href="${pageContext.request.contextPath}/shop/myshop?mem_storeNum=${vo.mem_storeNum}">
				<font style="margin-left:125px; color: gray;">상점 상품 더보기></font></a>
				<hr>
				
				
	  
	</div>
	<!-- 상점정보끝 -->
	
	<script type="text/javascript">
		$(document).on('click', '.reply', function() {
			$("#pq_contents").val("@" + $(this).val() + " : ");
		});

		$('.zzimbtn').on('click', function(){
			$('#myModal2').modal('show');
			});
		
			$('#closebtn').on('click', function(){
			$('#myModal2').modal('hide');
			});



		
					

		


		
	</script>

	<!--                     추가                         -->
	<%@ include file="productQna.jsp"%>



</body>
</html>