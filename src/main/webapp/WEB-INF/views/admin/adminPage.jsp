<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../template/adminCss.jsp" />
</head>
<body>
	<header></header>
	<section id="sc1">
		<div id="logo">
			<img alt="로고" src="../resources/images/nav_logo_nonback2.png"
				width="100%" height="100%">
		</div>
		<div class="sidenav">
			<div id="stats">
				<div style="font-size: 13px;">STATS</div>
				<label class="check" title="dashBoard"><a
					style="color: white;"><i class="far fa-file-alt"></i> Dash
						Board </a></label>
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
			<div style="float: left; line-height : 75px;"><a style="color : black;" href="../"><i class="fas fa-home"></i>Home</a></div>
			<div id="admin_set">
				관리자 님
				<!-- ${member.mem_id} == admin 추후 설정 -->
				<i class="fas fa-user-cog"></i>
			</div>
			<div id="QnaAndManToMan">
				<a title="manToman" class="check"> 질문과 답변 및 1:1문의 </a>
			</div>
			<div class="new">
				<span id="new">new</span> <i class="fas fa-envelope"></i>
			</div>
		</div>
	</section>
	<section id="sc3">
		<div id="content"></div>
	</section>
	<script type="text/javascript">
		$(function() {
			var check = ${check};
			if (!check) {
				$(".new").children(".fas").removeClass("fa-envelope");
				$(".new").children(".fas").addClass("fa-envelope-open-text");
			} else {
				$(".new").children("#new").remove();
				$(".new").children(".fas").css("color", "black");
			}

			// id : content 내용
			getDashBoard();
			$(".info").on("mouseover", function() {
				$(this).find(".contents").css("display", "block");
				$(this).find(".focus").addClass("focus_sub");
			})
			$(".info").on("mouseout", function() {
				$(this).find(".contents").css("display", "none");
				$(this).find(".focus").removeClass("focus_sub");
			})
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
				} else if (path == 'dashBoard') {
					getDashBoard();
				}
				/* 컨텐츠를 추가시 함수 + else if 추가 */
			})
			$("#content").on(
					"click",
					".AccessGrant1",
					function() {
						if (confirm("정말 차단하시겠습니까?")) {
							var storeNum = $(this).prop("title");
							$("#content").empty();
							$.get("./list/getMemberList?mem_storeNum="
									+ storeNum + "&handling=1&mem_access=0",
									function(result) {
										alert("변경되었습니다.");
										$("#content").append(result);
									})
						}
					})
			$("#content").on(
					"click",
					".AccessGrant0",
					function() {
						if (confirm("정말 차단을 해제하시겠습니까?")) {
							var storeNum = $(this).prop("title");
							$("#content").empty();
							$.get("./list/getMemberList?mem_storeNum="
									+ storeNum + "&handling=1&mem_access=1",
									function(result) {
										alert("변경되었습니다.");
										$("#content").append(result);
									})
						}
					})
		})
		$("#logo").click(function() {
			location.href="./adminPage";
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
			var mem_access = 0;
			getMemberSearchList(kind, search, mem_access);
		})
		$("#content").on("click", "#frm1", function() {
			var kind = $("#kind").val();
			var search = $("#search").val();
			var mem_access = 1;
			getMemberSearchList(kind, search, mem_access);
		})

		function getDashBoard() {
			$("#content").empty();
			$.get("./list/getDashBoard", function(result) {
				$("#content").append(result);
			})
		}

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
			$.get("./list/getMemberList?mem_access=1&handling=0", function(
					result) {
				$("#content").append(result);
			})
		}

		function getMemberList() {
			$("#content").empty();
			$.get("./list/getMemberList?mem_access=0&handling=0", function(
					result) {
				$("#content").append(result);
			})
		}

		function getMemberSearchList(kind, search, mem_access) {
			$("#content").empty();
			$.post("./list/getMemberList", {
				mem_access : mem_access,
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