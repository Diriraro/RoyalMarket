<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	


<label>최근본 상품</label>
<c:catch>
	<p
		style="color: purple; border-bottom: 2px dotted #b1b1b1; margin-bottom: 20px;">${recentSearch.size()}</p>
	<c:forEach items="${recentSearch}" var="vo" varStatus="i" end="4">
		<div class="recentSearchContainer">
			<img
				onclick="location.href='${pageContext.request.contextPath}/product/productSelect?sell_num=${vo.sell_num}'"
				alt="상품 이미지"
				src="${pageContext.request.contextPath}/upload/product/${file[i.index]}"
				style="cursor: pointer;">
			<p style="padding: 0px 20px;width:180px; overflow:hidden;white-space:nowrap; text-overflow:ellipsis;font-size: 12px;">${vo.sell_product}</p>
		</div>
	</c:forEach>
	
</c:catch>



<script type="text/javascript">
	var cookieValue = '${cookieValue}';
	if (cookieValue != null) {
		setCookie("recentSearch", cookieValue, 1);
	} else {
		setCookie("recentSearch", cookieValue, 0);
	}

</script>

