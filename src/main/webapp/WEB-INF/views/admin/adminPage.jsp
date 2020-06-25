<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div id="logo">logo</div>
		<div class="sidenav">
			<div id="stats">
			<div style="font-size: 13px;">STATS</div>
				<label class="check" title="dashBoard"><a style="color : white;"><i class="far fa-file-alt"></i> Dash Board </a></label>
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
		<div id="content"></div>
	</section>
	<script type="text/javascript">
		$(function() {
			getDashBoard();
			$("#content").append()
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
				} else if (path == 'dashBoard') {
					getDashBoard();
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

		function getMemberSearchList(kind, search, mem_access) {
			$("#content").empty();
			$.post("./list/getMemberList", {
				mem_access : mem_access,
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