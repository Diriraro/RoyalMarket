<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.fo1 {
	font-size: 17px;
	color: black;
}

.img {
	position: relative;
	background-size: cover;
}

.img-cover {
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

.lis2 {
	display: none;
}

/* 글자수 제한  */
.fos2 {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 270px;
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
	<h2></h2>
	<c:import url="../template/shopmain.jsp"></c:import>

	<c:if test="${mdata.mem_access ne 1}">

		<div class="container">
			<div
				style="border: 1px solid black; width: 1024px; min-height: 340px; border-color: rgba(0, 0, 0, 0.25);">
				<div>
					<hr>
					<table border="1"
						style="height: 80px; border-color: rgba(0, 0, 0, 0.25);">
						<tr>
							<td bgcolor="#f2f2f2"><a class="tds"
								href="./myshop?mem_storeNum=${mem_storeNum}">상품&nbsp;&nbsp;
									${prodco}</a></td>
							<td bgcolor="#f2f2f2"><a class="tds"
								href="./comments?mem_storeNum=${mem_storeNum}">상점문의
									&nbsp;&nbsp;${coco}</a></td>
							<c:if test="${msnum eq mem_storeNum }">
								<td class="td1"><a class="tds"
									href="./favorites?mem_storeNum=${mem_storeNum}">
										찜&nbsp;&nbsp; ${zico}</a></td>
							</c:if>
							<td bgcolor="#f2f2f2"><a class="tds"
								href="./reviews?mem_storeNum=${mem_storeNum}">상점후기&nbsp;&nbsp;
									${reco }</a></td>
							<td bgcolor="#f2f2f2"><a class="tds"
								href="./followings?mem_storeNum=${mem_storeNum}">팔로잉&nbsp;&nbsp;
									${giveco}</a></td>
							<td bgcolor="#f2f2f2"><a class="tds"
								href="./followers?mem_storeNum=${mem_storeNum}">팔로워
									&nbsp;&nbsp; ${takeco} </a></td>
						</tr>

					</table>
					<!--  -->
				</div>


				<div>
					<h2>
						&nbsp;&nbsp;찜&nbsp;<a id="redd">${zico}</a>
					</h2>
					<hr>

					<div
						style="border: 1px solid white; min-height: 340px; overflow: auto;">
						<c:forEach items="${zilist }" var="vo">
							<div class="lis2"
								style="border: 1px solid gray; width: 480px; height: 140px; float: left; margin-left: 2%; margin-top: 2%; margin-bottom: 2%; border-color: rgba(0, 0, 0, 0.25);">

								<!-- 이미지 div 2 판매완료  -->
								<c:if test="${vo.sell_status eq 2 }">

									<div
										style="border: 0px solid; width: 34%; height: 100%; float: left; background-color: #f0f0f5"
										class="pp2" title="${vo.sell_num }">
										<div class="img"
											style="background-image: url('${pageContext.request.contextPath}/upload/product/${vo.file_name}'); width:100% ; height : 100%;">
											<div class="content">
												<h5 style="margin-bottom: 30px;">
													판매 <br> 완료
												</h5>
											</div>
											<div class="img-cover"></div>
										</div>

									</div>

								</c:if>
								<!--  status 2아닐시 판매중 , 예약중 -->
								<c:if test="${vo.sell_status ne 2 }">

									<div
										style="border: 0px solid; width: 34%; height: 100%; float: left; background-color: white;"
										class="pp2" title="${vo.sell_num }">

										<div class="img"
											style="background-image: url('${pageContext.request.contextPath}/upload/product/${vo.file_name}'); width:100% ; height : 100%; border:1px solid; border-color: rgba(0,0,0,0.25);">

										</div>

									</div>

								</c:if>
								<div
									style="border: 0px solid; width: 66%; height: 100%; float: left; background-color: #f2f2f2; font-size: 20px;">
									<button class="btn del" style="float: right;"
										title="${vo.zzim_num}">
										<a style="color: gray;"> <span
											class="glyphicon glyphicon-remove-sign"></span>
										</a>
									</button>


									<div style="border-top: 0px solid white; height: 40px;"
										class="pp2 fos2" title="${vo.sell_num }">
										<font
											style="color: #b1b1b1; font-size: 15px; font-weight: 600;">·&nbsp;상품명
											:&nbsp;&nbsp;</font> <a class="fo1">${vo.sell_product}</a>

									</div>

									<div style="border: 0px solid; height: 40px;" class="pp2"
										title="${vo.sell_num }">

										<font
											style="color: #b1b1b1; font-size: 15px; font-weight: 600;">·&nbsp;가격
											:&nbsp;&nbsp;</font> <a class="fo1" style="font-weight: bold;"><fmt:formatNumber> ${vo.sell_price } </fmt:formatNumber>
											원</a>
									</div>

									<div style="border: 0px solid; min-height: 40px;"
										class="pp2 fos2" title="${vo.sell_num }">

										<font
											style="color: #b1b1b1; font-size: 15px; font-weight: 600;">·&nbsp;지역&nbsp;&nbsp;</font>
										<img style="width: 16px; height: 20px; margin-bottom: 3px;"
											alt=""
											src="${pageContext.request.contextPath}/resources/images/ad_logo.png">
										<font style="font-weight: 600; font-size: 15px;">&nbsp;${vo.mem_address}</font>



									</div>
								</div>



							</div>
						</c:forEach>
					</div>
					<a class="btn btn-default pull-right " href="#" id="load">찜 더
						보기</a>

				</div>

			</div>

		</div>
	</c:if>

	<c:import url="../template/footer.jsp"></c:import>

</body>

<script type="text/javascript">
	$(".del").click(function() {
		var ss = $(this).attr("title");
		console.log(ss);
		if (confirm("찜목록에서 삭제하시겠습니까?") == true) { //확인

			location.href = "../product/zzimDelete?zzim_num=" + ss;
			console.log("지우기");
		} else { //취소
			console.log('살리기');
			return false;

		}
	});

	$(".pp2").click(function() {
		var title = $(this).attr("title");
		console.log(title);

		location.href = "../product/productSelect?sell_num=" + title;

	});

	$(function() {
		$(".lis2").slice(0, 4).show();
		$("#load").click(function(e) {
			e.preventDefault();

			if ($(".lis2:hidden").length == 0) {
				alert("마지막항목입니다.");
			}
			$(".lis2:hidden").slice(0, 4).show();
		});
	});
</script>
</html>