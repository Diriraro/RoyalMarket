<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<br><br>
<font style="font-size: 25px;color: black;">우주장터 상품</font>
<br><br>
<div style="width: 1045px;height: 400px;">


			<c:forEach items="${list}" var="vo" varStatus="i">
				<div style="display:inline-block;margin-right: 64px;">
					<div class="qqq" style="height: 194px; width: 194px; cursor: pointer;"
						onclick="location.href='../product/productSelect?sell_num=${vo.sell_num}'">


<%-- 						<img style="height: 194px; width: 194px; cursor: pointer;" alt=""
							src="${pageContext.request.contextPath}/upload/product/${file[i.index]}"> --%>
							
 				<c:if test="${vo.sell_status ne 0}">
 				<div class="img">
					<div class="content">
						<h5 style="margin-bottom: 30px;">예약완료</h5>
					</div>
					<div class="img-cover"></div></div>

				</c:if>
				<c:if test="${vo.sell_status eq 0 }">
				<div style="background-color: #f9f9f9;width: 244px;">
				<img class="img-circle" style="height: 194px; width: 194px; margin-left:25px;margin-top:20px; cursor: pointer;" alt=""
							src="${pageContext.request.contextPath}/upload/product/${file[i.index]}">
							</div>
				</c:if>

							
						<div style="width: 244px; background-color: #f9f9f9;">
							<div style="height: 80px;">
								<div style="text-overflow: ellipsis; overflow: hidden; width: 244px; height: 40px; white-space: nowrap;"><br>
									<font style="font-size: 14px;font-weight: 700;margin-left: 8px;">${vo.sell_product}</font>
								</div>
								<div style="text-align: left;; line-height: 40px;margin-left: 8px;">
									<font style="font-size: 18px;font-weight: bold;">${vo.sell_price}</font>
									<font style="font-weight: bold;">원</font>
								</div>
							</div>
							<div style="width:244px;height: 40px; border-top: solid 1px #e4e4e4;text-align: left;line-height: 40px;
								text-overflow: ellipsis; overflow: hidden;white-space: nowrap;">
								<img style="margin-left: 8px;width: 16px; height: 20px; margin-bottom: 3px;" alt="" 
									src="${pageContext.request.contextPath}/resources/images/ad_logo.png">
								<font style="font-weight: 600; font-size: 12px;color: gray;">${vo.mem_address}</font>
							</div>

						</div>

					</div>
				</div>

			</c:forEach>
			</div>

</body>
</html>