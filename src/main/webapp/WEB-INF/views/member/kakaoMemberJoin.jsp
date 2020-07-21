<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취향을 잇는 거래, 우주장터</title>
<c:import url="../template/boot.jsp"></c:import>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.liBHhX:last-child {
	margin-bottom: 0px;
}

.liBHhX {
	height: 50px;
	box-shadow: rgb(76, 76, 76) 0px 1px 0px 0px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.wmnsE {
	width: 650px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 6px 0px;
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
	margin: 0px 7px 0px 220px; 
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
</style>
</head>

<body style="overflow: auto;">
	<form:form modelAttribute="memberVO" action="./kakaoMemberJoin"
		method="post">
		
		<input type="hidden" name="mem_id" value="id">
		<input type="hidden" name="mem_name" value="name">
		<input type="hidden" name="mem_pw" value="kakaoPw">
		<input type="hidden" name="mem_email" value="email@email">

		<div id="root">
			<div class="app">
				<div class="sc-fEUNkw MGjwe">
					<div class="sc-kvkilB fSETiC">
						<div class="sc-cANqwJ wmnsE">
							<div class="sc-clWJBl biGiRA">
								<h2>회원가입</h2>
							</div>
							<div class="sc-jGkVzM HDroZ">


								<div class="sc-fYAFcb kThGwo">


									<div class="sc-lhLRcH csuEuq">
										<div class="sc-jMtzgO liBHhX">
											<div class="sc-kAKrxA kVlvmu">
												<img alt="휴대폰 번호 Input 아이콘"
													src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAoCAYAAACb3CikAAAAAXNSR0IArs4c6QAAAKJJREFUWAntmNEKgCAUQ7vRh/vnFcHtYbAUssuC9WLTl3m2QIvW2r4IPKuAh8vClkZOMpHvlWMmIkPERjD+uyO4kNnh/FvNuigTDSWSO2c7yPXRsUdYhoiNYKQmYiJIALU7YiJIALU7YiJIALU7YiJIAPXImbXkbixTVkpk1ukdI2BahoiMkadoPikpi/wXREp/3MgQkTESvVs6++5nz8sQOQDArxrcaIpJNgAAAABJRU5ErkJggg=="
													width="17" height="20">
											</div>
											<form:input path="mem_phone" type="text" id="mem_phone"
												placeholder="휴대폰 번호(숫자만 허용)" />

											<input type="button" value="인증 번호" class="btn btn-default"
												id="rq_num" onclick="checkPhone()">
										</div>
									</div>
									<form:errors path="mem_phone" class="error_msg"></form:errors>


									<div class="sc-lhLRcH csuEuq">
										<div class="sc-jMtzgO liBHhX">
											<div class="sc-kAKrxA kVlvmu">
												<img alt="인증번호 Input 아이콘"
													src="data:image/png;base64,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"
													width="19" height="20">
											</div>
											<form:input path="phoneCheck" type="text" id="phoneCheck"
												placeholder="인증번호" />
											<div id="ViewTimer"></div>

										</div>
									</div>
									<form:errors path="phoneCheck" class="error_msg"></form:errors>


								</div>
								<div class="sc-fYAFcb kThGwo">

									<div class="sc-lhLRcH csuEuq">
										<div class="sc-jMtzgO liBHhX">
											<div class="sc-kAKrxA kVlvmu">
												<i class="fas fa-house-user"
													style="width: 25; height: 25; color: gray"></i>
											</div>
											<form:input path="road_address" type="text" id="road_address"
												placeholder="주소 입력" />

											<input id="address" type="button" value="주소 검색"
												class="btn btn-default" onclick="openChild()">

										</div>
									</div>
									<form:errors path="road_address" class="error_msg"></form:errors>

									<div class="sc-lhLRcH csuEuq">
										<div class="sc-jMtzgO liBHhX">
											<div class="sc-kAKrxA kVlvmu">
												<i class="fas fa-house-user"
													style="width: 25; height: 25; color: gray"></i>
											</div>
											<form:input path="detail_address" type="text"
												id="detail_address" placeholder="상세 주소 입력" />

										</div>
									</div>
								</div>

					
								<div class="sc-exdmVY ubhSQ">
									<div class="sc-evWYkj llQLqu">
										<div class="sc-hqGPoI ettlGe">
											<div class="sc-hPeUyl lerNRt">
												<div class="sc-kasBVs dDiVis" id="checkAll"></div>
												<div class="sc-imAxmJ kZHPTS">전체동의하기</div>
											</div>
										</div>
									</div>
									<div class="sc-idjmjb fZmenS">
										<div class="sc-hqGPoI ettlGe">
											<div class="sc-hPeUyl lerNRt">
												<div class="sc-kasBVs dDiVis" id="check1"></div>
												<div class="sc-imAxmJ kZHPTS">
													<span class="sc-iWadT bOqqay">(필수)</span>번개장터 이용약관 동의
												</div>
												<div id="show1" title="hide">
													<img
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAALRJREFUOBFjYBgFgzMEqqtb5Cl1GcwMxoaGdoVfv3+d+s/EGNreXHeQHINrapod/v3/t4qRgdmU+cCBvR9sHJxOMf77vxpEHzm0/yEphlbWNtkz/P+/GuSgtpbai8wgzSBDyDEUZBjIIci+AxtIjqHYDAOZAzeQFENxGYZhIDGG4jMMq4H4DCVkGEgvI4jABZANAKlBjwBs+vAaCNIAS2MgNnJsgvhkA5ChINeSbcCoRpJCAADCUaKHyL/YQQAAAABJRU5ErkJggg=="
														width="20" height="20" alt="회원가입 아이콘"
														style="background-color: white">
												</div>

											</div>
											<div class="sc-esoVGF geWVNF show1" style="display: none;">
												<div class="sc-cAJUJo fFrJW">
													<iframe title="번개장터 위치기반서비스 이용약관"
														src="https://terms.bunjang.co.kr/terms/service.html"></iframe>
												</div>
											</div>
										</div>
										<div class="sc-hqGPoI ettlGe">
											<div class="sc-hPeUyl lerNRt">
												<div class="sc-kasBVs dDiVis" id="check2"></div>
												<div class="sc-imAxmJ kZHPTS">
													<span class="sc-iWadT bOqqay">(필수)</span>개인정보 처리 방침 동의
												</div>

												<div id="show2" title="hide">
													<img
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAALRJREFUOBFjYBgFgzMEqqtb5Cl1GcwMxoaGdoVfv3+d+s/EGNreXHeQHINrapod/v3/t4qRgdmU+cCBvR9sHJxOMf77vxpEHzm0/yEphlbWNtkz/P+/GuSgtpbai8wgzSBDyDEUZBjIIci+AxtIjqHYDAOZAzeQFENxGYZhIDGG4jMMq4H4DCVkGEgvI4jABZANAKlBjwBs+vAaCNIAS2MgNnJsgvhkA5ChINeSbcCoRpJCAADCUaKHyL/YQQAAAABJRU5ErkJggg=="
														width="20" height="20" alt="회원가입 아이콘"
														style="background-color: white">
												</div>


											</div>
											<div class="sc-esoVGF geWVNF show2" style="display: none;">
												<div class="sc-cAJUJo fFrJW">
													<iframe title="번개장터 위치기반서비스 이용약관"
														src="https://terms.bunjang.co.kr/terms/privacy.html"></iframe>
												</div>
											</div>
										</div>
										<div class="sc-hqGPoI ettlGe">
											<div class="sc-hPeUyl lerNRt">
												<div class="sc-kasBVs dDiVis" id="check3"></div>
												<div class="sc-imAxmJ kZHPTS">
													<span class="sc-ZUflv euslgD">(선택)</span>위치기반서비스 동의
												</div>

												<div id="show3" title="hide">
													<img
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAALRJREFUOBFjYBgFgzMEqqtb5Cl1GcwMxoaGdoVfv3+d+s/EGNreXHeQHINrapod/v3/t4qRgdmU+cCBvR9sHJxOMf77vxpEHzm0/yEphlbWNtkz/P+/GuSgtpbai8wgzSBDyDEUZBjIIci+AxtIjqHYDAOZAzeQFENxGYZhIDGG4jMMq4H4DCVkGEgvI4jABZANAKlBjwBs+vAaCNIAS2MgNnJsgvhkA5ChINeSbcCoRpJCAADCUaKHyL/YQQAAAABJRU5ErkJggg=="
														width="20" height="20" alt="회원가입 아이콘"
														style="background-color: white">
												</div>

											</div>
											<div class="sc-esoVGF geWVNF show3" style="display: none;">
												<div class="sc-cAJUJo fFrJW">
													<iframe title="번개장터 위치기반서비스 이용약관"
														src="https://terms.bunjang.co.kr/terms/location.html"></iframe>
												</div>
											</div>
										</div>
										<div class="sc-hqGPoI ettlGe">
											<div class="sc-hPeUyl lerNRt">
												<div class="sc-kasBVs dDiVis" id="check4"></div>
												<div class="sc-imAxmJ kZHPTS">
													<span class="sc-ZUflv euslgD">(선택)</span>이메일,SMS 광고 수신 동의
												</div>
											</div>
										</div>
										<div class="sc-fHlXLc jvQNgl">*선택항목은 동의하지 않아도 회원가입이
											가능합니다</div>
									</div>
								</div>

								<button type="submit" class="gqqaLP" id="btn_submit">가입하기</button>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>

	<script type="text/javascript">
	
		var check = false;
		var SetTime = 300;		// 최초 설정 시간(기본 : 초)
		var tid = 0;

		var again = "${again}";


		if(again=="again"){
				alert("입력정보가 틀립니다. 인증번호를 재발급하고 다시 시도해주세요!");
				console.log("입력정보가 틀립니다. 인증번호를 재발급하고 다시 시도해주세요!");
			}
		
		
		
		function checkPhone(result2) {
			var phoneNumber = $('#mem_phone').val();

			$.post("./check/sendSMS2", {
				phoneNumber : phoneNumber
			}, function(result) {
				alert(result.trim());
				SetTime = 300;
				if(result.trim()=="인증 메세지를 전송했습니다") {
					clearInterval(tid);
					TimerStart();
				} else {
					return;
				}
			}) 		
		} 

		function TimerStart(){ tid=setInterval('msg_time()',1000) };
	
		var openWin;

		function openChild() {
			// window.name = "부모창 이름"; 
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("./findAddress", "childForm",
					"width=570, height=350, resizable = no, scrollbars = no");
		}

		function getText(obj) {
			if (obj.options[obj.selectedIndex].text == "직접입력") {
				$("#email").css("display", "block");
			}else{
				$("#email").css("display", "none");
				}
			
		}


		function msg_time() {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + ":" + (SetTime % 60);	// 남은 시간 계산
			
			var msg = "<font color='red'>" + m + "</font>";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				alert("인증번호가 만료되었습니다.");
			}
			
		}

		$("#checkAll").click(function(){
			
			
			if($(this).attr("class")=="sc-kasBVs dDiVis"){
				$(this).attr("class","ivGQtp");
				$("#check1").attr("class","ivGQtp");	
				$("#check2").attr("class","ivGQtp");
				$("#check3").attr("class","ivGQtp");
				$("#check4").attr("class","ivGQtp");
			}else if($(this).attr("class")=="ivGQtp"){
				$(this).attr("class","sc-kasBVs dDiVis");
				$("#check1").attr("class","sc-kasBVs dDiVis");
				$("#check2").attr("class","sc-kasBVs dDiVis");
				$("#check3").attr("class","sc-kasBVs dDiVis");
				$("#check4").attr("class","sc-kasBVs dDiVis");
			}
		}); 
		
		
		$("#check1").click(function(){
			
			if($(this).attr("class")=="sc-kasBVs dDiVis"){
				$(this).attr("class","ivGQtp");
				}else if($(this).attr("class")=="ivGQtp"){
					$("#checkAll").attr("class","sc-kasBVs dDiVis");
					$(this).attr("class","sc-kasBVs dDiVis");
				}
			
			})
			
		$("#check2").click(function(){
			if($(this).attr("class")=="sc-kasBVs dDiVis"){
				$(this).attr("class","ivGQtp");
				}else if($(this).attr("class")=="ivGQtp"){
					$("#checkAll").attr("class","sc-kasBVs dDiVis");
					$(this).attr("class","sc-kasBVs dDiVis");
				}
			
			})
			
		$("#check3").click(function(){
			if($(this).attr("class")=="sc-kasBVs dDiVis"){
				$(this).attr("class","ivGQtp");
				}else if($(this).attr("class")=="ivGQtp"){
					$("#checkAll").attr("class","sc-kasBVs dDiVis");
					$(this).attr("class","sc-kasBVs dDiVis");
				}
			
			})
			
			
		$("#check4").click(function(){
			if($(this).attr("class")=="sc-kasBVs dDiVis"){
				$(this).attr("class","ivGQtp");
				}else if($(this).attr("class")=="ivGQtp"){
					$("#checkAll").attr("class","sc-kasBVs dDiVis");
					$(this).attr("class","sc-kasBVs dDiVis");
				}
			
			})
			
		$("#btn_submit").click(function(){
			if($(check1).attr("class")!="ivGQtp" || $(check2).attr("class")!="ivGQtp"){
					alert("필수 항목에 동의해주세요")
					$("#btn_submit").prop("type","button");
			}else{
				$("#btn_submit").prop("type","submit");
				}
		});

		$("#show1").click(function(){
			if($(this).prop("title")=="hide"){
				$(".show1").show(500);
				$(this).prop("title","show");
			}else{
				$(".show1").hide(500);
				$(this).prop("title","hide");
				}
				
			});

		$("#show2").click(function(){
			if($(this).prop("title")=="hide"){
				$(".show2").show(500);
				$(this).prop("title","show");
			}else{
				$(".show2").hide(500);
				$(this).prop("title","hide");
				}
				
			});

		$("#show3").click(function(){
			if($(this).prop("title")=="hide"){
				$(".show3").show(500);
				$(this).prop("title","show");
			}else{
				$(".show3").hide(500);
				$(this).prop("title","hide");
				}
				
			});

		



		
		</script>
</body>
</html>