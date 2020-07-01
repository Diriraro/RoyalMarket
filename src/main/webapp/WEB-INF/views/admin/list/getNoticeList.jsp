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
				<td>공지 게시일</td>
				<td>공지 삭제</td>
				<td>공지 수정</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="li">
				<tr>
					<td>${li.nonum}</td>
					<td><a href="#" title="NoticeSelect" class="check pointCursor" id="${li.nonum}">${li.notitle}</a></td>
					<td>${li.no_regDate}</td>
					<td width="50px"><button id="noticeDel" title="${li.nonum}" class="btn btn-danger">공지 삭제</button> </td>
					<td width="50px"><button id="noticeUpd" title="${li.nonum}" class="btn btn-success">공지 수정</button> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>