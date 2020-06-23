<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>

	<h1>코멘트페이지 다른사람 페이지 StoreQna</h1>
	
	
	<h2>${mem_storeName} 의 페이지</h2>
	

	<c:import url="../template/shopmain2.jsp"></c:import>

	<div class="container">
		<div
			style="border: 1px solid blue; width: 1024px; min-height: 34 0px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
				<button class="btn btn-info">
					<a href="./myshop2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">상품</a>
				</button>

				<button class="btn btn-danger">
					<a href="./comments2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">상점문의x</a>
				</button>

				<button class="btn btn-info">
					<a href="./favorites2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}"> 찜x</a>
				</button>

				<button class="btn btn-info">
					<a href="./reviews2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">상점후기x</a>
				</button>

				<button class="btn btn-info">
					<a href="./followings2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">팔로잉x</a>
				</button>

				<button class="btn btn-info">
					<a href="./followers2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">팔로워x</a>
				</button>

			</div>


			<div>
				<h2>상점문의</h2>

				<%--  <c:import url="../template/comentsForm.jsp"></c:import>  --%>
				<div class="container"> <!-- 폼태그  -->
					<!-- 다른사람 페이지에 접속하면 본인 member = ids 에 값들 꺼내서 밸류에 집어넣기  -->
			<form action="./comments2" id="form" name=from method="post">
						
			<div class="form-group">
				<label for="sq_contents">Contents:</label>
				<textarea rows="" cols="" class="form-control" id="sq_contents" name="sq_contents" style="width:900px; height: 150px; "></textarea>
			</div>
			
			<!-- 추가한거  -->
			<div class="form-group">
				<input type="text" class="form-control" style="width: 342px;"
					id="sq_storeName"  value="${msname}"
					placeholder="Enter writer" name="sq_storeName">
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" style="width: 342px;"
					id="mem_storeNum"  value="${msnum }"
					placeholder="Enter writer" name="mem_storeNum">
			</div>
			
			<!--  추가한거. -->
			
			
			<input type="button" id="btn" class="btn btn-default" value="Write">
			</form>
			

				</div>

				<div style="border: 1px solid red;">
					<c:forEach items="${list}" var="vo">
					<c:if test="${mem_storeName eq vo.sq_storeName }">
						<a>내글</a>
					</c:if>
						<tr>
							<%-- <td>${vo.sq_num}</td>
							<td>${vo.mem_storeNum }	</td> --%>
							<td>${vo.sq_storeName}</td>
							<br>
							<td>${vo.sq_contents}</td>
							<td>${vo.sq_regDate}</td>
						</tr>
						
							<c:if test="${ids eq vo.sq_storeName }">
							
							<a href="./setDelete?sq_num=${vo.sq_num}"
						class="btn btn-danger pull-right"><span
						class="	glyphicon glyphicon-remove-sign"></span>Delete</a>
							</c:if>
						
						<br>
						<br>
					</c:forEach>
				</div>

			</div>

		</div>
		<!-- 버튼, 내용 끝  -->

	</div>
	<!-- 컨테이너 끝  -->


	<div>
		<h1>footer</h1>
	</div>
	
	<script type="text/javascript">
	$("#btn").click(function() {
		
			$("#form").submit();

	

	});

	</script>
	
</body>
</html>