<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.imagePreview {
	width: 180px;
	height: 180px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}
</style>

<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>
	<form action="productNew" method="post" enctype="multipart/form-data">

		<!-- <a id="sellimg"><img src="${pageContext.request.contextPath}/resources/images/showimage.png"></a>
		<div class="form-group" id="f"></div> -->

		<div class="imagePreview"></div>
		
		<input id="files" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img" /> 
			
		<input type="hidden" name="mem_storeNum" value="${member.mem_storeNum}" id="mem_storeNum"> 

		<div class="form-group">
			<label for="sell_product">제목</label> <input type="text"
				name="sell_product" class="form-control" id="sell_product">
		</div>

		<div style="overflow-y: scroll; width: 300px; height: 300px;">
			카테고리
			<ul class="allKind">
				<li><input type="button" class="kind" value="패션잡화"></li>
				<li><input type="button" class="kind" value="여성의류"></li>
				<li><input type="button" class="kind" value="남성의류"></li>
				<li><input type="button" class="kind" value="디지털/가전"></li>
				<li><input type="button" class="kind" value="도서/티켓/취미/애완"></li>
				<li><input type="button" class="kind" value="생활/문구/가구/식품"></li>
				<li><input type="button" class="kind" value="유아동/출산"></li>
				<li><input type="button" class="kind" value="스타굿즈"></li>
				<li><input type="button" class="kind" value="스포츠/레저"></li>
				<li><input type="button" class="kind" value="뷰티/미용"></li>
				<li><input type="button" class="kind" value="기타"></li>
				<li><input type="button" class="kind" value="차량/오토바이"></li>
				<li><input type="button" class="kind" value="구인구직"></li>
				<li><input type="button" class="kind" value="재능"></li>
				<li><input type="button" class="kind" value="번개나눔"></li>
				<li><input type="button" class="kind" value="지역 서비스"></li>
				<li><input type="button" class="kind" value="커뮤니티"></li>
				<li><input type="button" class="kind" value="원룸/함께살아요"></li>

			</ul>
		</div>
		선택한 카테고리 : <input type="text" id="sell_kind" value="">
		<div class="form-group">
			<div>
				상태<span>*</span>
			</div>
			<div>
				<div>
					<label for="중고상품"> <input id="중고상품" type="radio" value="0"
						checked="checked" onclick="doOpenCheck(this);" name="condition">중고상품
					</label> <label for="새상품" class="sc-hBbWxd ldFYyE"> <input id="새상품"
						type="radio" value="0" onclick="doOpenCheck(this);"
						name="condition">새상품
					</label>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div>
				교환<span>*</span>
			</div>
			<div>
				<div>
					<label for="교환불가"> <input id="교환불가" type="radio" value="0"
						checked="checked" onclick="doOpenCheck(this);" name="exchange">교환불가
					</label> <label for="교환가능" class="sc-hBbWxd ldFYyE"> <input
						id="교환가능" type="radio" value="0" onclick="doOpenCheck(this);"
						name="exchange">교환가능
					</label>
				</div>
			</div>
		</div>
		가격 <input type="text" id="sell_price">원 <br> 
		
		<label for="sell_info">설명</label>
		<textarea name="sell_info" class="form-control" id="sell_info"
			name="sell_info">
			</textarea>
			
		태그 <input type="text" id="sell_tag"> <br> 


		<button type="submit" class="btn btn-default">Submit</button>
	</form>


	<script type="text/javascript">
		$(".kind").click(function() {
			$("#sell_kind").val($(this).val());
		});

		//$("#sellimg")
				//.click(
						//function() {
							//$("#f").append('<div class="imagePreview"></div> <input id="files" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img" /> ')});

		$(function() {

			$("#files").on(
					"change",
					function() {
						var files = !!this.files ? this.files : [];
						if (!files.length || !window.FileReader)
							return;
						if (/^image/.test(files[0].type)) {
							var reader = new FileReader();
							reader.readAsDataURL(files[0]);
							reader.onloadend = function() {
								$('.imagePreview').css("background-image",
										"url(" + this.result + ")");
							};
						}
					});
		});

		function doOpenCheck(chk) {
			var obj = document.getElementsByName("condition");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != chk) {
					obj[i].checked = false;
				}
			}
		}

		function doOpenCheck(ch) {
			var obj = document.getElementsByName("exchange");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != chk) {
					obj[i].checked = false;
				}
			}
		}
	</script>


</body>
</html>

