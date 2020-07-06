<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-container">
	<div class="topnav">
		<a class="check active" title="manToman" style="cursor: pointer;">1:1
			문의</a> <a class="check" title="qna" style="cursor: pointer;">질문과 답변</a>
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
		<h2 align="center">고객님이 작성한 문의글</h2>
		<textarea style="margin: 0px; width: 1174px; height: 448px;"
			disabled="disabled">${qvo.qna_contents}</textarea>
		<br>
		<br>
		<h2>첨부파일</h2>
		<c:forEach items="${qfvo}" var="vo">
			<img src="../upload/qna/${vo.file_name}"
				style="width: 500px; height: 448px;">
		</c:forEach>
		<br>
		<br>
		<h2 align="center">고객님께 답</h2>
		<textarea style="margin: 0px; width: 1174px; height: 448px;"
			name="qna_contents" id="qna_contents">

=======================================================================================
답변달기를 완료하면 다시 수정할 수 없습니다.
답변에 잘못된 부분이나 빠진 부분이 없는지 확실히 확인해주세요.
</textarea>
		<input type="hidden" id="qna_numAnswer" name="qna_num"
			value="${qvo.qna_num}">
		<button type="submit" id="answerO" class="btn btn-primary">답변
			완료 하기</button>
	</form>
</div>