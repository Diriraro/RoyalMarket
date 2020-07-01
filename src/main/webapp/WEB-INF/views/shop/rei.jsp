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
	width: 100px;
	height: 100px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}

.imagePreview2 {
	width: 100px;
	height: 100px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}

.imagePreview3 {
	width: 100px;
	height: 100px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}
</style>

<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
	
	<div style="width: 1024px; margin-left: 440px; margin-top:50px; height: 1315px;">
		
		<form action="rei" method="post" enctype="multipart/form-data">
		
		<hr style="border: solid 1.2px black;">
		<br>
		
		<div>
		<input type="hidden" value="${mem_storeNum }" name="mem_storeNum" id="mem_storeNum"><br>
		<input type="hidden" value="${sell_product}" name="sell_product" id="sell_product"><br>
		<input type="text" value="상품컨텐츠 입력 일단 test" name="re_context" id="re_context"><br>
		<input type="text" value="5" name="re_rate" id="re_rate"><br>
		<!-- 별점을 일단 5점  -->
		
		<!-- 리뷰남기는 상점이름 : 리뷰남기는 상점 번호  -->
		<input type="hidden" value="${member.mem_storeName}" name="re_storeName" id="re_storeName">
		<input type="hidden" value="${member.mem_storeNum}" name="re_storeNum" id="re_storeNum"><br>
		</div>
		
		
		<div style="width: 168px;height:380px; float: left;">
		<font style="font-size: 18px;font-weight: 900;">리뷰이미지</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>
		
		<div style="width: 856px;height:380px; float: left;">
		
		<div style="float: left;">
		<div class="imagePreview" style="background-image: url('${pageContext.request.contextPath}/resources/images/showimage_logo.png');"></div>
		<input id="files" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img"/> 
		</div>
		
		<div style="float: left;">
		<div class="imagePreview2" style="background-image: url('${pageContext.request.contextPath}/resources/images/showimage_logo.png');"></div>
 		<input id="files2" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img" />
 		</div>
 		
 		<div>
		<div class="imagePreview3" style="background-image: url('${pageContext.request.contextPath}/resources/images/showimage_logo.png');"></div>
 		<input id="files3" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img" />
 		</div>
 		<br>
		</div>
		<hr>
		
		<button style="margin-top: 16px; width: 160px;height: 56px;border: 0px;background-image: url('${pageContext.request.contextPath}/resources/images/regi_logo.png');" type="submit" class="btn btn-default" id="rei"></button>
		
		<a id="tests"> ccc</a>
	</form>

		</div>
		<div style="height: 88px; background-color: #fafafd;">
		
		</div>
	
		

	<script type="text/javascript">
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

		$(function() {

			$("#files3").on( "change", function() {
						var files = !!this.files ? this.files : [];
						if (!files.length || !window.FileReader)
							return;
						if (/^image/.test(files[0].type)) {
							var reader = new FileReader();
							reader.readAsDataURL(files[0]);
							reader.onloadend = function() {
								$('.imagePreview3').css("background-image",
										"url(" + this.result + ")");
							};
						}
					});
		});
		
		

		$("#rei").click(function() {
			var files = $("#files").val();
			var files2 = $("#files2").val();
	
			
			
			if (files==""&&files2=="") {
				alert("사진을 1개 이상 올려주세요");
				return false;				
			}else if (sell_price=="") {
				alert("상품정보에 대해 입력해주세요")
				return false;
			
			}
		});

		$("#tests").click(function() {
			var files = $("#files").val();
			var files2 = $("#files2").val();
			var t1 = $("#mem_storeNum").val();
			var t2 = $("#sell_product").val();
			var t3 = $("#re_context").val();
			var t4 = $("#re_rate").val();
			var t5 = $("#re_storeName").val();
			var t6 = $("#re_storeNum").val();

			
			console.log(t1);
			console.log(t2);
			console.log(t3);
			console.log(t4);
			console.log(t5);
			console.log(t6);
			
			
		});


	
	</script>


</body>
</html>

