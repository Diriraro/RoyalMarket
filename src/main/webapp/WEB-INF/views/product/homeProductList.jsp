<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div style="width: 1045px;height: 400px;margin-left: 440px;">


		<c:forEach items="${list}" var="vo" varStatus="i">
				<div style="float: left; margin-left: 9px; margin-bottom: 129px;">
					<div class="qqq" title="${vo.sell_num}" style="height: 194px; width: 194px; cursor: pointer;" 
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
				<img class="img" style="height: 194px; width: 194px; cursor: pointer;" alt=""
							src="${pageContext.request.contextPath}/upload/product/${file[i.index]}">
				</c:if>

							
						<div style="width: 194px; background-color: white;border: 1px solid #e5e5e5">
							<div style="height: 80px;">
								<div ><br>
									<font style="font-size: 14px;font-weight: 700;margin-left: 8px;">${vo.sell_product}</font>
								</div>
								<div style="text-align: left;; line-height: 40px;margin-left: 8px;">
									<font style="font-size: 18px;font-weight: bold;">${vo.sell_price}</font>
									<font style="font-weight: bold;">원</font>
								</div>
							</div>
							<div style="height: 40px; border-top: solid 1px #e4e4e4;text-align: left;line-height: 40px;">
								<img style="margin-left: 8px;width: 16px; height: 20px; margin-bottom: 3px;" alt="" 
									src="${pageContext.request.contextPath}/resources/images/ad_logo.png">
								<font style="font-weight: 600; font-size: 12px;color: gray;">${vo.mem_address}</font>
							</div>

						</div>

					</div>
				</div>

			</c:forEach>
			</div>
