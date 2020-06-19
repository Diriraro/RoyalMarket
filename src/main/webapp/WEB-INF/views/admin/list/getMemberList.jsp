<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="listSection">
	<div class="topnav">
		<a class="active" href="#home">회원관리</a> <!-- <a href="#about">About</a> <a
			href="#contact">Contact</a> -->
		<div class="search-container">
			<form action="">
				<input type="text" placeholder="Member Search.." name="search">
				<button type="submit">
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
				<td>회원 주소</td>
				<td>회원 잔여포인트</td>
			</tr>
		</thead>
		<tbody>
<%-- 			<tr>
				<td>${memberli.id}</td>
				<td>${memberli.pw}</td>
				<td>${memberli.name}</td>
				<td>${memberli.email}</td>
				<td>${memberli.phone}</td>
				<td>${memberli.adress}</td>
				<td>${memberli.point}</td> 
			</tr> --%>
		</tbody>
	</table>
</div>