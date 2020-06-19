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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jqery library -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- bootstrap library  -->
<title>Insert title here</title>
<style>
header {
	margin-top: -10px;
	height: 100px;
	background-color: #8000ff;
	width: 100%;
	line-height: 100px;
}

section {
	float: left;
	height: 800px; /* 추후 섹션 유동적 높이 처리  */
	vertical-align: middle;
}

#sc1 {
	width: 10%;
	padding-left: 20px;
	padding-right: 10px;
	box-sizing: border-box;
	border-right: 1px solid gray;
	line-height: 30px;
	background-color: #b366ff;
}

#sc2 {
	width: 90%;
	background-color: #f2f2f2;
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
}

.contents>a {
	color: white;
	display: block;
}

.contents>a:hover {
	text-decoration: underline;
	font-weight: bold;
}
/* ==================== getList Search Form ==================== */
.listSection {
	width: 100%;
}

.topnav {
	width: 100%;
	overflow: hidden;
	background-color: #e9e9e9;
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
/* ==================== getList Search Form ==================== */
</style>
</head>
<body>
	<header>
		<div>
			<div style="witdh: 20%; float: left;">logo</div>
			<div style="width: 80%; float: right;">관리자</div>
		</div>
	</header>
	<section id="sc1">
		<div class="sidenav">
			<div class="stats">
				<label>통계 정보</label>
			</div>
			<!-- 목록을 제외한 다른 호출은 각 Controller로 보내서 처리 -->
			<div class="info">
				<label class="focus">공지 사항 관리</label>
				<div class="contents">
					<a href="#" class="check" title="NoticeList">공지 사항 목록</a> <a
						href="../notice/noticeWrite" class="check">공지 사항 등록</a>
				</div>
			</div>
			<div class="info">
				<label class="focus">질문과 답변 및 문의</label>
				<div class="contents">
					<a href="#" class="check">질문과 답변 관리</a> <a href="#" class="check">1:1
						문의 관리</a>
				</div>
			</div>
			<div class="info">
				<label class="focus">회원 관리</label>
				<div class="contents">
					<a href="#" class="check" title="MemberList">일반 회원 관리</a> <a
						href="#" class="check">차단 회원 관리</a>
				</div>
			</div>
			<div class="info">
				<label class="focus">상품 관리</label>
				<div class="contents">
					<a href="#" class="check" title="ProductList">상품 정보 관리</a> <a
						href="#" class="check">상품 거래 진행 관리</a>
				</div>
			</div>
		</div>
	</section>
	<section id="sc2">
		<div id="content">
			<h1>리스트 받아올 공간</h1>
		</div>
	</section>
	<script type="text/javascript">
		$(function() {
			$(".info").on("mouseover", function() {
				$(this).find(".contents").css("display", "block");
				$(this).find(".focus").addClass("focus_sub")
			})
			$(".info").on("mouseout", function() {
				$(this).find(".contents").css("display", "none");
				$(this).find(".focus").removeClass("focus_sub")
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
				}
			})
			$("#content").on("click", "#frm", function() {
				var kind = $("#kind").val();
				var search = $("#search").val();
				getMemberSearchList(kind, search);
			})
		})

		function getMemberList() {
			$("#content").empty();
			$.get("./list/getMemberList", function(result) {
				$("#content").append(result);
			})
		}

		function getMemberSearchList(kind, search) {
			$("#content").empty();
			$.post("./list/getMemberList", {
				kind : kind,
				search : search
			}, function(result) {
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