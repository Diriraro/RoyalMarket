<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<div class="topnav">
		<a class="active" href="#home">거래중 상품 관리</a>
		<div class="search-container">
			<select id="sel1" name="kind">
				<option value="pn">상품번호</option>
				<option value="tn">거래번호</option>
				<option value="bn">구매자명</option>
				<option value="sn">판매자명</option>
			</select> <input type="text" placeholder="Trading Search.." name="search"
				id="selSearch">
			<button type="submit" id="productSearchbtn">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<td>거래번호</td>
				<td>상품번호</td>
				<td>구매자</td>
				<td>판매자</td>
				<td>상품가격</td>
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
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>