<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- icon font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jqery library -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- bootstrap library  -->
<script src="https://kit.fontawesome.com/1a953cf392.js"
	crossorigin="anonymous"></script>
<!-- fontawesome library -->


<title>Insert title here</title>
<style>
/* Body */
section {
	float: left;
	height: 969px; /* 추후 섹션 유동적 높이 처리  */
	vertical-align: middle;
}

/* Body */
/* Section 1 */
#sc1 {
	width: 13%;
	padding-top: 10px;
	padding-left: 20px;
	padding-right: 10px;
	box-sizing: border-box;
	border-right: 1px solid silver;
	line-height: 30px;
	background-color: #b366ff;
	font-size: 17px;
	color: white;
	padding-left: 20px
}

#logo {
	height: 65px;
	border: 1px solid white;
}

#stats {
	margin-top: 20px;
	line-height: 45px;
	border-bottom: 1px solid silver;
	border-top: 1px solid silver;
}

.info {
	margin: 10px 0px;
}

.focus_sub {
	border-bottom: 1px solid gray;
}

.sidenav {
	left: 0px;
	width: 100%;
}

#content {
	width: 100%;
}

.contents {
	display: none;
	height: 200px;
	width: 100%;
	padding: 10px;
	border-radius: 10px;
	background-color: white;
}

.contents>a {
	color: #000066;
	display: block;
	line-height: 30px;
}

.contents>a:hover {
	text-decoration: underline;
	font-weight: bold;
}

/* Section 1 */
/* Section 2 */
#sc2 {
	background-color: #f2f2f2;
	padding: 5px 5px;
	width: 87%;
	height: 95px;
}

#section_head {
	padding: 0 30px;
	background-color: white;
	width: 100%;
	height: 100%;
	border-radius: 10px;
}

#admin_set {
	line-height: 75px;
	font-size: 20px;
	float: right;
	margin-left: 10px;
}

#admin_set>i {
	color: purple;
}

.new {
	margin-right: 10px;
	line-height: 75px;
	font-size: 13px;
	float: right;
	color: red;
	visibility: hidden;
}

#QnaAndManToMan {
	margin-right: 10px;
	line-height: 75px;
	font-size: 13px;
	float: right;
}

#QnaAndManToMan>a {
	color: black;
}

.check {
	cursor: pointer;
}
/* Section 2 */

/* Section 3 */
#sc3 {
	padding: 15px 30px;
	width: 87%;
	background-color: #f2f2f2;
	height: 874px;
	overflow: auto;
	width: 87%;
}
/* Section 3 ==================== getList Search Form ==================== */
.listSection {
	width: 100%;
}

.topnav {
	width: 100%;
	overflow: hidden;
	background-color: #e9e9e9;
	text-align: center;
}

.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #2196F3;
	color: white;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container select {
	margin-top: 8px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
	height: 36px;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}

/* Section 3 Dash board */





