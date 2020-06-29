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
	width: 200px;
	height: 200px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}

.imagePreview2 {
	width: 200px;
	height: 200px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}

.imagePreview3 {
	width: 200px;
	height: 200px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}
</style>

<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	
	<div style="width: 1024px; margin-left: 440px; margin-top:50px; height: 1315px;">
		
		<form action="productNew" method="post" enctype="multipart/form-data">
		
		<font style="font-size: 25px;font-weight: bold;">기본정보</font>
		<font style="font-size: 15px;font-weight: lighter;color: #ff5d4a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*필수항목</font>
		<hr style="border: solid 1.2px black;">
		<br>
		<div style="width: 168px;height:380px; float: left;">
		<font style="font-size: 18px;font-weight: 900;">상품이미지</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
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
 		<font style="font-weight: bold; color: #4aadff;">* 상품 이미지는 640x640에 최적화 되어 있습니다.<br></font> 
		<font style="color: #4aadff;">- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br>
		- 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.<br>
		- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br>
		- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br>
		최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)</font>
 		
		</div>
		<hr>
		<input type="hidden" name="mem_storeNum" value="${member.mem_storeNum}" id="mem_storeNum"> 
		
		<div style="width: 168px;height:113px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4; ">
		<font style="font-size: 18px;font-weight: 900;">제목</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>

		<div style="width: 856px;height:113px; float: left;border-top:solid 1px #dcdbe4;border-top:solid 1px #dcdbe4;">
		<input style="margin-top: 32px;width: 856px;height: 48px;" type="text" name="sell_product" class="form-control" id="sell_product">
		</div>
		
		<div style="width: 168px;height:250px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4;">
		<font style="font-size: 18px;font-weight: 900;">카테고리</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>
		
		<div style="width: 856px;height:250px; float: left;border-top:solid 1px #dcdbe4;">
		<div style="overflow-y: scroll; width: 300px; height: 200px;">
			<ul class="allKind" ">
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
		선택한 카테고리 : <input type="text" id="sell_kind" name="sell_kind" value="" readonly="readonly">
		</div>
		<div style="width: 168px;height:113px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4;">
		<font style="font-size: 18px;font-weight: 900;">가격</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>
		
		<div style="width: 856px;height:113px; float: left;border-top:solid 1px #dcdbe4;">
		<input style="margin-top: 32px;width: 240px;height: 48px;float: left;" class="form-control" type="text" name="sell_price" id="sell_price">
		<font style="text-align: center;line-height: 113px;font-size: 18px;font-weight: 900;">원</font> 
		</div>
		
		<div style="width: 168px;height:250px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4;">
		<font style="font-size: 18px;font-weight: 900;">설명</font> <font style="color: #ff5d4a;font-size: 18px;">*</font>
		</div>
		
		<div style="width: 856px;height:250px; float: left;border-top:solid 1px #dcdbe4;">
		<textarea style="margin-top: 32px;width: 856px;height: 160px;" name="sell_info" class="form-control" id="sell_info" name="sell_info"></textarea>
		</div>
		
		<div style="width: 168px;height:113px; float: left;text-align: left;line-height: 113px;border-top:solid 1px #dcdbe4;border-bottom:solid 1px #dcdbe4;">
		<font style="font-size: 18px;font-weight: 900;">연관태그</font> 
		</div>
		
		<div style="width: 856px;height:113px; float: left;border-top:solid 1px #dcdbe4;border-bottom:solid 1px #dcdbe4;"> 
		<input style="margin-top: 32px;width: 856px;height: 48px;" class="form-control" type="text" name="sell_tag" id="sell_tag"> 
		</div>

	</form>

		</div>
		<div style="height: 88px; background-color: #fafafd;">
		<button style="margin-left: 1302px;margin-top: 16px; width: 160px;height: 56px;border: 0px;background-image: url('${pageContext.request.contextPath}/resources/images/regi_logo.png');" type="submit" class="btn btn-default" id="productNew"></button>
		</div>
		
	
	
	

		<!-- <a id="sellimg"><img src="${pageContext.request.contextPath}/resources/images/showimage.png"></a>
		<div class="form-group" id="f"></div> -->
<!-- 
		
		

			
		

		<div class="form-group">
			<label for="sell_product">제목</label>  -->

		
		<!-- <div class="form-group">
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
		</div> -->

		<!-- <div class="form-group">
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
		</div> -->
		

	<script type="text/javascript">
/* 	$("#black").mouseover(function() {
		$("#files").attr("type","file");
	}); */
	
		$(".kind").click(function() {
			$("#sell_kind").val($(this).val());
		});

	$(document).on('click', '#black', function() {
		$("input[name='files']").click();
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
		
		

		$("#productNew").click(function() {
			var files = $("#files").val();
			var files2 = $("#files2").val();
			var sell_product = $("#sell_product").val();
			var sell_kind = $("#sell_kind").val();
			var sell_price = $("#sell_price").val();
			var sell_info = $("#sell_info").val();
			var sell_tag = $("#sell_tag").val();
			
			if (files==""&&files2=="") {
				alert("사진을 1개 이상 올려주세요");
				return false;
			}else if (sell_product=="") {
				alert("제목을 입력해주세요")
				return false;
			}else if (sell_kind=="") {
				alert("카테고리를 설정해주세요")
				return false;
			}else if (sell_price=="") {
				alert("가격을 입력해주세요")
				return false;
			}else if (sell_price=="") {
				alert("상품정보에 대해 입력해주세요")
				return false;
			}else if (sell_price=="") {
				alert("태그를 입력해주세요")
				return false;
			}
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

