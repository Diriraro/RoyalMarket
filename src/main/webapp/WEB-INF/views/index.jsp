<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"></c:import>
</head>
<body>
</head>
<body>
	<c:import url="./template/nav.jsp"></c:import>




	<div class="container">
		<h1>Index PAGe</h1>
		
		<a href="./product/productNew"><button>판매하기</button></a>

		<ul class="allKind">
			<li><input type="button" class="kind" id="category0" value="패션잡화"></li>
			<li><input type="button" class="kind" value="여성의류"></li>
			<li><input type="button" class="kind" value="남성의류"></li>
			<li><input type="button" class="kind" value="디지털/가전"></li>
			<li><input type="button" class="kind" value="도서/티켓/취미/애완"></li>
			<li><input type="button" class="kind" value="생활/문구/가구/식품"></li>
			<li><input type="button" class="kind" value="유아동/출산"></li>
			<li><input type="button" class="kind" value="스타굿즈"></li>
			<li><input type="button" class="kind" value="스포츠/레저"></li>
			<li><input type="button" class="kind" value="뷰티/미용"></li>
			<li><input type="button" class="kind" value="기타"></li>
			<li><input type="button" class="kind" value="차량/오토바이"></li>
			<li><input type="button" class="kind" value="구인구직"></li>
			<li><input type="button" class="kind" value="재능"></li>
			<li><input type="button" class="kind" value="번개나눔"></li>
			<li><input type="button" class="kind" value="지역 서비스"></li>
			<li><input type="button" class="kind" value="커뮤니티"></li>
			<li><input type="button" class="kind" value="원룸/함께살아요"></li>

		</ul>


${member.mem_storeNum}
<button><a href="../shop/myshop?mem_storeNum=${member.mem_storeNum}">내상점</a></button>
<button><a href="../shop/myshop">영호상점</a></button>
<button><a href="../shop2/myshop2?mem_storeNum=25"> cotest상점</a></button>
<button><a href="../shop2/myshop2?mem_storeNum=27&mem_storeName=yhlim12">yhlim12 상점 </a></button>


	</div>

	<script type="text/javascript">
		$("#category0").click(
				function() {
					location.href = "/product/productList?kind=sk&search=패션잡화";
				});
	</script>


</body>
</html>