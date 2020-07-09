<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

      <div class="modal-header">
        <button type="button" class="close" id="closePhone" data-dismiss="modal">&times;</button>
        <img alt="" src="${pageContext.request.contextPath}/resources/images/nav_logo.png" style="width:50px;height:50px; 
        border-radius: 25px;border: 1px solid gray; margin-left: 109px;">
        <h4 style="text-align: center;">${memberVO.mem_storeName}</h4>
      </div>
    
      <div class="modal-body" style="margin-top: 10px;">
      	<div>
      		<div style="display: inline-block;">
       			<font style="color: #888888"><b>연락 가능한 시간</b></font> 
       		</div>
       		<div style="display: inline-block; margin-left: 20px;">
       			<font>24시간</font>&nbsp; &nbsp;
       		</div>
       	</div>
    
       	<div style="display: inline-block;">
       			<font style="color: #888888"><b>판매자 연락처</b></font> 
       		</div>
       		<div style="display: inline-block; margin-left: 38px; margin-right: 10px;">
       			<font>${memberVO.mem_phone}</font> &nbsp; &nbsp;
       		</div>
       		
       	<div style="display: inline-block;">
       			<font style="color: #888888"><b>판매자 후기별점</b></font> 
       		</div>
       		<div style="display: inline-block; margin-left: 24px;">
       			
       			<c:if test="${avg ne 0.0}">
	       			<c:forEach begin="1" end="${avg}">
	       				<img alt="" src="${pageContext.request.contextPath}/resources/images/star22.png" style="width: 20px; height: 20px">
	       			</c:forEach>
	       			<c:if test="${rest>0}">
	       				<img alt="" src="${pageContext.request.contextPath}/resources/images/star23.png " style="width: 20px; height: 20px">
	       			</c:if>
	       			<c:forEach begin="1" end="${5-avg}">
	       				<img alt="" src="${pageContext.request.contextPath}/resources/images/emptyStar.png" style="width: 20px; height: 20px">
	       			</c:forEach>
       			</c:if>
       			
       			<c:if test="${avg eq 0.0}">
       				<c:forEach begin="1" end="5">
	       				<img alt="" src="${pageContext.request.contextPath}/resources/images/emptyStar.png" style="width: 20px; height: 20px">
	       			</c:forEach>
       			</c:if>
       			
       		</div>
       	</div>
      
       
       	</div>
      
      </div>
   
    </div>


