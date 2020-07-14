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
/* 스타일 추가한거 */

.liBHhX:last-child {
	margin-bottom: 0px;
}

.liBHhX {
	height: 50px;
	box-shadow: rgb(76, 76, 76) 0px 2px 0px 0px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.wmnsE {
	width: 950px;
	box-shadow: rgba(0, 0, 0, 0.1) 60px 60px 60px 60px;
	background: rgb(255, 255, 255);
	padding: 70px;
}

.fSETiC {
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	padding: 100px 0px;
}

.MGjwe {
	min-width: 1236px;
}

body, input, textarea, select {
	-webkit-font-smoothing: antialiased;
	direction: ltr;
	text-align: left;
	color: rgb(33, 33, 33);
	letter-spacing: -0.5px;
	outline: 0px;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
}

body {
	background-color: rgb(249, 249, 249);
	font-size: 14px;
}

.tNFPZ {
	font-size: 30px;
}

.tNFPZ {
	font-size: 30px;
}

.fCwiRj {
	height: 50px;
	box-shadow: rgb(76, 76, 76) 0px 1px 0px 0px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.kVlvmu {
	width: 40px;
	display: flex;
	height: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	flex-shrink: 0;
}

.kThGwo {
	margin-bottom: 45px;
}

.biGiRA {
	margin-bottom: 45px;
	text-align: center;
}

#rq_num {
	width: 100px;
	height: 32px;
	flex-shrink: 0;
	text-align: center;
	color: rgb(255, 255, 255);
	font-size: 13px;
	border-radius: 2px;
	margin: 0px 7px 0px 180px;
	background: rgb(179, 179, 179);
}

#address {
	width: 100px;
	height: 32px;
	flex-shrink: 0;
	text-align: center;
	color: rgb(255, 255, 255);
	font-size: 13px;
	border-radius: 2px;
	margin: 0px 7px 0px 180px;
	background: rgb(179, 179, 179);
}

.gqqaLP {
	color: rgb(255, 255, 255);
	width: 100%;
	height: 56px;
	text-align: center;
	font-size: 18px;
	background: rgb(247, 47, 51);
	margin-top: 30px;
}

.error_msg {
	color: red;
	font-size: small;
	font-weight: bold;
}

#ViewTimer {
	margin: 0px 7px 0px 140px;
}

.ubhSQ {
	margin-bottom: 50px;
}

