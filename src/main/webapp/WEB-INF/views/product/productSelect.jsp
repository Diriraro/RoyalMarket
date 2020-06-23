<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
	<c:import url="../template/nav.jsp"></c:import>
	

	
<h3>Title : ${vo.sell_product}</h3>
<h3>price : ${vo.sell_price}</h3>
<h3>info : ${vo.sell_info}</h3>
<h3>hit : ${vo.sell_hit}</h3>
<h3>date : ${vo.sell_date}</h3>
<h3>address : ${mvo.mem_address}</h3>

 <!--  댓글  -->
    <div class="container">
        <label for="content">comment</label>
        <form name="qnaInsertForm">
            <div class="input-group">
               <input type="hidden" name="sell_num" value="${vo.sell_num}"/>
               <input type="hidden" name="pq_storeNum" value="${memberVO.mem_storeNum}"/>
               <input type="hidden" name="pq_storeName" value="${memberVO.mem_storeName}"/>
               <input type="text" class="form-control" id="pq_contents" name="pq_contents" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="qnaInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="qnaList"></div>
    </div>

 
<!--                     추가                         -->
<%@ include file="productQna.jsp" %>


</body>
</html>