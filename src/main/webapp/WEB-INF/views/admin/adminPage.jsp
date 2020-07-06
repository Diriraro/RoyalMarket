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
						href="#" class="check" title="NoticeWrite"><i
						class="far fa-file-alt"></i> 공지 사항 등록</a>
				</div>
			</div>
		</div>
	</section>
	<section id="sc2">
		<div id="section_head">
			<div style="float: left; line-height: 75px;">
				<a style="color: black;" href="../"><i class="fas fa-home"></i>Home</a>
			</div>
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
			if (check) {
				// 미답변 문의가 있으면
				$(".new").children(".fas").removeClass("fa-envelope");
				$(".new").children(".fas").addClass("fa-envelope-open-text");
			} else {
				// 미답변 문의가 없을시
				$(".new").children("#new").remove();
				$(".new").children(".fas").removeClass("fa-envelope-open-text")
				$(".new").children(".fas").addClass("fa-envelope");
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
				} else if (path == 'NoticeWrite'){
					getNoticeWrite();
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
			} else if (path == 'NoticeSelect'){
				var nonum = $(this).attr("id");
				console.log(nonum);
				getNoticeSelect(nonum);
			}
		})
		$("#content").on("click", ".qna_num", function(){		// 답변 페이지 진입
			var qna_num = $(this).attr("id");					// 글 번호 받아오기
			getQnaAnswer(qna_num);								// 함수로 보냄
		})
		
		$("#content").on("click", "#answerO", function(){		// 답변완료 누를시 진입
			getQnaAnswerOK();									// 함수로 바로 보냄 > 함수에서 변수받아옴
		})
		
		$("#content").on("click", "#qnaMemSearch", function(){	// 글 목록에서 작성자 아이디 검색
			var search = $("#qnaSearch").val();					// 아이디 변수로 받아옴
			getQnaMemSearch(search);							// 함수로 보냄
		})
		
		$("#content").on("click","#noticeSubmit", function(){
			getNoticeWriteOK();
		})
		
		$("#content").on("click","#noticeDel", function(){
			var check = confirm("삭제하면 복구할수 없습니다. 정말로 삭제할까요?");
			if(check){
				var nonum = $(this).attr("title");
				getNoticeDelete(nonum);
			}else{
				event.stopPropagation();
			}
		})
		$("#content").on("click","#noticeUpd", function(){
			var nonum = $(this).attr("title");
			getNoticeUpdate(nonum);
		})
		
		$("#content").on("click","#noticeUpdate", function(){
			getNoticeUpdateOK();
		})
		
		$("#content").on("click", "#noticeTitleSearch", function(){	
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
		
		// dashboard
		function getDashBoard() {
			$("#content").empty();
			$.get("./list/getDashBoard", function(result) {
				$("#content").append(result);
			})
		}

		// qna
		function getManToManList() {
			$("#content").empty();
			$.get("./list/getManToManList", function(result) {
				$("#content").append(result);
			})
		}
		function getQnaMemSearch(search) {						// qna에서 글작성자 검색 함수
			$("#content").empty();
			$.post("./list/getManToManList",{					// post로 보냄 (controller에는 같은 이름의 메서드가 get방식으로 있어서 post로 보냄)
					search : search
				}, function(result) {
				$("#content").append(result);					// callback
			})
		}
		function getQnaAnswer(qna_num) {
			$("#content").empty();
			$.get("./list/qnaAnswer?qna_num="+qna_num, function(result) {
				$("#content").append(result);
			})
		}	
		function getQnaAnswerOK() {
			var form = {										// 변수 한번에 넘겨주기위해 변수하나에 필요한 내용 다 담기			
					qna_num : $("#qna_numAnswer").val(),
					qna_contents : $("#qna_contents").val()
			};
			$("#content").empty();
			$.ajax({
				type: 'POST',  
				  url: './list/qnaAnswer',  					// post로 보냄
				  data: form,									// 담은 변수명 보냄
				  success: function(data){
					  alert("작성 성공");							// 성공하면 alert 출력
					  $("#content").empty();
						$.get("./list/getManToManList", function(result) {	// qna list 함수를 그대로 가져옴
							$("#content").append(result);
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
		
		// product
		function getProductList() {
			$("#content").empty();
			$.get("./list/getProductList", function(result) {
				$("#content").append(result);
			})
		}

		// notice
		function getNoticeList() {
			$("#content").empty();
			$.get("./list/getNoticeList", function(result) {
				$("#content").append(result)
			})
			
		}
		function getNoticeWrite(){
			$("#content").empty();
			$.get("../notice/noticeWrite", function(result) {
				$("#content").append(result);
			})
		}

		function getNoticeWriteOK(){
			var form = {										// 변수 한번에 넘겨주기위해 변수하나에 필요한 내용 다 담기			
					notitle : $("#notitle").val(),
					no_contents : $("#summernote").val()
			};
			$("#content").empty();
			$.ajax({
				type: 'POST',  
				  url: '/notice/noticeWrite',  					// post로 보냄
				  data: form,									// 담은 변수명 보냄
				  success: function(result){
					  alert("공지 작성 완료");						// 성공하면 alert 출력
					  $("#content").empty();
						$.get("/admin/list/getNoticeList", function(result) {
							$("#content").append(result)
						})
				  }
			})
		}
		function getNoticeDelete(nonum){
			$("#content").empty();
			$.get("../notice/noticeDelete?nonum="+nonum, function(result) {
				alert("삭제 완료");
				$("#content").empty();
				$.get("./list/getNoticeList", function(result) {
					$("#content").append(result)
				})
			})
		}
		function getNoticeUpdate(nonum){
			$("#content").empty();
			$.get("../notice/noticeUpdate?nonum="+nonum, function(result) {
				$("#content").append(result);
			})
		}
		function getNoticeUpdateOK(){
			var form = {			
					nonum : $("#nonum").val(),							// 변수 한번에 넘겨주기위해 변수하나에 필요한 내용 다 담기			
					notitle : $("#notitle").val(),
					no_contents : $("#summernote").val()
			};
			$("#content").empty();
			$.ajax({
				type: 'POST',  
				  url: '/notice/noticeUpdate',  					// post로 보냄
				  data: form,									// 담은 변수명 보냄
				  success: function(result){
					  alert("공지 수정 완료");						// 성공하면 alert 출력
					  $("#content").empty();
						$.get("/admin/list/getNoticeList", function(result) {
							$("#content").append(result)
						})
				  }
			})
		}
		function getNoticeSelect(nonum){
			$("#content").empty();
			$.get("../notice/noticeSelect?nonum="+nonum, function(result) {
				$("#content").append(result);
			})
		}
		function getNoticeSearch(search) {						// qna에서 글작성자 검색 함수
			$("#content").empty();
			$.post("./list/getNoticeList",{						// post로 보냄 (controller에는 같은 이름의 메서드가 get방식으로 있어서 post로 보냄)
					search : search
				}, function(result) {
				$("#content").append(result);					// callback
			})
		}
	</script>
</body>
</html>