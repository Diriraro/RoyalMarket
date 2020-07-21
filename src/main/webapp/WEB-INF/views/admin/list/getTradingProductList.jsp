<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-container">
	<div class="topnav">
		<a class="check" title="ProductList">상품 정보 관리</a>
		<a class="check active" title="TradingList">상품 거래 관리</a>
		<div class="search-container">
			<select id="sel1" name="kind">
				<option value="pn">상품번호</option>
				<option value="tn">거래번호</option>
				<option value="bn">구매자명</option>
				<option value="sn">판매자명</option>
			</select> <input type="text" placeholder="Trading Search.." name="search"
				id="tradingSearch">
			<button type="submit" id="tradingSearchbtn">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>거래번호</th>
				<th>상품번호</th>
				<th>구매자</th>
				<th>판매자</th>
				<th>상품가격</th>
				<th>상품인수</th>
				<th>상품취소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="trading">
				<tr>
					<td>${trading.trading_num}</td>
					<td>${trading.sell_num}</td>
					<td>${trading.buyer_id}</td>
					<td>${trading.seller_id}</td>
					<td>${trading.sell_price}</td>
					<td width="50px"><button id="compulsionTrans" title="${trading.trading_num}" class="btn btn-danger"> 강제인수 </button> <!-- ${trading.trading_num} 파라미터 넘기기-->
					<td width="50px"><button id="compulsionCancel" title="${trading.trading_num}" class="btn btn-normal"> 강제취소 </button> <!-- ${trading.trading_num} 파라미터 넘기기-->
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>