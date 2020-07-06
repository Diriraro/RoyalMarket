<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
td{
width: 220px;
font-size: large;
text-align: center;
font-weight: bold;

}

.td1{
border-bottom: 2px solid white;
border-left: 2px solid black;
border-right: 2px solid black;
border-top: 2px solid black;

}

</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<c:import url="../template/woozoo_nav.jsp"></c:import>
		<c:import url="../template/shopmain.jsp"></c:import>
<div class="container">
		<div style="border: 1px solid black; width: 1024px;  min-height: 340px;">
			<!-- 각자 페이지에 하나씩 생성  -->
			<!--버튼 감싸는 div  -->
			<div>
			<!-- 이동버튼  -->
			<hr>
			<table border="1" style="height: 80px;">
				<tr>
				<td bgcolor="#f2f2f2"><a href="./myshop?mem_storeNum=${mem_storeNum}">상품&nbsp;&nbsp;   ${prodco}</a></td>
				<td bgcolor="#f2f2f2"><a href="./comments?mem_storeNum=${mem_storeNum}">상점문의 &nbsp;&nbsp;${coco}</a></td>
				<c:if test="${msnum eq mem_storeNum }">
				<td class="td1">
					<a href="./favorites?mem_storeNum=${mem_storeNum}"> 찜&nbsp;&nbsp; ${zico}</a>
				</td>
				</c:if>
				<td bgcolor="#f2f2f2"><a href="./reviews?mem_storeNum=${mem_storeNum}">상점후기&nbsp;&nbsp;  ${reco }</a></td>
				<td bgcolor="#f2f2f2"><a href="./followings?mem_storeNum=${mem_storeNum}">팔로잉&nbsp;&nbsp;  ${giveco}</a></td>
				<td bgcolor="#f2f2f2"><a href="./followers?mem_storeNum=${mem_storeNum}">팔로워 &nbsp;&nbsp;  ${takeco} </a></td>
				</tr>
			
			</table>
			<!--  -->
			</div>


			<div> <!-- 내용보여줄 div  -->
				<h2>${mem_storeName} 님의 찜목록</h2>

				<div style="border: 1px solid red; min-height: 340px; overflow: auto;">
					<c:forEach items="${zilist }" var="vo">
						<div style="border: 1px solid red; width: 480px; height: 140px; float: left; margin-left: 2%; margin-top: 2%; margin-bottom: 2%;" >
						<button>
							${vo.mem_storeNum } <a>mem_storeNum</a>
						</button>
						<button>
							 ${vo.sell_num } <a>sell_num</a>
						</button>
						<button>
							  ${vo.zzim_num }<a>zzim_num</a>
						</button>
						</div>
					</c:forEach>

				</div>

			</div> <!-- 내용 dv 끝  -->

		</div><!-- 버튼, 내용 끝  -->

	</div><!-- 컨테이너 끝  -->
</body>
</html>