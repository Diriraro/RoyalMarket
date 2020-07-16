<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.lis2 {
	display: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
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
				<!-- 각자 페이지에 하나씩 생성  -->
				<div>
					<!-- 이동버튼  -->
					<hr>
					<table border="1"
						style="height: 80px; border-color: rgba(0, 0, 0, 0.25);">
						<tr>
							<td bgcolor="#f2f2f2"><a class="tds"
								href="./myshop?mem_storeNum=${mem_storeNum}">상품&nbsp;&nbsp;
									${prodco}</a></td>
							<td class="td1"><a class="tds"
								href="./comments?mem_storeNum=${mem_storeNum}">상점문의
									&nbsp;&nbsp;${coco}</a></td>
							<c:if test="${msnum eq mem_storeNum }">
								<td bgcolor="#f2f2f2"><a class="tds"
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
				<!-- 회원가입 안한사람은 테이블 보여주지 않음  -->
				<c:if test="${mdata.mem_storeNum ne null}">
					<div>
						<h2>
							&nbsp;&nbsp;상점문의&nbsp;<a id="redd">${coco}</a>
						</h2>
						<hr>
						<div class="container">

							<form action="./comments" id="form" name=from method="post">

								<div class="form-group">
									<label for="sq_contents">Contents:</label>
									<textarea rows="" cols="" class="form-control" id="sq_contents"
										name="sq_contents" placeholder="문의사항은 50자 이내에 작성해 주세요."
										style="width: 990px; height: 100px; resize: none; box-shadow: 1px 1px 1px 1px gray;"></textarea>
									<span style="color: #aaa;" id="counter">(0 / 최대 50자)</span>
								</div>

								<div class="form-group">
									<input type="hidden" class="form-control" style="width: 342px;"
										id="sq_storeNum" value="${msnum}" placeholder="Enter writer"
										name="sq_storeNum">
								</div>


								<div class="form-group">
									<input type="hidden" class="form-control" style="width: 342px;"
										id="mem_storeNum" value="${mem_storeNum}"
										placeholder="Enter writer" name="mem_storeNum">
								</div>

								<input type="button" id="btn" class="btn btn-default"
									value="Write" style="box-shadow: 1px 1px 1px 1px gray;">
							</form>
							<hr>
						</div>
						
						<c:if test="${coco eq 0 }">
							<p style="color: gray;">등록된 문의가 없습니다. 첫 상품문의를 등록해보세요!</p>
							</c:if>
						
						
						<div style="border: 1px solid white; margin-top: 30px;">
							<c:forEach items="${colist}" var="vo">


								<div class="lis2"
									style="border-top: 1px solid gray; border-bottom: 1px solid gray; min-height: 120px; background-color: white; border-color: rgba(0, 0, 0, 0.25); overflow: auto; margin-bottom: 10px;">
									<tr>

										<td><a href="./myshop?mem_storeNum=${vo.sq_storeNum}"
											style="font-size: 15px; color: #999999;">&nbsp;
												${vo.mem_storeName } </a> <a> <span
												class="badge pull-right">${vo.sq_regDate}</span>
										</a></td>

										<br>
										<td>
											<p style="font-size: 19px;">&nbsp;${vo.sq_contents}</p>
										</td>
										<br>
										<td>&nbsp;
											<button class="dae" title="${vo.mem_storeName }">댓글작성</button>

											<!--본인이 작성한 또는 상점 주인만 글삭제 --> <c:if
												test="${msnum eq vo.sq_storeNum or msnum eq vo.mem_storeNum}">
						
							&nbsp;<a
													href="./setDelete?sq_num=${vo.sq_num}&mem_storeNum=${vo.mem_storeNum}"
													class="btn btn-default btn-sm"> <span
													class="glyphicon glyphicon-remove-sign"></span>Delete
												</a>
											</c:if>
										</td>
									</tr>
								</div>
							</c:forEach>
							
							<c:if test="${coco ne 0}">
							<a class="btn btn-default pull-right" href="#" id="load">문의 더
								보기</a>
							</c:if>
								
						</div>

					</div>
				</c:if>
			</div>

		</div>
	</c:if>

	<script type="text/javascript">
		$("#btn").click(function() {
			var content = $('#sq_contents').val();
			console.log(content);
			console.log(content.length);

			if (content.length > 0 && content.length < 51) {
				console.log("적정값");
				$("#form").submit();

			} else {
				alert("규격에 맞게 작성하세요");
				event.preventDefault();//이벤트 막기
			}

		});

		$('#sq_contents').keyup(function(e) {
			var content = $(this).val();
			$('#counter').html("(" + content.length + " / 최대 50자)"); //글자수 실시간 카운팅

			if (content.length > 50) {
				alert("최대 30자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 50));
				$('#counter').html("(50 / 최대 50자)");
			}
		});

		$('.dae').click(function() {
			var name = $(this).attr('title');
			console.log(name);

			$("#sq_contents").val("@" + name + "::");

			var content = $("#sq_contents").val();
			console.log(content);
			$("#sq_contents").focus();

		});

		$(function() {
			$(".lis2").slice(0, 3).show();
			$("#load").click(function(e) {
				e.preventDefault();
				if ($(".lis2:hidden").length == 0) {
					alert("마지막항목입니다.");
					$("#load").hide();
				}
				$(".lis2:hidden").slice(0, 3).show();
			});
		});
	</script>
	<c:import url="../template/footer.jsp"></c:import>

</body>
</html>