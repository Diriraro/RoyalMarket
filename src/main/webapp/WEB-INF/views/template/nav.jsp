<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/qna/qnaList">QNA</a></li>

          <li><a href="javascript:popup()">포인트 충전</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <c:if test="${empty member}">
      <li><a href="${pageContext.request.contextPath}/member/memberJoin"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath}/member/memberLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </c:if>

     <c:if test="${not empty member}">
      <li><a href="${pageContext.request.contextPath}/payment/sell_History"><span class="glyphicon glyphicon-user"></span> 판매내역</a></li>
      <li><a href="${pageContext.request.contextPath}/payment/buy_History"><span class="glyphicon glyphicon-user"></span> 구매내역</a></li>
      <li><a href="${pageContext.request.contextPath}/shop/myshop?mem_storeNum=${member.mem_storeNum}"><span class="glyphicon glyphicon-user"></span> 내상점</a></li>
      <li><a href="${pageContext.request.contextPath}/member/memberLogout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
     
    </c:if>
    
    </ul>
  </div>
</nav>


<script type="text/javascript">
	function popup(){
	    var url = "payment/pointCharge";
	    var name = "포인트 충전";
	    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	    window.open(url, name, option);
	}


	

	
</script>