/* ==================== getList Search Form ==================== */
/* Section 3 */
</style>
</head>
<body>
	<header></header>
	<section id="sc1">
		<div id="logo">logo</div>
		<div class="sidenav">
			<div id="stats">
				<label><i class="far fa-file-alt"></i> Dash Board </label>
				<!-- pdf파일로 불러들이기 (회원수,하루 상품등록 및 판매량, 하루 접속인원수) -->
			</div>
			<!-- 목록을 제외한 다른 호출은 각 Controller로 보내서 처리 -->
			<div style="font-size: 13px;">MENU</div>
			<div class="info">
				<label class="focus"><i class="far fa-folder"></i> 회원 관리</label>
				<div class="contents">
					<a href="#" class="check" title="MemberList"><i
						class="far fa-file-alt"></i> 일반 회원 관리</a> <a href="#" class="check"
						title="MemberBlockList"><i class="far fa-file-alt"></i> 차단 회원
						관리</a>
				</div>
			</div>
			<div class="info">
				<label class="focus"><i class="far fa-folder"></i> 상품 관리</label>
				<div class="contents">
					<a href="#" class="check" title="ProductList"><i
						class="far fa-file-alt"></i> 상품 정보 관리</a> <a href="#" class="check"><i
						class="far fa-file-alt"></i> 상품 거래 관리</a>
				</div>
			</div>
			<div class="info">
				<label class="focus"><i class="far fa-folder"></i> 공지 사항 관리</label>
				<div class="contents">
					<a href="#" class="check" title="NoticeList"><i
						class="far fa-file-alt"></i> 공지 사항 목록</a> <a
						href="../notice/noticeWrite" class="check"><i
						class="far fa-file-alt"></i> 공지 사항 등록</a>
				</div>
			</div>
		</div>
	</section>
	<section id="sc2">
		<div id="section_head">
			<div id="admin_set">
				관리자 님
				<!-- ${member.mem_id} == admin 추후 설정 -->
				<i class="fas fa-user-cog"></i>
			</div>
			<div class="new">
				<i class="fas fa-comment-medical"></i>
			</div>
			<div id="QnaAndManToMan">
				<i class="fas fa-envelope"></i><a title="manToman" class="check">
					질문과 답변 및 1:1문의 </a>
			</div>
		</div>
	</section>
	<section id="sc3">
		<div id="content">
			<div class="w3-main">

				<!-- Header -->
				<header class="w3-container" style="padding-top: 22px">
					<h5>
						<b><i class="fa fa-dashboard"></i> My Dashboard</b>
					</h5>
				</header>

				<div class="w3-row-padding w3-margin-bottom">
					<div class="w3-quarter">
						<div class="w3-container w3-red w3-padding-16">
							<div class="w3-left">
								<i class="fa fa-comment w3-xxxlarge"></i>
							</div>
							<div class="w3-right">
								<h3>문의수</h3>
							</div>
							<div class="w3-clear"></div>
							<h4>1:1 문의 </h4>
						</div>
					</div>
					<div class="w3-quarter">
						<div class="w3-container w3-blue w3-padding-16">
							<div class="w3-left">
								<i class="fa fa-eye w3-xxxlarge"></i>
							</div>
							<div class="w3-right">
								<h3>방문자수</h3>
							</div>
							<div class="w3-clear"></div>
							<h4>방문자 수 </h4>
						</div>
					</div>
					<div class="w3-quarter">
						<div class="w3-container w3-teal w3-padding-16">
							<div class="w3-left">
								<i class="fa fa-share-alt w3-xxxlarge"></i>
							</div>
							<div class="w3-right">
								<h3>거래량</h3>
							</div>
							<div class="w3-clear"></div>
							<h4>일일 거래량</h4>
						</div>
					</div>
					<div class="w3-quarter">
						<div class="w3-container w3-orange w3-text-white w3-padding-16">
							<div class="w3-left">
								<i class="fa fa-users w3-xxxlarge"></i>
							</div>
							<div class="w3-right">
								<h3>총 회원수</h3>
							</div>
							<div class="w3-clear"></div>
							<h4>총 회원수</h4>
						</div>
					</div>
				</div>

				
				<div class="w3-container">
					<h5>General Stats</h5>
					<p>전일 대비 총회원 수</p>
					<div class="w3-grey">
						<div class="w3-container w3-center w3-padding w3-green"
							style="width: 10%">10%</div>
					</div>

					<p>전일 대비 거래량</p>
					<div class="w3-grey">
						<div class="w3-container w3-center w3-padding w3-orange"
							style="width: 50%">50%</div>
					</div>

					<p>전일 대비 방문자수</p>
					<div class="w3-grey">
						<div class="w3-container w3-center w3-padding w3-red"
							style="width: 75%">75%</div>
					</div>
				</div>
				<hr>

				<div class="w3-container">
					<h5>지역별 거래량</h5>
					<table
						class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
						<tr>
							<td>United States</td>
							<td>65%</td>
						</tr>
						<tr>
							<td>UK</td>
							<td>15.7%</td>
						</tr>
						<tr>
							<td>Russia</td>
							<td>5.6%</td>
						</tr>
						<tr>
							<td>Spain</td>
							<td>2.1%</td>
						</tr>
						<tr>
							<td>India</td>
							<td>1.9%</td>
						</tr>
						<tr>
							<td>France</td>
							<td>1.5%</td>
						</tr>
					</table>
				</div>
				<div class="w3-container">
					<h5> 최신 상품게시글 </h5>
					<div class="w3-row">
						<div class="w3-col m2 text-center">
							<img class="w3-circle" src="/w3images/avatar3.png"
								style="width: 96px; height: 96px">
						</div>
						<div class="w3-col m10 w3-container">
							<h4>
								John <span class="w3-opacity w3-medium">Sep 29, 2014,
									9:12 PM</span>
							</h4>
							<p>Keep up the GREAT work! I am cheering for you!! Lorem
								ipsum dolor sit amet, consectetur adipiscing elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
							<br>
						</div>
					</div>

					<div class="w3-row">
						<div class="w3-col m2 text-center">
							<img class="w3-circle" src="/w3images/avatar1.png"
								style="width: 96px; height: 96px">
						</div>
						<div class="w3-col m10 w3-container">
							<h4>
								Bo <span class="w3-opacity w3-medium">Sep 28, 2014, 10:15
									PM</span>
							</h4>
							<p>Sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua.</p>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<script type="text/javascript">
		$(function() {
			$(".info").on("mouseover", function() {
				$(this).find(".contents").css("display", "block");
				$(this).find(".focus").addClass("focus_sub");
			})
			$(".info").on("mouseout", function() {
				$(this).find(".contents").css("display", "none");
				$(this).find(".focus").removeClass("focus_sub");
			})
			/* 			$(".stats").click(function() {
			 $(this).find(".contents").css("display", "none");
			 }) */
			$(".check").click(function() {
				var path = $(this).prop("title");
				if (path == 'MemberList') {
					getMemberList();
				} else if (path == 'ProductList') {
					getProductList();
				} else if (path == 'NoticeList') {
					getNoticeList();
				} else if (path == 'MemberBlockList') {
					getBlockList();
				} else if (path == 'manToman') {
					getManToManList();
				}
				/* 컨텐츠를 추가시 함수 + else if 추가 */
			})
		})

		$("#content").on("click", ".check", function() {
			var path = $(this).prop("title");
			if (path == 'qna') {
				getQnaList();
			} else if (path == 'manToman') {
				getManToManList();
			}
		})
		$("#content").on("click", "#frm", function() {
			var kind = $("#kind").val();
			var search = $("#search").val();
			getMemberSearchList(kind, search);
		})

		function getManToManList() {
			$("#content").empty();
			$.get("./list/getManToManList", function(result) {
				$("#content").append(result);
			})
		}
		function getQnaList() {
			$("#content").empty();
			$.get("./list/getQnaList", function(result) {
				$("#content").append(result);
			})
		}
		function getBlockList() {
			$("#content").empty();
			$.get("./list/getMemberList?mem_access=1", function(result) {
				$("#content").append(result);
			})
		}

		function getMemberList() {
			$("#content").empty();
			$.get("./list/getMemberList?mem_access=0", function(result) {
				$("#content").append(result);
			})
		}

		function getMemberSearchList(kind, search) {
			$("#content").empty();
			$.post("./list/getMemberList", {
				kind : kind,
				search : search
			}, function(result) {
				console.log(result);
				$("#content").append(result);
			})
		}

		function getProductList() {
			$("#content").empty();
			$.get("./list/getProductList", function(result) {
				$("#content").append(result);
			})
		}
		function getNoticeList() {
			$("#content").empty();
			$.get("./list/getNoticeList", function(result) {
				$("#content").append(result)
			})
		}
	</script>
</body>
</html>