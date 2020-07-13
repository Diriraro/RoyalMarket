<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-container">
	<div class="topnav">
		<a class="check active" title="manToman" style="cursor: pointer;">1:1 문의</a> 
			<select class="form-control" style="width: 180px; height: 52px; float: left;" id="qnaKind">
				<option value="">문의 종류 별 검색</option>
				<option value="계정문의">계정문의</option>
				<option value="차단">차단(제제)</option>
				<option value="거래신고">거래신고</option>
				<option value="서비스기능">서비스 기능</option>
				<option value="광고">광고/전문상점</option>
				<option value="서비스장애">서비스 장애</option>
				<option value="제안">제안</option>
				<option value="기타">기타 신고</option>
			</select>
		<div class="search-container">
			<input type="text" placeholder="MemberName..." name="search"
				id="qnaSearch">
			<button type="submit" id="qnaMemSearch">
				<i class="fa fa-search"></i>
			</button>
			<!-- <form action="./qnaMemberSearch">
			</form> -->
		</div>
	</div>
	<form>
		<div align="center">
			<h2 >고객님이 작성한 문의글</h2>
			<textarea class="form-control" style="margin: 0px; width: 1174px; height: 448px; resize:none;"
				disabled="disabled">${qvo.qna_contents}</textarea>
		</div>
		<br>
		<br>
		<c:if test="${not empty qfvo}">
			<div align="center">
				<h2>첨부파일</h2>
				<button type="button" id="filePopup" class="form-control btn btn-success" style="width: 300px;">첨부파일 확인</button>
			</div>
		</c:if>
		<br>
		<br>
		<div align="center">
			<h2 >고객님께 답</h2>
			<textarea class="form-control" style="margin: 0px; width: 1174px; height: 448px; resize:none;"
				name="qna_contents" id="qna_contents">

=======================================================================================
답변달기를 완료하면 다시 수정할 수 없습니다.
답변에 잘못된 부분이나 빠진 부분이 없는지 확실히 확인해주세요.</textarea>
		</div>
		<input type="hidden" id="qna_numAnswer" name="qna_num"
			value="${qvo.qna_num}">
		<br>
		<div align="center">
		<button type="submit" id="answerO" class="btn btn-primary">답변
			완료 하기</button>
		</div>
	</form>
	
	<script type="text/javascript">
	$("#filePopup").click(function(){
		location.href="javascript:popup()";
	})	
	
	function popup(){
	    var url = "list/showQnaFile?qna_num="+${qvo.qna_num};
	    var name = "첨부파일 보기";
	    var option = "width = 700, height = 500, top = 100, left = 200, location = no"
	    window.open(url, name, option);
	}
	</script>
</div>