<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 업데이트 - 우주장터</title>
<style type="text/css">
.imagePreview {
	width: 180px;
	height: 180px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}

.imagePreview2 {
	width: 180px;
	height: 180px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}
.pkind {
	background-color: white;
}
.pkind:hover {
	background-color: #e6dffe;
}
</style>

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<div style="width: 1024px; margin-left: 440px; margin-top:50px;">
	<form action="productUpdate" method="post" enctype="multipart/form-data">

		<!-- <a id="sellimg"><img src="${pageContext.request.contextPath}/resources/images/showimage.png"></a>
		<div class="form-group" id="f"></div> -->

<!-- 		<div class="imagePreview"></div>
		
		<input id="files" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img" /> 
		
		<div class="imagePreview2"></div>
		
		<input id="files2" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img" />  -->
		
				<input type="hidden" name="mem_storeNum" value="${vvo.mem_storeNum}" id="mem_storeNum"> 
		<input type="hidden" name="sell_num" value="${vvo.sell_num}" id="sell_Num"> 
		
		<div style="width: 168px;height:113px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4; ">
		<font style="font-size: 18px;font-weight: 900;">제목</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>

		<div style="width: 856px;height:113px; float: left;border-top:solid 1px #dcdbe4;border-top:solid 1px #dcdbe4;">
		<input style="margin-top: 32px;width: 856px;height: 48px;" type="text" name="sell_product" class="form-control" id="sell_product"
		value="${vvo.sell_product}">
		</div>
		
		<div style="width: 168px;height:250px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4;">
		<font style="font-size: 18px;font-weight: 900;">카테고리</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>
		
		<div style="width: 856px; float: left;border-top:solid 1px #dcdbe4;">
		<br>
		<div style="overflow-y: scroll; width: 300px; height: 200px;font-size: 15px;font-weight: 400;border: solid 1px #e4e4e4;">

				<button type="button" class="pkind" value="패션잡화" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 170px;">패션잡화</font></button>
				<button type="button" class="pkind" value="여성의류" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 170px;">여성의류</font></button>
				<button type="button" class="pkind" value="남성의류" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 170px;">남성의류</font></button>
				<button type="button" class="pkind" value="디지털/가전" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 152px;">디지털/가전</font></button>
				<button type="button" class="pkind" value="스타굿즈" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 170px;">스타굿즈</font></button>
				<button type="button" class="pkind" value="스포츠/레저" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 152px;">스포츠/레저</font></button>
				<button type="button" class="pkind" value="뷰티/미용" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 166px;">뷰티/미용</font></button>
				<button type="button" class="pkind" value="기타" style="width: 280px;height: 40px;outline: 0;border: 0px;">
				<font style="margin-right: 200px;">기타</font></button>

		</div>
		<font style="font-size: 15px;color: #5c2392;font-weight: 400;">선택한 카테고리 : </font>
		<input type="text" id="sell_kind" name="sell_kind" readonly="readonly" 
		style="height: 70px;font-size: 15px;font-weight: 900;color: #5c2392;outline: 0;border: 0px;"
		value="${vvo.sell_kind}">
		</div>
		<div style="width: 168px;height:113px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4;">
		<font style="font-size: 18px;font-weight: 900;">가격</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>
		
		<div style="width: 856px;height:113px; float: left;border-top:solid 1px #dcdbe4;">
		<input style="margin-top: 32px;width: 240px;height: 48px;float: left;" class="form-control" type="text" name="sell_price" id="sell_price"
		value="${vvo.sell_price}">
		<font style="text-align: center;line-height: 113px;font-size: 18px;font-weight: 900;">원</font> 
		</div>
		
		<div style="width: 168px;height:250px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4;">
		<font style="font-size: 18px;font-weight: 900;">설명</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>
		
		<div style="width: 856px;height:250px; float: left;border-top:solid 1px #dcdbe4;">
		<textarea style="margin-top: 32px;width: 856px;height: 160px;" name="sell_info" class="form-control" id="sell_info" name="sell_info"
		>${vvo.sell_info}</textarea>
		</div>
		
		<div style="width: 168px;height:113px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4;border-bottom:solid 1px #dcdbe4;">
		<font style="font-size: 18px;font-weight: 900;">연관태그</font> 
		</div>
		
		<div style="width: 856px;height:113px; float: left;border-top:solid 1px #dcdbe4;border-bottom:solid 1px #dcdbe4;"> 
		<input style="margin-top: 32px;width: 856px;height: 48px;" class="form-control" type="text" name="sell_tag" id="sell_tag"
		value="${vvo.sell_tag}"> 
		</div>

			<div  style="height: 50px;display: inline-block;">
			<button style="margin-left: 400px;margin-top: 16px; width: 160px;height: 56px;border: 0px;
			background-image: url('${pageContext.request.contextPath}/resources/images/regi_logo.png');" type="submit" class="btn btn-default" id="productNew">
			</button>


		</div>
		

	</form>

		</div>
		<div style="background-color: white;"></div>

			<% 
			String strReferer = request.getHeader("referer");
			request.getMethod().equals("GET");
			if(strReferer == null){ 
			%>
			<script type="text/javascript">
			document.location.href="http://localhost:8080/error/error";

			</script>
			<%
			return;
			}
			%>
			

		
<c:import url="../template/footer.jsp"></c:import>




	<script type="text/javascript">
		$(".kind").click(function() {
			$("#sell_kind").val($(this).val());
		});

		//$("#sellimg")
				//.click(
						//function() {
							//$("#f").append('<div class="imagePreview"></div> <input id="files" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img" /> ')});

		$(function() {

			$("#files").on( "change", function() {
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

		$(function() {

			$("#files2").on( "change", function() {
						var files = !!this.files ? this.files : [];
						if (!files.length || !window.FileReader)
							return;
						if (/^image/.test(files[0].type)) {
							var reader = new FileReader();
							reader.readAsDataURL(files[0]);
							reader.onloadend = function() {
								$('.imagePreview2').css("background-image",
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