.llQLqu {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.ettlGe {
	margin-bottom: 20px;
}

.lerNRt {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.dDiVis {
	width: 24px;
	height: 24px;
	cursor: pointer;
	position: relative;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(238, 238, 238);
	border-image: initial;
	transition: border 0.2s ease 0s, background-color 0.2s ease 0s;
}

.kZHPTS {
	margin-left: 12px;
	-webkit-box-flex: 1;
	flex-grow: 1;
}

.ettlGe {
	margin-bottom: 20px;
}

.lerNRt {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.dDiVis {
	width: 24px;
	height: 24px;
	cursor: pointer;
	position: relative;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(238, 238, 238);
	border-image: initial;
	transition: border 0.2s ease 0s, background-color 0.2s ease 0s;
}

.kZHPTS {
	margin-left: 12px;
	-webkit-box-flex: 1;
	flex-grow: 1;
	font: Noto Sans CJK KR;
}

.bOqqay {
	color: rgb(247, 47, 51);
	margin-right: 5px;
}

.dDiVis::before {
	content: "";
	position: absolute;
	bottom: 5px;
	left: 2px;
	width: 8px;
	height: 14px;
	transform: rotate(40deg);
	transform-origin: 100% 100%;
	border-top: 2px solid transparent;
	border-left: 2px solid transparent;
	border-right: 2px solid rgb(204, 204, 204);
	border-bottom: 2px solid rgb(204, 204, 204);
}

.dDiVis::after {
	content: "";
	position: absolute;
	bottom: 5px;
	left: 2px;
	width: 0px;
	height: 0px;
	transform: rotate(40deg);
	transform-origin: 100% 100%;
	border-top: 2px solid transparent;
	border-left: 2px solid transparent;
	border-right: 2px solid transparent;
	border-bottom: 2px solid transparent;
	transition: width 0.1s ease-out 0s, height 0.1s ease-out 0.1s;
}

.ivGQtp::before {
	content: "";
	position: absolute;
	bottom: 5px;
	left: 2px;
	width: 8px;
	height: 14px;
	transform: rotate(40deg);
	transform-origin: 100% 100%;
	border-top: 2px solid transparent;
	border-left: 2px solid transparent;
	border-right: 2px solid rgb(204, 204, 204);
	border-bottom: 2px solid rgb(204, 204, 204);
}

*, ::before, ::after {
	box-sizing: border-box;
}

button, input {
	padding: 0px;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
}

body, input, textarea, select, button {
	-webkit-font-smoothing: antialiased;
	direction: ltr;
	text-align: left;
	color: rgb(33, 33, 33);
	letter-spacing: -0.5px;
	outline: 0px;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
}

.dcHFEn img {
	transition: all 0.5s ease 0s;
}

img {
	vertical-align: bottom;
}

img {
	border-style: none;
}

html, body {
	height: 100%;
	width: 100%;
	font-family: -apple-system, BlinkMacSystemFont, "Apple SD Gothic Neo",
		"Helvetica Neue", "맑은 고딕", sans-serif;
	font-size: 16px;
}

.fFrJW {
	width: 100%;
}

iframe {
	width: 100%;
	margin-bottom: 20px;
}

.ivGQtp {
	width: 24px;
	height: 24px;
	cursor: pointer;
	position: relative;
	background: rgb(247, 47, 51);
	border-width: 1px;
	border-style: solid;
	border-color: rgb(247, 47, 51);
	border-image: initial;
	transition: border 0.2s ease 0s, background-color 0.2s ease 0s;
}

.starR{
  background: url('${pageContext.request.contextPath}/resources/images/emptyStar.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{
	 background: url('${pageContext.request.contextPath}/resources/images/star22.png') no-repeat right 0;
	 background-size: auto 100%;

}

/* 스타일 추가한거 끝  */
</style>

<c:import url="../template/boot.jsp"></c:import>

</head>
<body style="overflow: auto;">

<!-- 추가한거  -->

	<form action="rei" method="post" enctype="multipart/form-data">
		<div class="form-group">
		<input type="hidden" value="${mem_storeNum }" name="mem_storeNum" id="mem_storeNum"><br>
		</div>
		<div class="form-group">
		<input type="hidden" value="${sell_product}" name="sell_product" id="sell_product"><br>
		</div>
		<div class="form-group">
		<input type="hidden" value="${sell_num}" name="sell_num" id="sell_num"><br>
		</div>
	
		<div id="root">
			<div class="app">
				<div class="sc-fEUNkw MGjwe">
					<div class="sc-kvkilB fSETiC">
						<div class="sc-cANqwJ wmnsE" style="overflow: auto;">
							<div class="sc-clWJBl biGiRA">
								<h2>리뷰 작성</h2>
								<br>
							</div>
							
														<div class="sc-jMtzgO liBHhX"style="height: 300px;">
											<div class="sc-kAKrxA kVlvmu">
												
											</div>
												
												<!--  -->
												
				<div class="form-group" style=" background-color: white;  width: 700px;">
				<label for="re_rate" style="font-size: 20px;"> 별점선택</label>
				<p></p>
				<hr style=" border-top: 3px #80d6ff solid;"> 
				
				<div class="starRev">
				  <span class="starR on">별1</span>
				  <span class="starR">별2</span>
				  <span class="starR">별3</span>
				  <span class="starR">별4</span>
				  <span class="starR">별5</span>
				</div>
				
				<input type="hidden" name="re_rate" id="re_rate">
				
		<%-- 		<input type="radio" class="5p" name="re_rate" value="5" checked="checked"><!-- #e6f5ff -->
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="5p">5점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="4p" name="re_rate" value="4"><!-- #e6f5ff -->
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="4p">4점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="3p" name="re_rate" value="3">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="3p">3점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="2p" name="re_rate" value="2"><!-- #e6f5ff -->
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="2p">2점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="1p" name="re_rate" value="1">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" class=""> <span class="1p">1점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<hr>
			</div>	 --%>

		<div class="form-group">
		<input type="hidden" value="${member.mem_storeName}" name="re_storeName" id="re_storeName">
		<input type="hidden" value="${member.mem_storeNum}" name="re_storeNum" id="re_storeNum"><br>
		</div>										
													
													
												<!--  -->													
										</div>
									</div>
							<div class="sc-jGkVzM HDroZ">

								<div class="sc-fYAFcb kThGwo">

									<div class="sc-lhLRcH csuEuq">
										<div class="sc-jMtzgO liBHhX" style=" height: 230px;">
										
												<div class="form-group">
												<label for="re_context"></label>
												<textarea rows="" cols="" class="form-control" id="re_context" name="re_context" placeholder="리뷰사항은 100자 이내에 작성해 주세요." style="width: 800px; height: 200px; resize: none; font-size: large;"></textarea>
												<span style="color:#aaa;" id="counter">(0 / 최대 100자)</span>
												
												</div>
										
											<div class="sc-kAKrxA kVlvmu">
												
											</div>

										</div>
									</div>
								</div>


								<div class="sc-fYAFcb kThGwo">

									<div class="sc-lhLRcH csuEuq">
			
								</div>
								
								
								<div class="sc-fYAFcb kThGwo">

									<div class="sc-lhLRcH csuEuq">
										<div class="sc-jMtzgO liBHhX" style=" height: 300px;">
		<div style="width: 856px;height:180px; float: left;">
		
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
		</div>	
										</div>
									</div>
								</div>
								
										<button style="margin-top: 36px; width: 160px;height: 56px;border: 0px;background-image: url('${pageContext.request.contextPath}/resources/images/regi_logo.png');" type="submit" class="btn btn-default btn pull-right" id="rei"></button>
<a id="tests"> ccc</a>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
<!-- 추가한거 끝  -->	
	
	

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



		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
				var star =$('.on').length;
				
				$('#re_rate').val(star);
				
			  return false;

			});
	
	</script>


</body>
</html>

