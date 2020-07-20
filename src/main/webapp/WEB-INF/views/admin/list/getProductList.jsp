<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-container">
	<div class="topnav">
		<a class="check active" title="ProductList">상품 정보 관리</a> <a
			class="check " title="TradingList">상품 거래 관리</a>
		<div class="search-container">
			<select id="sel1" name="kind">
				<option value="sp">상품명</option>
				<option value="sk">종류</option>
				<option value="st">태그</option>
			</select> <input type="text" placeholder="Product Search.." name="search"
				id="selSearch">
			<button type="submit" id="productSearchbtn">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>상품번호</th>
				<th>판매자번호</th>
				<th>상품명</th>
				<th>상품 가격</th>
				<th>종류</th>
				<th>게시일</th>
				<th>상품삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="product">
					<tr>
						<td>${product.sell_num}</td>
						<td>${product.mem_storeNum}</td>
						<td><a
							href="../product/productSelect?sell_num=${product.sell_num}">${product.sell_product}</a></td>
						<td>${product.sell_price}</td>
						<td>${product.sell_kind}</td>
						<td>${product.sell_date}</td>
						<td><button type="button" class="deletebtn btn btn-danger"
								title="./result/productDelete?sell_num=${product.sell_num}">삭제</button></td>
					</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="7">
					<div style="width: 1024px; height: 40px; float: left;">
						<ul class="pagination">
							<c:if test="${pager.curBlock gt 1}">
								<li><a
									title="./list/getProductList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
							</c:if>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
								var="i">
								<li><a
									title="./list/getProductList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
							</c:forEach>
							<c:if test="${pager.curBlock lt pager.totalBlock}">
								<li><a
									title="./list/getProductList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
							</c:if>
						</ul>
					</div>

				</td>
			</tr>
		</tfoot>
	</table>
</div>