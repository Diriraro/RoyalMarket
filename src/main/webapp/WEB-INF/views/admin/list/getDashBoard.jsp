<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="w3-main">

	<!-- Header -->
	<header class="w3-container" style="padding-top: 22px">
		<h5>
			<b><i class="fa fa-dashboard"></i> My Dashboard</b>
		</h5>
	</header>
	<br>
	<div class="w3-row-padding w3-margin-bottom">
		<div class="w3-quarter">
			<div class="w3-container w3-red w3-padding-16">
				<div class="w3-left">
					<i class="fa fa-comment w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>문의수</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>1:1 문의</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-blue w3-padding-16">
				<div class="w3-left">
					<i class="fa fa-eye w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>방문자수</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>방문자 수</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-teal w3-padding-16">
				<div class="w3-left">
					<i class="fa fa-share-alt w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>거래량</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>일일 거래량</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-orange w3-text-white w3-padding-16">
				<div class="w3-left">
					<i class="fa fa-users w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>${memberCount}</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>총 회원수</h4>
			</div>
		</div>
	</div>
	<br>
	<div class="w3-container">
		<h5>General Stats</h5>
		<p>전일 대비 총회원 증가비율</p>
		<div class="w3-grey">
			<div class="w3-container w3-center w3-padding w3-green"
				style="width: ${increaseRate}%">${increaseRate}%</div>
		</div>

		<p>전일 대비 거래량 비율</p>
		<div class="w3-grey">
			<div class="w3-container w3-center w3-padding w3-orange"
				style="width: 50%">50%</div>
		</div>

		<p>전일 대비 방문자 비율</p>
		<div class="w3-grey">
			<div class="w3-container w3-center w3-padding w3-red"
				style="width: 75%">75%</div>
		</div>
	</div>
	<hr>
	<br>
	<div class="w3-container">
		<h5>지역별 거래량</h5>
		<br>
		<table
			class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<td>United States</td>
				<td>65%</td>
			</tr>
			<tr>
				<td>UK</td>
				<td>15.7%</td>
			</tr>
			<tr>
				<td>Russia</td>
				<td>5.6%</td>
			</tr>
			<tr>
				<td>Spain</td>
				<td>2.1%</td>
			</tr>
			<tr>
				<td>India</td>
				<td>1.9%</td>
			</tr>
			<tr>
				<td>France</td>
				<td>1.5%</td>
			</tr>
		</table>
	</div>
	<br> <br>
	<div class="w3-container">
		<h5>최신 상품게시글</h5>
		<br>
		<div class="w3-row">
			<div class="w3-col m2 text-center">
				<img class="w3-circle" alt="사진" style="width: 96px; height: 96px">
			</div>
			<div class="w3-col m10 w3-container">
				<h4>
					John <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12
						PM</span>
				</h4>
				<p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum
					dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
					incididunt ut labore et dolore magna aliqua.</p>
				<br>
			</div>
		</div>

		<div class="w3-row">
			<div class="w3-col m2 text-center">
				<img class="w3-circle" alt="사진" style="width: 96px; height: 96px">
			</div>
			<div class="w3-col m10 w3-container">
				<h4>
					Bo <span class="w3-opacity w3-medium">Sep 28, 2014, 10:15 PM</span>
				</h4>
				<p>Sed do eiusmod tempor incididunt ut labore et dolore magna
					aliqua.</p>
				<br>
			</div>
		</div>
	</div>
	<br>
	<div class="w3-container">
		<h5>최근 공지사항</h5>
		<br>
		<div class="w3-row">
			<!-- 추후에 테이블말고 블럭형태로 변경 -->
			<table class="table">
				<thead>
					<tr>
						<td>공지 글 번호</td>
						<td>공지 글 제목</td>
						<td>공지 글 내용</td>
						<td>공지 게시 일</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="li" begin="${list.size()-2}" end="${list.size()}">
						<tr>
							<td>${li.no_num}</td>
							<td><a href="../notice/noticeSelect?no_num=${li.no_num}">${li.no_title}</a></td>
							<td>${li.no_contents}</td>
							<td>${li.no_regDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
