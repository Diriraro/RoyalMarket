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
<c:import url="../template/summer.jsp"></c:import>
</head>
<body>
<c:import url="../template/nav.jsp"></c:import>

		<h1> �ڸ�Ʈ������ || �������� StoreQna</h1>
		
		<c:import url="../template/shopmain.jsp"></c:import>
	
	<div class="container">
		<div style="border: 1px solid black; width: 1024px; height: 340px;">
			<!-- ���� �������� �ϳ��� ����  -->
			<!--��ư ���δ� div  -->
			<div>
				<button class="btn btn-info">
					<a href="./myshop">��ǰ</a>
				</button>

				<button class="btn btn-danger">
					<a href="./comments">��������</a>
				</button>

				<button class="btn btn-info">
					<a href="./favorites"> ��</a>
				</button>

				<button class="btn btn-info">
					<a href="./reviews">�����ı�</a>
				</button>

				<button class="btn btn-info">
					<a href="./followings">�ȷ���</a>
				</button>

				<button class="btn btn-info">
					<a href="./followers">�ȷο�</a>
				</button>

			</div>


			<div>
				<h2>��������</h2>
				<div>
				<%-- <c:import url="../template/comentsForm.jsp"></c:import> --%>  <!-- ��� �ּ� -->
				</div>
				
				

			</div>

		</div><!-- ��ư, ���� ��  -->

	</div><!-- �����̳� ��  -->
</body>
</html>