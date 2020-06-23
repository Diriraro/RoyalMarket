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

	<c:import url="../template/shopmain.jsp"></c:import>

	<div class="container">
		<div
			style="border: 1px solid blue; width: 1024px; min-height: 340px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
				<button class="btn btn-info">
					<a href="./myshop">상품</a>
				</button>

				<button class="btn btn-danger">
					<a href="./comments">상점문의</a>
				</button>

				<button class="btn btn-info">
					<a href="./favorites"> 찜</a>
				</button>

				<button class="btn btn-info">
					<a href="./reviews">상점후기</a>
				</button>

				<button class="btn btn-info">
					<a href="./followings">팔로잉</a>
				</button>

				<button class="btn btn-info">
					<a href="./followers">팔로워</a>
				</button>

			</div>


			<div>
				<h2>상점문의</h2>

				<%--  <c:import url="../template/comentsForm.jsp"></c:import>  --%>
				<div class="container"> <!-- 폼태그  -->

			<form action="./comments" id="form" name=from method="post">
						
			<div class="form-group">
				<label for="sq_contents">Contents:</label>
				<textarea rows="" cols="" class="form-control" id="sq_contents" name="sq_contents" style="width:900px; height: 150px; "></textarea>
			</div>
			
			<!-- 추가한거  -->
			<div class="form-group">
				<input type="hidden" class="form-control" style="width: 342px;"
					id="sq_storeName"  value="${msname}"
					placeholder="Enter writer" name="sq_storeName">
			</div>
			
			<div class="form-group">
				<input type="hidden" class="form-control" style="width: 342px;"
					id="mem_storeNum"  value="${msnum}"
					placeholder="Enter writer" name="mem_storeNum">
			</div>
			
			<!--  추가한거. -->
			
			
			<input type="button" id="btn" class="btn btn-default" value="Write">
			</form>
			

				</div>

				<div style="border: 1px solid red;">
					<c:forEach items="${list}" var="vo">
					<c:if test="${msname eq vo.sq_storeName }">
						<a class="btn btn-info">내글</a>
					</c:if>
						<tr>
							<%-- <td>${vo.sq_num}</td>
							<td>${vo.mem_storeNum }	</td> --%>
							<td>${vo.sq_storeName}</td>
						
							<br>
							<td>${vo.sq_contents}</td>
							<td>${vo.sq_regDate}</td>
						</tr>
						
							
							
							<a href="./setDelete?sq_num=${vo.sq_num}"
						class="btn btn-danger pull-right"><span
						class="	glyphicon glyphicon-remove-sign"></span>Delete</a>
						
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