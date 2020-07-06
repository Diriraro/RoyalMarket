<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="w3-main">

	<!-- Header -->
	<div class="w3-container">
		<header style="padding-top: 22px">
			<h2>
				<b><i class="fa fa-dashboard"></i> My Dashboard</b>
			</h2>
		</header>
		<br>
		<div class="w3-row-padding w3-margin-bottom">
			<div class="w3-quarter">
				<div class="w3-container w3-red w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-comment w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>${qnaCount}<span style="font-size: 12px;">(${qnaNACount})</span>
						</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>
						문의 수<span style="font-size: 12px;">(미답변)</span>
					</h4>
				</div>
			</div>
			<div class="w3-quarter">
				<div class="w3-container w3-blue w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-eye w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>${visitors}</h3>
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
						<h3>${tradeCount}</h3>
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
	</div>
	<br>
	<div class="w3-container">
		<h3>
			<b>전일 대비 사이트 이용 상승치 </b>
		</h3>
		<br>
		<p class="ct">전일 대비 총회원 증가비율</p>
		<div class="w3-grey">
			<div class="w3-container w3-center w3-padding w3-green"
				style="width: ${increaseRate}%">${increaseRate}%</div>
		</div>

		<p class="ct">전일 대비 거래량 비율</p>
		<div class="w3-grey">
			<div class="w3-container w3-center w3-padding w3-orange"
				style="width: ${tradeRate}%">${tradeRate}%</div>
		</div>

		<p class="ct">전일 대비 방문자 비율</p>
		<div class="w3-grey">
			<c:catch>
				<div class="w3-container w3-center w3-padding w3-red"
					style="width: ${dailyRate}%">${dailyRate}%</div>
			</c:catch>
		</div>
	</div>
	<hr>
	<br>
	<div class="w3-container">
		<h3>
			<b>지역별 거래량</b>
		</h3>
		<br>
		<table
			class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<thead>
				<tr>
					<th>지역</th>
					<th>누적거래량</th>
				</tr>
			</thead>
			<!-- 비율이 가장 높은 순으로 6개 지역만  -->
			<tbody>
				<c:forEach items="${tradeAr}" var="list" end="5">
					<tr>
						<td>${list.getKey()}</td>
						<td>${list.getValue()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br> <br>
	<div class="w3-container">
		<h3>
			<b>최신 상품게시글</b>
		</h3>
		<br>
		<c:catch>
			<c:forEach items="${productList}" var="list" end="3" varStatus="i">
				<div class="w3-row">
					<div class="w3-col m2 text-center">
						<img class="w3-circle" alt="상품이미지${i.index +1}"
							src="${pageContext.request.contextPath}/upload/product/${productFileMain[i.index]}"
							style="width: 96px; height: 96px" title="${list.sell_num}">
					</div>
					<div class="w3-col m10 w3-container">
						<h4>
							${list.sell_product} <span class="w3-opacity w3-medium">${list.sell_date}</span>
						</h4>
						<p>${list.sell_info}</p>
						<br>
					</div>
				</div>
			</c:forEach>
		</c:catch>
	</div>
	<br>
	<div class="w3-container">
		<h3>
			<b>최근 공지사항</b>
		</h3>
		<br>
		<div class="w3-row">
			<!-- 추후에 테이블말고 블럭형태로 변경 -->
			<table class="table">
				<thead>
					<tr>
						<th>공지 글 번호</th>
						<th>공지 글 제목</th>
						<th>공지 글 내용</th>
						<th>공지 게시 일</th>
					</tr>
				</thead>
				<tbody>
					<c:catch>
						<c:forEach items="${list}" var="li" begin="${list.size()-2}"
							end="${list.size()}">
							<tr>
								<td>${li.nonum}</td>
								<td><a href="#" title="NoticeSelect"
									class="check pointCursor" id="${li.nonum}">${li.notitle}</a></td>
								<td>${li.no_contents}</td>
								<td>${li.no_regDate}</td>
							</tr>
						</c:forEach>
					</c:catch>
				</tbody>
			</table>
		</div>
	</div>
	<div class="w3-container">
		<h3>
			<b>장터 운영 수익 <i class="fas fa-won-sign"></i>
			</b>
		</h3>
		<br>
		<p class="ct">
			달성 / 목표 <i class="fas fa-won-sign"></i>
		</p>
		<div class="w3-grey" style="position: relative;">
			<div class="w3-container w3-center w3-padding w3-green"
				style="width:${profitRate}%; height: 30px;">
				<div
					style="overflow: visible; width: 100%; text-align: center; position: absolute; height: 100%;">${profit}
					/ 1,000,000 <i class="fas fa-won-sign"></i>
					<div></div>
				</div>
			</div>
		</div>
	</div>