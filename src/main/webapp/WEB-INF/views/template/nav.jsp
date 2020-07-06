<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>





<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
#myModal {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 800px;
	overflow: hidden;
	height: 800px;
}

.bvbxpR {
	margin-bottom: 10px;
	position: relative;
}

.hkyRQC input {
	width: 100%;
	height: 42px;
	box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 7px 0px;
	padding: 0px 42px 0px 15px;
	border-radius: 4px;
	border-width: 1px;
	border-style: solid;
	border-color: transparent;
	border-image: initial;
}

.hkyRQC {
	margin-bottom: 16px;
	padding: 0px 70px;
}

.cjHLSv {
	width: 222px;
	height: 48px;
	text-align: center;
	color: rgb(255, 255, 255);
	font-weight: bold;
	background: rgb(102, 0, 102);
	border-radius: 4px;
	border: none;
}

button {
	background-color: transparent;
	cursor: pointer;
	outline: none;
}

.cwGThO {
	font-size: 20px;
	line-height: 1.5;
	margin-bottom: 15px;
	text-align: center;
	font-weight: bold;
}

.pmCck {
	line-height: 1.5;
	margin-bottom: 35px;
	text-align: center;
	font-weight: bolder;
}

#login_logo {
	margin-bottom: 30px;
}

#join_btn{
	color:rgb(102, 0, 102);
	text-decoration: none;
}

#find_id{
	text-decoration: none;
	color: black;
	cursor:pointer;
	
}

#foot{
	font-weight: bold;
}


</style>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/notice/noticeList">Notice</a></li>
          <li><a href="${pageContext.request.contextPath}/qna/qnaList">QNA</a></li>

          <li><a href="javascript:popup()">포인트 충전</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <c:if test="${empty member}">
      <li><a href="${pageContext.request.contextPath}/member/memberJoin"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath}/member/memberLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </c:if>

     <c:if test="${not empty member}">
      <li><a href="${pageContext.request.contextPath}/payment/sell_History"><span class="glyphicon glyphicon-user"></span> 판매내역</a></li>
      <li><a href="${pageContext.request.contextPath}/payment/buy_History"><span class="glyphicon glyphicon-user"></span> 구매내역</a></li>
      <li><a href="${pageContext.request.contextPath}/shop/myshop?mem_storeNum=${member.mem_storeNum}"><span class="glyphicon glyphicon-user"></span> 내상점</a></li>
      <li><a href="${pageContext.request.contextPath}/member/memberLogout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>

     
    </c:if>
    </ul>
  </div>

</nav>


<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div id="login_logo">
					<img src="../../resources/images/nav_logo2.png"
						class="sc-fYiAbW knQFFQ">
				</div>
				<div class="cwGThO">우주장터로 중고거래 시작하기</div>
				<div class="pmCck">
					15초만에 간편하게 가입하고 <br>상품을 확인하세요!
				</div>

				<div class="sc-dymIpo hkyRQC">
					<form action="${pageContext.request.contextPath}/member/memberLogin" method="post">
						<div class="sc-bnXvFD bvbxpR">
							<input id="mem_id" type="text" class="form-control" name="mem_id"
								placeholder="ID" value="${cookie.cId.value}">
						</div>
						<div class="sc-gFaPwZ jFjtUg">
							<input id="mem_pw" type="password" class="form-control"
								name="mem_pw" placeholder="비밀번호">
						</div>
						<br><br>
						<div style="text-align: center;">
							<button type="submit" class="sc-fhYwyz cjHLSv">우주장터 이용하기
							</button>
							<br> <br>
							<div id="kakao-login-btn"></div>
						</div>
					</form>
				</div>


				<div class="modal-footer" id="foot">
					아직 계정이없으세요? <a href="${pageContext.request.contextPath}/member/memberJoin" id="join_btn">회원가입하기</a><br>
					<a onclick="openChild()" id="find_id">아이디 또는 비밀번호를 잊어버리셨나요?</a><br> 
				</div>
			</div>

		</div>
	</div>
</div>







<script type="text/javascript">
	function popup() {
		var url = "payment/pointCharge";
		var name = "포인트 충전";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
</script>


<script type="text/javascript">
	var openWin;
	function openChild() {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("${pageContext.request.contextPath}/member/findMember", "_blank",
				"width=300, height=300", true);
	}

	Kakao.init('59e57c59aff3a79eda4531bb82ae7989');

	var Referer = '${Referer}';

	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			Kakao.API.request({
				url : '/v2/user/me',
				success : function(res) {
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/member/kakaoLogin",
						data : {
							mem_id : res.id,
							mem_email : res.kakao_account['email'],
							mem_name : res.kakao_account.profile['nickname'],
							profile : res.properties.profile_image,
						},
						success : function(result) {
							result = result.trim();
							if (result != null && result != 'newMember') {
								location.href = "../" + Referer;
							} else if (result == 'newMember') {
								location.href = "./kakaoMemberJoin";
							}
						}
					});
				}

			});
		},
		fail : function(err) {
		}
	});


	var openWin;
	function openChild() {
			// window.name = "부모창 이름"; 
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("${pageContext.request.contextPath}/member/findMember", "childForm",
					"width=600, height=800, resizable = no, scrollbars = no");
		}

	

		
</script>
