<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
td{
width: 220px;
font-size: large;
text-align: center;
font-weight: bold;

}

.td1{
border-bottom: 2px solid white;
border-left: 2px solid black;
border-right: 2px solid black;
border-top: 2px solid black;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
</head>
<body>
<c:import url="../template/woozoo_nav.jsp"></c:import>
	<c:import url="../template/shopmain.jsp"></c:import>

	<div class="container">
		<div
			style="border: 1px solid blue; width: 1024px; min-height: 340px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
			<!-- 이동버튼  -->
			<hr>
			<table border="1" style="height: 80px;">
				<tr>
				<td bgcolor="#f2f2f2"><a href="./myshop?mem_storeNum=${mem_storeNum}">상품&nbsp;&nbsp;   ${prodco}</a></td>
				<td class="td1"><a href="./comments?mem_storeNum=${mem_storeNum}">상점문의 &nbsp;&nbsp;${coco}</a></td>
				<c:if test="${msnum eq mem_storeNum }">
				<td bgcolor="#f2f2f2">
					<a href="./favorites?mem_storeNum=${mem_storeNum}"> 찜&nbsp;&nbsp; ${zico}</a>
				</td>
				</c:if>
				<td bgcolor="#f2f2f2"><a href="./reviews?mem_storeNum=${mem_storeNum}">상점후기&nbsp;&nbsp;  ${reco }</a></td>
				<td bgcolor="#f2f2f2"> <a href="./followings?mem_storeNum=${mem_storeNum}">팔로잉&nbsp;&nbsp;  ${giveco}</a></td>
				<td bgcolor="#f2f2f2"><a href="./followers?mem_storeNum=${mem_storeNum}">팔로워 &nbsp;&nbsp;  ${takeco} </a></td>
				</tr>
			
			</table>
			<!--  -->
			</div>




			<div>
				<h2>상점문의</h2>

				<%--  <c:import url="../template/comentsForm.jsp"></c:import>  --%>
				<div class="container"> <!-- 폼태그  -->

			<form action="./comments" id="form" name=from method="post">
						
			<div class="form-group">
				<label for="sq_contents">Contents:</label>
				<textarea rows="" cols="" class="form-control" id="sq_contents" name="sq_contents" placeholder="문의사항은 30자 이내에 작성해 주세요." style="width:990px; height: 100px;resize: none; "></textarea>
				<span style="color:#aaa;" id="counter">(0 / 최대 30자)</span>
			</div>
			
			<!--  작성자의 번호는 로그인한사람의 -->
			<div class="form-group">
				<input type="hidden" class="form-control" style="width: 342px;"
					id="sq_storeNum"  value="${msnum}"
					placeholder="Enter writer" name="sq_storeNum">
			</div>
			
			<!-- 답글 작성하는곳의 번호는 파라미터 받아와서.  -->
			<div class="form-group">
				<input type="hidden" class="form-control" style="width: 342px;"
					id="mem_storeNum"  value="${mem_storeNum}"
					placeholder="Enter writer" name="mem_storeNum">
			</div>
			<!--  추가한거. -->
			<input type="button" id="btn" class="btn btn-default" value="Write">
			</form>

				</div>

				<div style="border: 1px solid red; margin-top: 30px;">
					<c:forEach items="${colist}" var="vo">
					
					<%-- <c:if test="${msnum eq vo.sq_storeNum }">
						<a class="btn btn-info">내글</a><br>
					</c:if> --%>
				
					
					<div style=" border: 1px solid; height: 100px;  background-color: #f0f0f5">
						<tr>
							<%-- <td>${vo.sq_num}</td>
							<td>${vo.mem_storeNum }	</td> --%>
							<%-- <td>${vo.sq_storeNum}작성자번호</td> --%>
							<td> <a href="./myshop?mem_storeNum=${vo.sq_storeNum}" style="font-size: large;">${vo.mem_storeName } </a>
							  <a >
       						  <span class = "badge pull-right">${vo.sq_regDate}</span>
    						  </a>
							</td>
						
							<br>
							<td>${vo.sq_contents}</td>
							<br>
							<td>
						<button class="dae" title="${vo.mem_storeName }">댓글작성</button>	
							
							
					<!--본인이 작성한 댓글 또는  상점 주인만 삭제하는 쿼리 작성  -->
						<c:if test="${msnum eq vo.sq_storeNum or msnum eq vo.mem_storeNum}">
							<a href="./setDelete?sq_num=${vo.sq_num}&mem_storeNum=${vo.mem_storeNum}"
						class="btn btn-danger btn-sm"><span
						class="	glyphicon glyphicon-remove-sign"></span>Delete</a>
						</c:if>
							
							</td>
							 
						</tr>
				
					</div>
					
					
						
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
		var content = $('#sq_contents').val();
		console.log(content);
		console.log(content.length);
		
		 	if (content.length >0 && content.length<31) {
				console.log("적정값");
				$("#form").submit();
				
			} else {
				alert("규격에 맞게 작성하세요");
				 event.preventDefault();//이벤트 막기
			} 

	});


	$('#sq_contents').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 최대 30자)");    //글자수 실시간 카운팅

	    if (content.length > 30){
	        alert("최대 30자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 30));
	        $('#counter').html("(30 / 최대 30자)");
	    }
	});



	$('.dae').click(function(){
		var name = $(this).attr('title');
		console.log(name);

		
		$("#sq_contents").val("@"+name+"::");
		
		var content = $("#sq_contents").val();
		console.log(content);
		$("#sq_contents").focus();
		
		});


	

	</script>
	
</body>
</html>