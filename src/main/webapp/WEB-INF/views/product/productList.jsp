<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
.img {
	position: relative;
	background-image:
		url('${pageContext.request.contextPath}/upload/product/${file[i.index]}');
	height: 194px;
	width: 194px;
	background-size: cover;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.img .content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 1rem;
	color: white;
	z-index: 2;
	text-align: center;
}
</style>

</head>
<body style="background-color: #fafafd;">
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<!-- 전체시작 -->
	<div style="height: 88px;">

		<div style="width: 1024px; margin-left: 440px;">

			<div style="width: 1024px; height: 90px;">
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
			<div style="width: 1024px;">
				<font style="color: #ff5d4a; font-size: 15px; font-weight: 600;">${list[0].sell_kind}</font>
				<font style="font-size: 15px; font-weight: 600">의 추천상품</font>
			</div>
			<br>

			<c:forEach items="${list}" var="vo" varStatus="i">
				<div style="float: left; margin-left: 9px; margin-bottom: 129px;">
					<div class="qqq" title="${vo.sell_num}"
						style="height: 194px; width: 194px; cursor: pointer;"
						onclick="location.href='./productSelect?sell_num=${vo.sell_num}'">


						<%-- 						<img style="height: 194px; width: 194px; cursor: pointer;" alt=""
							src="${pageContext.request.contextPath}/upload/product/${file[i.index]}"> --%>

						<c:if test="${vo.sell_status ne 0}">
							<div class="img">
								<div class="content">
									<h5 style="margin-bottom: 30px;">예약완료</h5>
								</div>
								<div class="img-cover"></div>
							</div>

						</c:if>
						<c:if test="${vo.sell_status eq 0 }">
							<img class="img"
								style="height: 194px; width: 194px; cursor: pointer;" alt=""
								src="${pageContext.request.contextPath}/upload/product/${file[i.index]}">
						</c:if>


						<div style="width: 194px; background-color: white;">
							<div style="height: 80px;">
								<div>
									<br> <font
										style="font-size: 14px; font-weight: 700; margin-left: 8px;">${vo.sell_product}</font>
								</div>
								<div
									style="text-align: left;; line-height: 40px; margin-left: 8px;">
									<font style="font-size: 18px; font-weight: bold;">${vo.sell_price}</font>
									<font style="font-weight: bold;">원</font>
								</div>
							</div>
							<div
								style="height: 40px; border-top: solid 1px #e4e4e4; text-align: left; line-height: 40px;">
								<img
									style="margin-left: 8px; width: 16px; height: 20px; margin-bottom: 3px;"
									alt=""
									src="${pageContext.request.contextPath}/resources/images/ad_logo.png">
								<font style="font-weight: 600; font-size: 12px; color: gray;">${vo.mem_address}</font>
							</div>

						</div>

					</div>
				</div>

			</c:forEach>

			<div style="width: 1024px; height: 40px; float: left;">
				<ul class="pagination">
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


		</div>

	</div>
	<!-- 전체끝 -->



	<script type="text/javascript">
		$(".qqq").click(function() {
			var sell_num = $(this).prop("title");
			var myCookie = getCookie("recentSearch");
			alert(myCookie);
			if (myCookie == null) {
				setCookie("recentSearch", sell_num, 1)
			} else {
				sell_num += "/" + myCookie;
				setCookie("recentSearch", sell_num, 1)
			}
		})

		function setCookie(key, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = key + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";"
		}
		function getCookie(cname) {
			var name = cname + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var ca = decodedCookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return null;
		}
	</script>


</body>
</html>