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
	
	<div style="width: 1024px; margin-left: 440px; margin-top:50px; height: 800px; ">
		
		<form action="rei" method="post" enctype="multipart/form-data">
		
		<h2> 리뷰작성 </h2>	
		<hr style="border: solid 1.2px black;">
		<div>
		<div class="form-group">
		<input type="hidden" value="${mem_storeNum }" name="mem_storeNum" id="mem_storeNum"><br>
		</div>
		<div class="form-group">
		<input type="hidden" value="${sell_product}" name="sell_product" id="sell_product"><br>
		</div>
		
	<!-- 	<div class="form-group">
				<input type="text" style="width: 500px; height: 200px;"  value="상품컨텐츠 입력 일단 test" name="re_context" id="re_context"><br>
		</div>	 -->
		
		<div class="form-group">
				<label for="re_context">Contents:</label>
				<textarea rows="" cols="" class="form-control" id="re_context" name="re_context" placeholder="리뷰사항은 100자 이내에 작성해 주세요." style="width:900px; height: 150px;pla "></textarea>
				<span style="color:#aaa;" id="counter">(0 / 최대 100자)</span>
			</div>
		
		
			
		
			<div class="form-group" style=" background-color: white">
				<label for="re_rate" style="font-size: 40px;"> 별점선택</label>
				<p></p>
				<hr style=" border-top: 3px #80d6ff solid;"> 
				<input type="radio" class="5p" name="re_rate" value="5" checked="checked"><!-- #e6f5ff -->
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="5p">5점</span>&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="4p" name="re_rate" value="4"><!-- #e6f5ff -->
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="4p">4점</span>&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="3p" name="re_rate" value="3">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="3p">3점</span>&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="2p" name="re_rate" value="2"><!-- #e6f5ff -->
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="2p">2점</span>&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="1p" name="re_rate" value="1">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="1p">1점</span>&nbsp;&nbsp;&nbsp;
				<hr>
			</div>	
		

		<!-- 별점을 선택해서 주기   -->
		
		
		
		<!-- 리뷰남기는 상점이름 : 리뷰남기는 상점 번호  -->
		<div class="form-group">
		<input type="hidden" value="${member.mem_storeName}" name="re_storeName" id="re_storeName">
		<input type="hidden" value="${member.mem_storeNum}" name="re_storeNum" id="re_storeNum"><br>
		</div>
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
 		
 		<div style="float: left;">
		<div class="imagePreview3" style="background-image: url('${pageContext.request.contextPath}/resources/images/showimage_logo.png');"></div>
 		<input id="files3" type="file" name="files" accept="image/jpg, image/jpeg, image/png" class="img" />
 		</div>
		<button style="margin-top: 36px; width: 160px;height: 56px;border: 0px;background-image: url('${pageContext.request.contextPath}/resources/images/regi_logo.png');" type="submit" class="btn btn-default btn pull-right" id="rei"></button>
		</div>
		<hr>
		
		
		<a id="tests"> ccc</a>
	</form>
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

			//
			
			var content = $('#re_context').val();
			console.log(content);
			console.log(content.length);
			 
			
			//
			if (files==""&&files2=="") {
				alert("사진을 1개 이상 올려주세요");
				return false;				
			}else if (content=="") {
				alert("리뷰사항을 적어주세요")
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

			var ss= document.querySelector('input[name="re_rate"]:checked').value;
			console.log(t1+"memsotrenum");
			console.log(t2+"sell-pro");
			console.log(t3+"recont");
			console.log(t4+"retate");
			console.log(t5+"restorename");
			console.log(t6+"resotrenum");
			console.log(ss+"선택한별점");

			
			
		});




		$('#re_context').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 100자)");    //글자수 실시간 카운팅

		    if (content.length > 100){
		        alert("최대 100자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 100));
		        $('#counter').html("(100 / 최대 100자)");
		    }
		});



		

	
	</script>


</body>
</html>

