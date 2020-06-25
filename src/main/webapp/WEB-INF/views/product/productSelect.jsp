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
		<br> <br>
	</div>
	<br>
	<!-----------------------------------사진---------------------------------  -->
	<div>
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

	<div style="display:inline-block; margin-left: 50px; width: 545px;">
		<font style="font-size: 25px; font-weight: 800;">${vo.sell_product}</font>
		<br>
		<br> <font style="font-size: 45px">${vo.sell_price}</font><font
			style="font-size: 26px;">원</font>
		<hr>
		<img style="width: 20px; height: 20px" alt=""
			src="${pageContext.request.contextPath}/resources/images/zzim_logo.png">
		<font style="color: #cccccc; font-weight: 600; font-size: 15px;">&nbsp;0</font>
		<font style="color: #cccccc;">ㅣ</font> <img
			style="width: 24px; height: 16px" alt=""
			src="${pageContext.request.contextPath}/resources/images/hit_logo.png">
		<font style="color: #cccccc; font-weight: 600; font-size: 15px;">&nbsp;${vo.sell_hit}</font>
		<font style="color: #cccccc;">ㅣ</font> <img
			style="width: 20px; height: 20px" alt=""
			src="${pageContext.request.contextPath}/resources/images/date_logo.png">
		<font style="color: #cccccc; font-weight: 600; font-size: 15px;">&nbsp;${vo.sell_date}</font>
		<br><br><br><br><br><br> 
		<font
			style="color: #b1b1b1; font-size: 15px; font-weight: 600;">·&nbsp;판매자
			지역&nbsp;&nbsp;</font> <img
			style="width: 16px; height: 20px; margin-bottom: 3px;" alt=""
			src="${pageContext.request.contextPath}/resources/images/ad_logo.png">
		<font style="font-weight: 600; font-size: 15px;">&nbsp;${mvo.mem_address}</font>
		<br><br><br><br>
		<a><img style="margin-top: 7px;cursor: pointer;" alt="" src="${pageContext.request.contextPath}/resources/images/zzim_button.png"></a>
		<a><img style="margin-top: 7px;cursor: pointer;" alt="" src="${pageContext.request.contextPath}/resources/images/phone_button.png"></a>
		<a><img style="margin-top: 7px;cursor: pointer;" alt="" src="${pageContext.request.contextPath}/resources/images/buy_button.png"></a>
	</div>
	</div>
	<div>asdas</div>
	
		<div  >
	<h3>info : ${vo.sell_info}</h3>
	</div>


	
	<div class="panel panel-info"
		style="height: 100px; width: 80px; cursor: pointer; background-color: black;"
		onclick="location.href='./productUpdate?sell_num=${vo.sell_num}'"></div>

	<script type="text/javascript">
		$(document).on('click', '.reply', function() {
			alert("asdasd");
			$("#pq_contents").val("@" + $(this).val() + " : ");
		});
	</script>


	<!--  댓글  -->
	<div class="container">
		<label for="content">comment</label>
		<form name="qnaInsertForm">
			<div class="input-group">
				<input type="hidden" name="sell_num" value="${vo.sell_num}" /> <input
					type="hidden" name="pq_storeNum" value="${memberVO.mem_storeNum}" />
				<input type="hidden" id="pq_storeName" name="pq_storeName"
					value="${memberVO.mem_storeName}" /> <input type="text"
					class="form-control" id="pq_contents" name="pq_contents"
					placeholder="내용을 입력하세요."> <span class="input-group-btn">
					<button class="btn btn-default" type="button" name="qnaInsertBtn">등록</button>
				</span>
			</div>
		</form>
	</div>

	<div class="container">
		<div class="qnaList"></div>
	</div>




	<!--                     추가                         -->
	<%@ include file="productQna.jsp"%>


</body>
</html>