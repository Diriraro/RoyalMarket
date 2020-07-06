<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check eq 'accept'}">
	<div class="w3-container">
		<div class="listSection">
			<div class="topnav">
				<a class="check active" title="MemberList">일반 회원 관리</a>
				<a class="check " title="MemberBlockList">차단 회원 관리</a>
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
						<th>회원 번호</th>
						<th>회원 아이디</th>
						<th>회원 비밀번호</th>
						<th>회원 이름</th>
						<th>회원 이메일</th>
						<th>회원 핸드폰</th>
						<th>회원 주소</th>
						<th>회원 잔여포인트</th>
						<th>회원 접속 차단</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.mem_storeNum}</td>
							<td>${vo.mem_id}</td>
							<td>${vo.mem_pw}</td>
							<td>${vo.mem_name}</td>
							<td>${vo.mem_email}</td>
							<td>${vo.mem_phone}</td>
							<td>${vo.mem_address}</td>
							<td>${vo.mem_point}</td>
							<td><button class="AccessGrant1" title="${vo.mem_storeNum}">X</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</c:if>
<c:if test="${check eq 'denied'}">
	<div class="w3-container">
		<div class="listSection">
			<div class="topnav">
				<a class="check" title="MemberList">일반 회원 관리</a>
				<a class="check active" title="MemberBlockList">차단 회원 관리</a>
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
						<button type="submit" id="frm1">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>회원 아이디</th>
						<th>회원 비밀번호</th>
						<th>회원 이름</th>
						<th>회원 이메일</th>
						<th>회원 핸드폰</th>
						<th>회원 주소</th>
						<th>회원 잔여포인트</th>
						<th>회원 접속 차단 해제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.mem_storeNum}</td>
							<td>${vo.mem_id}</td>
							<td>${vo.mem_pw}</td>
							<td>${vo.mem_name}</td>
							<td>${vo.mem_email}</td>
							<td>${vo.mem_phone}</td>
							<td>${vo.mem_address}</td>
							<td>${vo.mem_point}</td>
							<td><button class="AccessGrant0" title="${vo.mem_storeNum}">O</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</c:if>