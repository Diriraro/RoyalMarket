<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.buttons{ 
	border: 1px solid white; 
	background-color: rgba(0,0,0,0);  
	padding: 5px; 
	display: inline-block;
	width: 300px;
	margin-top: 50px;
}

.img{
        position: relative;                                   
        height: 100px;
        width: 100px;
        background-size: cover;
    }

.img-cover{

       height: 100%;
       width: 100%;
       background-color: rgba(0, 0, 0, 0.7);                                                                 
       z-index:1;
    }

.img .content{
         position: absolute;
         top:50%;
         left:50%;
         transform: translate(-50%, -50%);                                                                   
         font-size:1rem;
         color: white;
         z-index: 2;
         text-align: center;
 }

</style>
<c:import url="../template/style.jsp"></c:import>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	
	<div class="container">
		<div style="text-align: center;"><h2><b>거래내역</b></h2></div>
		<div>
			<button type="button" data-index="0" class="buttons" style="margin-left: 257px;" id="buy_his"><b>구매 내역</b></button>
			<button type="button" data-index="0" class="buttons" id="sell_his" style="border-bottom: 2px solid red;"><b style="color: red;" id="sell_his">판매 내역</b></button>
		</div>
		<c:forEach items="${sell}" var="vo">
			<div style=" margin-top: 10px; margin-left: 257px;">
				
				<c:if test="${vo.status eq 2}">
					<div class=img style="height: 100px; width:100px;float: left;  background-size: 100px 100px; background-image: url('${pageContext.request.contextPath}/upload/product/${vo.file_name}');">
						<div class="content">
							<h5 style="margin-bottom: 30px;">판매 <br> 완료</h5>
						</div>
						<div class="img-cover">
						</div>
					</div>
				</c:if>
					
				<c:if test="${vo.status ne 2}">
					<div style="height: 100px; width:100px;float: left;  background-size: 100px 100px; background-image: url('${pageContext.request.contextPath}/upload/product/${vo.file_name}');"></div>
				</c:if>
				
				<div style="height: 100px; display: inline-block; margin-left: 10px;">
					<div style="display: inline-block;"><font style="font-size: large;"><a href="./seller_page?sell_num=${vo.sell_num}&sell_history_num=${vo.sell_history_num}&buyer_id=${vo.buyer_id}">${vo.sell_product}</a></font></div><br>
					<div style="display: inline-block;"><font style="font-size: large;"><b>${vo.sell_price} 원</b></font></div><br>
					<div style="display: inline-block;">${vo.buyer_id}</div><br>
					<div style="display: inline-block;">${vo.sell_date}</div><br>
					<c:if test="${vo.status eq 0}">
						<div style="display: inline-block;">판매 대기중</div>
					</c:if>
					<c:if test="${vo.status eq 1}">
						<div style="display: inline-block;">인계 완료</div>
					</c:if>
					<c:if test="${vo.status eq 2}">
						<div style="display: inline-block;">판매 완료</div>
					</c:if>
					<c:if test="${vo.status eq 3}">
						<div style="display: inline-block;">취소된 거래입니다.</div>
						<button class="btn btn-primary sellDelete" id="buyDelete"  title="${vo.sell_history_num}" style="background-color: white; border: white;"><font style="color: red;">삭제하기</font></button>
					</c:if>		
				</div>
			</div>
		</c:forEach>
	
	</div>
	<script type="text/javascript">

	$(".productGive").click(function() {	
		var num = $(this).attr("title");
		location.href="./seller_page?sell_num="+num;
		
	}); 
 	$(".sellDelete").click(function() {	
		var sell_history_num = $(this).attr("title");
		location.href="./sellDelete?sell_history_num="+sell_history_num;
		
	}); 
	
	$("#buy_his").click(function() {	
		location.href="./buy_History";
		
	}); 
	$("#sell_his").click(function() {	
		location.href="./sell_History";
		
	}); 
		
</script>
<footer><c:import url="../template/footer.jsp"></c:import></footer>

</body>
</html>