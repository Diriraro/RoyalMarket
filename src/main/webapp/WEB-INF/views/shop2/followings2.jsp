<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
<c:import url="../template/nav.jsp"></c:import>

		<h1> �ȷ���������</h1>
		
		<c:import url="../template/shopmain2.jsp"></c:import>

	<div class="container">
		<div style="border: 1px solid black; width: 1024px; height: 340px;">
			<!-- ���� �������� �ϳ��� ����  -->
			<!--��ư ���δ� div  -->
			<div>
				<button class="btn btn-info">
					<a href="./myshop2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">��ǰ</a>
				</button>

				<button class="btn btn-info">
					<a href="./comments2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">��������</a>
				</button>

				<button class="btn btn-info">
					<a href="./favorites2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}"> ��</a>
				</button>

				<button class="btn btn-info">
					<a href="./reviews2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">�����ı�</a>
				</button>

				<button class="btn btn-danger">
					<a href="./followings2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">�ȷ���</a>
				</button>

				<button class="btn btn-info">
					<a href="./followers2?mem_storeNum=${mem_storeNum }&mem_storeName=${mem_storeName}">�ȷο�</a>
				</button>

			</div>


			<div>
				<h2>����</h2>

			</div>

		</div><!-- ��ư, ���� ��  -->

	</div><!-- �����̳� ��  -->
</body>
</html>