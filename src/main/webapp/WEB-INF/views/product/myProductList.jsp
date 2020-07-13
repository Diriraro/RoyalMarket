<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	
	
	
<div style="margin-left:440px; width: 1024px;">
<br><br>




<!-- 검색창 -->
				<div style="">
					<form action="./myProductList" class="form-inline">
						<div>
							<select class="form-control" id="sel1" name="kind"
								style="height: 36px; display: none;">
								<option value="sp">제품명</option>

							</select>
						</div>
						<div 
							style="width: 400px;">
							<input type="hidden" name="mem_storeNum" value="${member.mem_storeNum}" />

							<input type="text" class="form-control" placeholder="상품명을 입력해주세요"
								name="search"
								style="height: 48px;width:350px; margin-top: 1px; float: left;border-radius: 0px;">
							<div>
								<button class="btn btn-default btn-lg" type="submit" style="height:48px;width:50px; margin-top:1px;border-radius: 0px;">
									<i style="color:black;" class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 검색창 끝 -->
				<br><br>
				<!-- 테이블 시작 -->
			<table style="width: 1024px;">
			<!-- 모바일 웹같은 곳에서는 ul / li 를 테이블 대신 씀 -->
			<tr style="text-align: center;border-bottom: solid 1px black;border-top: solid 1px black;font-size: 16px;font-weight: bold;height: 40px;">
				<td style="width: 120px;">사진</td>
				<td >상품명</td>
				<td >가격</td>
				<td style="width: 80px;">조회수</td>
				<td >등록일</td>
				<td style="width: 55px;">기능</td>
			</tr>

			<c:forEach items="${mylist}" var="vo" varStatus="i">
				<tr style="font-size: 16px;text-align: center;height: 160px;border-bottom: solid 1px #e4e4e4;">
					<td><img onclick="location.href='./productSelect?sell_num=${vo.sell_num}'" style="height: 152px; width: 152px; cursor: pointer;" alt=""
							src="${pageContext.request.contextPath}/upload/product/${myfile[i.index]}"></td>
							
					<td style="line-height: 152px;"><a href="./productSelect?sell_num=${vo.sell_num}">${vo.sell_product}</a></td>
					<td style="line-height: 152px;">${vo.sell_price}원</td>
					<td style="line-height: 152px;">${vo.sell_hit}</td>
					<td style="line-height: 152px;">${vo.sell_date}</td>
					<td >
					<a href="./productUpdate?sell_num=${vo.sell_num}">
					<img class="up" style="border: solid 1px #e4e4e4;" src="${pageContext.request.contextPath}/resources/images/modi_logo.png"></a>
					<a href="./productDelete?sell_num=${vo.sell_num}">
					<img class="del" style="border: solid 1px #e4e4e4;margin-top: 10px;" src="${pageContext.request.contextPath}/resources/images/del_logo.png"></a>
					</td>
				</tr>
			</c:forEach>
			</table>
			
						<div style="width: 1024px;height: 40px;float: left;">
				<ul class="pagination" >
					<c:if test="${pager.curBlock gt 1}">
						<li><a
							href="./myProductList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li><a
							href="./myProductList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<li><a
							href="./myProductList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
					</c:if>
				</ul>
			</div>
			
			<% 
			String strReferer = request.getHeader("referer");
			request.getMethod().equals("GET");
			if(strReferer == null){ 
			%>
			<script type="text/javascript">
			document.location.href="http://localhost:8080/";
 			alert("정상적인 경로를 통해 다시 접근해 주세요");

			</script>
			<%
			return;
			}
			%>
			



</div>
<!-- <script type="text/javascript">
 history.replaceState({}, null, location.pathname); 
</script> -->
<script type="text/javascript">
$(".del").click(function(){
    if(confirm("정말 삭제하시겠습니까 ?") == true){
        alert("삭제되었습니다");
    }
    else{
        return false;
    }
});


</script>



</body>
</html>