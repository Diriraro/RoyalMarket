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
			<tr>
				<td>sample1</td>
				<td><a>sample1</a></td>
				<td>sample1</td>
				<td>sample1</td>
			</tr>
		</tbody>
	</table>
</div>