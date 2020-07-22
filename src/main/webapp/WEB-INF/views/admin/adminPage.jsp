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
	<input type="hidden" value="${check}" id="NAcheck">
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
				<label class="focus"><i class="far fa-folder"></i> 회원 관리
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
					class="fa fa-caret-down"></i></label>
				<div class="contents">
					<a href="#" class="check" title="MemberList"><i
						class="far fa-file-alt"></i> 일반 회원 관리</a> <a href="#" class="check"
						title="MemberBlockList"><i class="far fa-file-alt"></i> 차단 회원
						관리</a>
				</div>
			</div>
			<div class="info">
				<label class="focus"><i class="far fa-folder"></i> 상품 관리
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
					class="fa fa-caret-down"></i></label>
				<div class="contents">
					<a href="#" class="check" title="ProductList"><i
						class="far fa-file-alt"></i> 상품 정보 관리</a> <a href="#" class="check"
						title="TradingList"><i class="far fa-file-alt"></i> 상품 거래 관리</a>
				</div>
			</div>
			<div class="info">
				<label class="focus"><i class="far fa-folder"></i> 공지사항 관리
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down"></i></label>
				<div class="contents">
					<a href="#" class="check" title="NoticeList"><i
						class="far fa-file-alt"></i> 공지 사항 목록</a> <a href="#" class="check"
						title="NoticeWrite"><i class="far fa-file-alt"></i> 공지 사항 등록</a>
				</div>
			</div>
		</div>
		<div id="kCalendar"></div>
	</section>
	<section id="sc2">
		<div id="section_head">
			<div style="float: left; line-height: 75px;">
				<a style="color: black;" href="../"><i class="fas fa-home"></i>Home</a>
			</div>
			<div class="adminMenu">
				<div id="adminMenubar" onclick="myFunction(this)">
					<div class="bar1"></div>
					<div class="bar2"></div>
					<div class="bar3"></div>
				</div>
				<div id="mySidenav" class="sidenav2">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<a id="memberLogout">관리자 로그아웃</a>
				</div>
			</div>
			<div id="admin_set">
				${member.mem_id}님 <i class="fas fa-user-cog"></i>
			</div>
			<div id="QnaAndManToMan">
				<a title="manToman" class="check" style="color : black !important;"> 1:1문의 </a>
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
		var check = $("#NAcheck").val();
		if (check == 'true') {
			// 미답변 문의가 있으면
			$(".new").children(".fas").removeClass("fa-envelope");
			$(".new").children(".fas").addClass("fa-envelope-open-text");
			$("#QnaAndManToMan").children(".check").css("color","red");
		} else {
			// 미답변 문의가 없을시
			$(".new").children("#new").remove();
			$(".new").children(".fas").removeClass("fa-envelope-open-text")
			$(".new").children(".fas").addClass("fa-envelope");
			$(".new").children(".fas").css("color", "#26004d");
			$("#QnaAndManToMan").children(".check").css("color","black");
		}

		$(function() { // 페이지 로딩이후 동작
			// section 2
			$(".adminMenu").click(function() {
				if ($("#mySidenav").css("width") == "0px") {
					openNav();
				} else if ($("#mySidenav").css("width") == "250px") {
					closeNav();
				}
			})
			$("#memberLogout").click(function() {
				if (confirm("로그아웃하시겠습니까?")) {
					location.href = "../member/memberLogout";
				}
			})
			// section 3
			getDashBoard();
			// section 1 
			$(".info").on("click", function() {
				if ($(this).find(".contents").css("display") == "none") {
					$(this).find(".fa").removeClass("fa-caret-down");
					$(this).find(".fa").addClass("fa-caret-up");
					$(this).find(".contents").show(200);
					$(this).find(".focus").addClass("focus_sub");
				}
			})
			$(".focus")
					.on(
							"click",
							function() {
								if ($(this).parent().find(".contents").css(
										"display") != "none") {
									$(this).parent().find(".contents")
											.hide(200);
									$(this).find(".fa").removeClass("fa-caret-up");
									$(this).find(".fa").addClass("fa-caret-down");
									$(this).removeClass("focus_sub");
								}
							})
			$(".check").click(function() {
				$(".check").css("text-decoration", "none");
				$(".check").css("font-weight", "");
				$(".check").css("color", "#b366ff");
				var path = $(this).prop("title");
				$(this).css("text-decoration", "underline");
				$(this).css("font-weight", "bold");
				$(this).css("color", "#26004d");
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
				} else if (path == 'NoticeWrite') {
					getNoticeWrite();
				} else if (path == 'TradingList') {
					getTradingProductList();
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
			location.href = "./adminPage";
		})
		$("#content").on("click", ".check", function() {
			var path = $(this).prop("title");
			if (path == 'qna') {
				getQnaList();
			} else if (path == 'manToman') {
				var search="";
				getManToManList(search);
			} else if (path == 'NoticeSelect') {
				var nonum = $(this).attr("id");
				getNoticeSelect(nonum);
			} else if (path == 'MemberList') {
				getMemberList();
			} else if (path == 'MemberBlockList') {
				getBlockList();
			} else if (path == 'ProductList') {
				getProductList();
			} else if (path == 'TradingList') {
				getTradingProductList();
			} else if (path == 'NoticeList') {
				getNoticeList();
			} else if (path == 'NoticeWrite') {
				getNoticeWrite();
			}
		})
		
		$("#content").on("click", "#compulsionTrans", function() {
			var trading_num = $(this).prop("title");
			compulsionTrans(trading_num);
			})
		$("#content").on("click", "#compulsionCancel", function() {
			var trading_num = $(this).prop("title");
			compulsionCancel(trading_num);
			})
		$("#content").on("click",".w3-circle", function() {
			var num = $(this).attr("title").trim();
			location.href="../product/productSelect?sell_num="+num
			})
		$("#content").on(
				"click",
				"#productSearchbtn",
				function() {
					var kind = $("#sel1").val().trim();
					var search = $("#selSearch").val().trim();
					$.get("./list/getProductList?curPage=1&kind=" + kind
							+ "&search=" + search, function(result) {
						$("#content").empty();
						$("#content").append(result);
					})
				})
		$("#content").on(
				"click",
				"#tradingSearchbtn",
				function() {
					var kind = $("#sel1").val().trim();
					var search = $("#tradingSearch").val().trim();
					$.get("./list/getTradingProductList?curPage=1&kind=" + kind
							+ "&search=" + search, function(result) {
						$("#content").empty();
						$("#content").append(result);
					})
				})
		$("#content").on("click", ".deletebtn", function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				var html = $(this).attr("title");
				$.get(html, function(result) {
					if (result > 0) {
						getProductList();
					}
				})
			}
		})
		$("#content").on("click", "a", function() {
			$("#content").empty();
			var pager = $(this).attr("title");
			$.get(pager, function(result) {
				$("#content").append(result);
			})
		})
		$("#content").on("click", ".qna_num", function() { // 답변 페이지 진입
			var qna_num = $(this).attr("id"); // 글 번호 받아오기
			getQnaAnswer(qna_num); // 함수로 보냄
		})

		$("#content").on("click", "#answerO", function() { // 답변완료 누를시 진입
			getQnaAnswerOK(); // 함수로 바로 보냄 > 함수에서 변수받아옴
		})

		$("#content").on("click", "#qnaMemSearch", function() { // 글 목록에서 작성자 아이디 검색
			var search = $("#qnaSearch").val(); // 아이디 변수로 받아옴
			getQnaMemSearch(search); // 함수로 보냄
		})
		$("#content").on("click", "#qnaKind", function(){
			var search = $("#qnaKind option:selected").val();
			if(search != ""){
				getManToManList(search);
			}
		})

		$("#content").on("click", "#noticeSubmit", function() {
			getNoticeWriteOK();
		})

		$("#content").on("click", "#noticeDel", function() {
			var check = confirm("삭제하면 복구할수 없습니다. 정말로 삭제할까요?");
			if (check) {
				var nonum = $(this).attr("title");
				getNoticeDelete(nonum);
			} else {
				event.stopPropagation();
			}
		})
		$("#content").on("click", "#noticeUpd", function() {
			var nonum = $(this).attr("title");
			getNoticeUpdate(nonum);
		})

		$("#content").on("click", "#noticeUpdate", function() {
			getNoticeUpdateOK();
		})

		$("#content").on("click", "#noticeTitleSearch", function() {
			var search = $("#noticeSearch").val();
			getNoticeSearch(search);
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
			$
					.ajax({
						type : "GET",
						sync : false,
						url : "./list/getDashBoard",
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							$("#content").empty();
							$("#content").append(result);
						}
					})
		}

		// qna
		function getManToManList(search) {
			$
					.ajax({
						type : "GET",
						data : {
							search : search
						},
						url : "./list/getManToManList",
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							$("#content").empty();
							$("#content").append(result);
						}
					})
		}
		function getQnaMemSearch(search) { // qna에서 글작성자 검색 함수
			$("#content").empty();
			$.post("./list/getManToManList", { // post로 보냄 (controller에는 같은 이름의 메서드가 get방식으로 있어서 post로 보냄)
				search : search
			}, function(result) {
				$("#content").append(result); // callback
			})
		}
		function getQnaAnswer(qna_num) {
			$("#content").empty();
			$.get("./list/qnaAnswer?qna_num=" + qna_num, function(result) {
				$("#content").append(result);
			})
		}
		function getQnaAnswerOK() {
			var form = { // 변수 한번에 넘겨주기위해 변수하나에 필요한 내용 다 담기			
				qna_num : $("#qna_numAnswer").val(),
				qna_contents : $("#qna_contents").val()
			};
			$("#content").empty();
			$
					.ajax({
						type : 'POST',
						url : './list/qnaAnswer', // post로 보냄
						data : form, // 담은 변수명 보냄
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(data) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							alert("작성 성공"); // 성공하면 alert 출력
							$("#content").empty();
							$.get("./list/getManToManList", function(result) { // qna list 함수를 그대로 가져옴
								$("#content").append(result);
								$("#NAcheck").val($("#qnaNACheck").val());
								var checkNA = $("#NAcheck").val();
								if (checkNA == 'true') {
									// 미답변 문의가 있으면
									$(".new").children(".fas").removeClass(
											"fa-envelope");
									$(".new").children(".fas").addClass(
											"fa-envelope-open-text");
								} else {
									// 미답변 문의가 없을시
									$(".new").children("#new").remove();
									$(".new").children(".fas").removeClass(
											"fa-envelope-open-text")
									$(".new").children(".fas").addClass(
											"fa-envelope");
									$(".new").children(".fas").css("color",
											"black");
								}
							})
						}
					})

		}
		function getQnaList() {
			$("#content").empty();
			$.get("./list/getQnaList", function(result) {
				$("#content").append(result);
			})
		}

		// member
		function getBlockList() {
			$
					.ajax({
						type : "GET",
						url : "./list/getMemberList?mem_access=1&handling=0",
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							$("#content").empty();
							$("#content").append(result);
						}
					})
		}

		function getMemberList() {
			$
					.ajax({
						type : "GET",
						url : "./list/getMemberList?mem_access=0&handling=0",
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							$("#content").empty();
							$("#content").append(result);
						}
					})
		}

		function getMemberSearchList(kind, search, mem_access) {
				$
					.ajax({
						type : "POST",
						url : "./list/getMemberList",
						data : {mem_access : mem_access, kind : kind, search : search},
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							$("#content").empty();
							$("#content").append(result);
						}
					})
		}

		// product
		function getProductList() {
			$
					.ajax({
						type : "GET",
						url : "./list/getProductList?curPage=1",
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							$("#content").empty();
							$("#content").append(result);
						}
					})
		}
		function getTradingProductList() {
			$
					.ajax({
						type : "GET",
						url : "./list/getTradingProductList",
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							$("#content").empty();
							$("#content").append(result);
						}
					})
		}

		// notice
		function getNoticeList() {
			$
					.ajax({
						type : "GET",
						url : "./list/getNoticeList",
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							$("#content").empty();
							$("#content").append(result);
						}
					})
		}
		function getNoticeWrite() {
			$("#content").empty();
			$.get("../notice/noticeWrite", function(result) {
				$("#content").append(result);
			})
		}

		function getNoticeWriteOK() {
			var form = { // 변수 한번에 넘겨주기위해 변수하나에 필요한 내용 다 담기			
				notitle : $("#notitle").val(),
				no_contents : $("#summernote").val()
			};
			$("#content").empty();
			$
					.ajax({
						type : 'POST',
						url : '/notice/noticeWrite', // post로 보냄
						data : form, // 담은 변수명 보냄
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							alert("공지 작성 완료"); // 성공하면 alert 출력
							$("#content").empty();
							$.get("/admin/list/getNoticeList",
									function(result) {
										$("#content").append(result)
									})
						}
					})
		}
		function compulsionTrans(trading_num) {
			$("#content").empty();
			$.get("./result/compulsionTrans?trading_num="+trading_num+"&behavior=1", function() {
				$
				.ajax({
					type : "GET",
					url : "./list/getTradingProductList",
					beforeSend : function() {
						var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
						loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
						$('#content').fadeTo("fast", 0.4).append(
								loadingHtml);
					},
					success : function(result) {
						$('#content').fadeTo("slow", 1).find('#loading')
								.remove();
						alert("인수인계가 정상적으로 처리되었습니다.");
						getTradingProductList();
					}
				})
				})
			}
		function compulsionCancel(trading_num) {
			$("#content").empty();
			$.get("./result/compulsionTrans?trading_num="+trading_num+"&behavior=2", function() {
				$
				.ajax({
					type : "GET",
					url : "./list/getTradingProductList",
					beforeSend : function() {
						var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
						loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
						$('#content').fadeTo("fast", 0.4).append(
								loadingHtml);
					},
					success : function(result) {
						$('#content').fadeTo("slow", 1).find('#loading')
								.remove();
						alert("상품거래가 정상적으로 취소되었습니다.");
						getTradingProductList();
					}
				})
				})
			}
		
		function getNoticeDelete(nonum) {
			$("#content").empty();
			$.get("../notice/noticeDelete?nonum=" + nonum, function(result) {
				alert("삭제 완료");
				$("#content").empty();
				$.get("./list/getNoticeList", function(result) {
					$("#content").append(result)
				})
			})
		}
		function getNoticeUpdate(nonum) {
			$("#content").empty();
			$.get("../notice/noticeUpdate?nonum=" + nonum, function(result) {
				$("#content").append(result);
			})
		}
		function getNoticeUpdateOK() {
			var form = {
				nonum : $("#nonum").val(), // 변수 한번에 넘겨주기위해 변수하나에 필요한 내용 다 담기			
				notitle : $("#notitle").val(),
				no_contents : $("#summernote").val()
			};
			$("#content").empty();
			$
					.ajax({
						type : 'POST',
						url : '/notice/noticeUpdate', // post로 보냄
						data : form, // 담은 변수명 보냄
						beforeSend : function() {
							var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
							loadingHtml += '<div class="loading_box"><img src="${pageContext.request.contextPath}/resources/images/loading.gif">"</div></div>';
							$('#content').fadeTo("fast", 0.4).append(
									loadingHtml);
						},
						success : function(result) {
							$('#content').fadeTo("slow", 1).find('#loading')
									.remove();
							alert("공지 수정 완료"); // 성공하면 alert 출력
							$("#content").empty();
							$.get("/admin/list/getNoticeList",
									function(result) {
										$("#content").append(result)
									})
						}
					})
		}
		function getNoticeSelect(nonum) {
			$("#content").empty();
			$.get("../notice/noticeSelect?nonum=" + nonum, function(result) {
				$("#content").append(result);
			})
		}
		function getNoticeSearch(search) { // qna에서 글작성자 검색 함수
			$("#content").empty();
			$.post("./list/getNoticeList", { // post로 보냄 (controller에는 같은 이름의 메서드가 get방식으로 있어서 post로 보냄)
				search : search
			}, function(result) {
				$("#content").append(result); // callback
			})
		}
		// 관리자 메뉴
		function myFunction(x) {
			x.classList.toggle("change");
		}
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			$("#adminMenubar").removeClass("change");
		}


		// dateformat
		function getFormatDate(date){
		    var year = date.getFullYear();              
		    var month = (1 + date.getMonth());       
		    month = month >= 10 ? month : '0' + month;  
		    var day = date.getDate();                   
		    day = day >= 10 ? day : '0' + day;          
		    return  year + '-' + month + '-' + day;       
		}
		
		// Calendar
		function kCalendar(id, date) {
	var kCalendar = document.getElementById(id);

	var realdate = new Date();
	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	var currentYear = date.getFullYear();
	//년도를 구함
	
	var currentMonth = date.getMonth() + 1;
	//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
	
	var currentDate = date.getDate();
	//오늘 일자.
	
	date.setDate(1);
	var currentDay = date.getDay();
	//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
	
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
	
	var currentLastDate = lastDate[currentMonth-1];
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	
	if(currentMonth != 1)
		var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
	else
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
	//만약 이번달이 1월이라면 1년 전 12월로 출력.
	
	if(currentMonth != 12) 
		var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	else
		var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	//만약 이번달이 12월이라면 1년 후 1월로 출력.

	
	if( currentMonth < 10 )
		var currentMonth = '0' + currentMonth;
	//10월 이하라면 앞에 0을 붙여준다.
	
	var calendar = '';
	
	calendar += '<div id="header">';
	calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>';
	calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
	calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
	calendar += '		</div>';
	calendar += '			<div style="text-align : center; font-weight : bold;"><span> 오늘 : ' + (realdate.getYear()+1900) + '년 ' + (realdate.getMonth()+1) + '월 '+ currentDate+'일</span> </div>'
	calendar += '		<table border="0" cellspacing="0" cellpadding="0">';
	calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
	calendar += '				<tr>';
	calendar += '				  <th class="sun" scope="row">일</th>';
	calendar += '				  <th class="mon" scope="row">월</th>';
	calendar += '				  <th class="tue" scope="row">화</th>';
	calendar += '				  <th class="wed" scope="row">수</th>';
	calendar += '				  <th class="thu" scope="row">목</th>';
	calendar += '				  <th class="fri" scope="row">금</th>';
	calendar += '				  <th class="sat" scope="row">토</th>';
	calendar += '				</tr>';
	calendar += '			<tbody>';
	
	var dateNum = 1 - currentDay;
	var daily = new Date();
	daily = getFormatDate(daily);
	var dday = "";
	for(var i = 0; i < week; i++) {
		calendar += '			<tr>';
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="' + dateString[j] + ' "> </td>';
				continue;
			}
		dday = currentYear + "-" + currentMonth + "-" + dateNum;
			if(daily == dday) {
				calendar += '				<td style="background-color : red;"class="' + dateString[j] + ' ">' + dateNum + '</td>';
					} else {
			calendar += '				<td class="' + dateString[j] + ' ">' + dateNum + '</td>';
					}
		}
		
		calendar += '			</tr>';
	}
	
	calendar += '			</tbody>';
	calendar += '		</table>';
	
	kCalendar.innerHTML = calendar;
}
		window.onload = function () {
			kCalendar('kCalendar');
		};
	</script>
</body>
</html>