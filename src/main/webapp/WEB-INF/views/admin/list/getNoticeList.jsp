<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<div class="topnav">
		<a class="active" href="#home">공지 목록</a>
		<div class="search-container">
			<form action="/">
				<input type="text" placeholder="Notice Search.." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<td>글 번호</td>
				<td>공지 제목</td>
				<td>공지 내용</td>
				<td>공지 게시일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="li">
				<tr>
					<td>${li.no_num}</td>
					<td><a href="../notice/noticeSelect?no_num=${li.no_num}" class="pointCursor">${li.no_title}</a></td>
					<td>${li.no_contents}</td>
					<td>${li.no_regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>