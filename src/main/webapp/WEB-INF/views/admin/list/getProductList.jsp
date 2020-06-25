<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<div class="topnav">
		<a class="active" href="#home">상품 관리</a>
		<div class="search-container">
			<form action="">
				<input type="text" placeholder="Product Search.." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<td>상품번호</td>
				<td>판매자번호</td>
				<td>상품명</td>
				<td>상품 가격</td>
				<td>종류</td>
				<td>게시일</td>
			</tr>
		</thead>
		<tbody>
			<tr>
<%-- 				<td>${member.id}</td>
				<td>${member.pw}</td>
				<td>${member.name}</td>
				<td>${member.email}</td>
				<td>${member.phone}</td>
				<td>${member.adress}</td>
				<td>${member.point}</td> --%>
			</tr>
		</tbody>
	</table>
</div>