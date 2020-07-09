<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
<link href="./css/test.css" rel="stylesheet" type="text/css">

<style type="text/css">

.img{
        position: relative;
        background-image: url('${pageContext.request.contextPath}/upload/product/${file[i.index]}');                                                               
        height: 194px;
        width: 194px;
        background-size: cover;
    }

    .img-cover{
       position: absolute;
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

</head>
<body style="background-color: #f9f9f9;">
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<!-- 전체시작 -->
	<div style="height: 88px;">

		<div style="width: 1024px; margin-left: 440px; ">
			
			<c:if test="${param.kind eq 'sk'}">
			<div class="c" style="width: 1024px; height: 90px;">
				<img
					style="width: 20px; height: 20px; float: left; margin-top: 30px;"
					alt="홈이미지"
					src="${pageContext.request.contextPath}/resources/images/home_logo.png">
				<font style="float: left; color: #4d555e; margin-top: 31px;">&nbsp;홈&nbsp;&nbsp;</font>
				<img
					style="width: 16px; height: 15px; float: left; margin-top: 33px;"
					alt="방향이미지"
					src="${pageContext.request.contextPath}/resources/images/arrow_logo2.png">
				<div style="float: left; margin-top: 24px;" class="dropdown">
					<button id="d" style="width: 164px; color: #4d555e"
						class="btn btn-default dropdown-toggle" type="button"
						data-toggle="dropdown">${list[0].sell_kind}

						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=패션잡화">패션잡화</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=여성의류">여성의류</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=남성의류">남성의류</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=디지털/가전">디지털/가전</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=생활/문구/가구/식품">생활/문구/가구/식품</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=유아동/출산">유아동/출산</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=스타굿즈">스타굿즈</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=스포츠/레저">스포츠/레저</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/productList?kind=sk&search=뷰티/미용">뷰티/미용</a></li>
					</ul>
				</div>

			</div>
			</c:if>
			
			<div style="width: 1024px;">
			<c:if test="${param.kind eq 'sk'}">
			<div class="cc">
			<font style="color: #ff5d4a; font-size: 15px;font-weight: 600;">${param.search}</font>
			<font style="font-size: 15px;font-weight: 600">의 추천상품</font>
			</div>
			</c:if>
			
			<c:if test="${param.kind eq 'sp'}">
			<br><br><br>
			<font style="color: #ff5d4a; font-size: 15px;font-weight: 600;">${param.search}</font>
			<font style="font-size: 15px;font-weight: 600">의 검색결과</font>
			</c:if>

			<c:if test="${empty list and param.kind eq 'sp'}">
			<br><br><br><br><br>
			<font style="color: #ff5d4a; font-size: 40px;font-weight: 600;">${param.search}</font>
			<font style="font-size: 20px;font-weight: 600">에 대한 검색결과가 없습니다</font>
			<hr>
			- 단어의 철자가 정확한지 확인해 보세요<br><br>
- 보다 일반적인 검색어로 다시 검색해 보세요<br><br>
- 검색어의 띄어쓰기를 다르게 해보세요<br><br>
- 유해/금지어가 아닌지 확인해주세요 
			</c:if>
			</div>
			<br>

			<c:forEach items="${list}" var="vo" varStatus="i">
				<div style="float: left; margin-left: 9px; margin-bottom: 129px;">
					<div class="qqq" style="height: 194px; width: 194px; cursor: pointer;"
						onclick="location.href='../product/productSelect?sell_num=${vo.sell_num}'">


<%-- 						<img style="height: 194px; width: 194px; cursor: pointer;" alt=""
							src="${pageContext.request.contextPath}/upload/product/${file[i.index]}"> --%>
							
 				<c:if test="${vo.sell_status ne 0}">
 				<div class="img">
					<div class="content">
						<h5 style="margin-bottom: 30px;">예약완료</h5>
					</div>
					<div class="img-cover"></div></div>

				</c:if>
				<c:if test="${vo.sell_status eq 0 }">
				<img class="img" style="height: 194px; width: 194px; cursor: pointer;" alt=""
							src="${pageContext.request.contextPath}/upload/product/${file[i.index]}">
				</c:if>

							
						<div style="width: 194px; background-color: white;border: 1px solid #e5e5e5">
							<div style="height: 80px;">
								<div ><br>
									<font style="font-size: 14px;font-weight: 700;margin-left: 8px;">${vo.sell_product}</font>
								</div>
								<div style="text-align: left;; line-height: 40px;margin-left: 8px;">
									<font style="font-size: 18px;font-weight: bold;">${vo.sell_price}</font>
									<font style="font-weight: bold;">원</font>
								</div>
							</div>
							<div style="height: 40px; border-top: solid 1px #e4e4e4;text-align: left;line-height: 40px;">
								<img style="margin-left: 8px;width: 16px; height: 20px; margin-bottom: 3px;" alt="" 
									src="${pageContext.request.contextPath}/resources/images/ad_logo.png">
								<font style="font-weight: 600; font-size: 12px;color: gray;">${vo.mem_address}</font>
							</div>

						</div>

					</div>
				</div>

			</c:forEach>
			
			<c:if test="${vo.sell_product ne null or param.kind eq 'sk'}">
			
			
		
			<div class="p" style="width: 1024px;height: 40px;float: left;">
				<ul class="pagination" >
					<c:if test="${pager.curBlock gt 1}">
						<li><a
							href="./productList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li><a
							href="./productList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<li><a
							href="./productList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
					</c:if>
				</ul>
			</div>
			</c:if>


		</div>

	</div>
	<!-- 전체끝 -->

		<div style="background-color: white;display: inline-block;height: 730px;"></div>



		
<c:import url="../template/footer.jsp"></c:import>

	<script type="text/javascript">





	</script>


</body>
</html>