<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<div class="topnav">
		<a class="check active" title="manToman" style="cursor: pointer;">1:1 문의</a>
		<a class="check" title="qna"  style="cursor: pointer;">질문과 답변</a>
		<div class="search-container">
			<form action="/">
				<input type="text" placeholder="MemberName..." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<td>문의 번호</td>
				<td>문의자</td>
				<td>문의 답변 상태</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>sample1</td>
				<td><a>질문자</a></td> <!-- ${mem_storeNum} -->
				<td>sample1</td> <!-- ${mem_qnaCheck} ==  0이면 미답변 || 1이면 답변완료 -->
			</tr>
		</tbody>
	</table>
</div>