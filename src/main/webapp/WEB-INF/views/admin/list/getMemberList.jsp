<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="listSection">
	<div class="topnav">
		<a class="active" href="#home">회원관리</a>
		<!-- <a href="#about">About</a> <a
			href="#contact">Contact</a> -->
		<div class="search-container">
			<form>
				<select id="kind">
					<option value="mem_id" selected="selected">아이디</option>
					<option value="mem_storeNum">회원번호</option>
					<option value="mem_name">회원이름</option>
				</select> <input type="text" placeholder="Member Search.." name="search"
					id="search">
				<button type="submit" id="frm">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<td>회원 아이디</td>
				<td>회원 비밀번호</td>
				<td>회원 이름</td>
				<td>회원 이메일</td>
				<td>회원 핸드폰</td>
				<td>회원 번호</td>
				<td>회원 주소</td>
				<td>회원 잔여포인트</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.mem_id}</td>
					<td>${vo.mem_pw}</td>
					<td>${vo.mem_name}</td>
					<td>${vo.mem_email}</td>
					<td>${vo.mem_phone}</td>
					<td>${vo.mem_storeNum}</td>
					<td>${vo.mem_address}</td>
					<td>${vo.mem_point}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>