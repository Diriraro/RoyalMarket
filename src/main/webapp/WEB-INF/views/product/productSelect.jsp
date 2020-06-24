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
	<c:import url="../template/nav.jsp"></c:import>
	<!-------------------------------------------------------------------------------------------  -->
	
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 428px;">

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


	<h3>Title : ${vo.sell_product}</h3>
	<h3>price : ${vo.sell_price}</h3>
	<h3>info : ${vo.sell_info}</h3>
	<h3>hit : ${vo.sell_hit}</h3>
	<h3>date : ${vo.sell_date}</h3>
	<h3>address : ${mvo.mem_address}</h3>

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