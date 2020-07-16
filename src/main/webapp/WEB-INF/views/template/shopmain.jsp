<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.update_form{
	display: none;
}

.imgsh{
filter: drop-shadow(5px 5px 5px #000);

}

.button4{
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
  font-size: 25px;
  color: black;

}


.button4:hover {background-color: #e7e7e7;}

</style>

<!-- shop 페이지가 공통으로 가져갈곳  -->

<div class="container">
<!-- 모든 컨트롤에서는 이름을 출력해줘야함.  -->
	<%-- <h2>${mem_storeName}</h2>  --%> 
		<c:if test="${msnum eq mem_storeNum }">
	<div style="border: 1px solid black; width: 1024px; height: 340px; border-color: rgba(0,0,0,0.25); ">

		<!-- div 1번 -->
		<div style="width: 340px; float: left;">
			<div style="border: 1px solid white; width: 330px; height: 330px; background-size : cover;  background-image: url('${pageContext.request.contextPath}/resources/images/shopback2.jpg');">
				<!-- 사진  -->
				<div style="width: 130px; width: 130px; margin-top: 40px;  margin-left: 30%;border-radius: 70%;overflow: hidden;">
					
					<c:if test="${flo eq 0}">
					<img class="imgsh" alt="" src="${pageContext.request.contextPath}/resources/images/user112.png" style="width: 100%; height: 100%;">
					</c:if>
					
					<c:if test="${flo ne 0}">
					<img class="imgsh" alt="" src="${pageContext.request.contextPath}/resources/images/user114.jpg" style="width: 100%; height: 100%;">
					</c:if>
					
					
				</div>
				
				<!--별점  -->
					<div style=" text-align: center; margin-top: 22px;">
				<c:forEach var="i" begin="1" end="${flo}">
					<a><img class="imgsh" style="cursor: pointer; width: 22px; height: 20px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star22.png"></a>
				</c:forEach>
				<c:if test="${substar eq 1}">
					<a><img class="imgsh" style="cursor: pointer; width: 22px; height: 20px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star23.png"></a>
				</c:if>
					</div>
				
				<div style=" height: 100px; margin-top: 60px; text-align: center;">
				<button class="button4"><a style="color: black; " href="../product/myProductList?kind=sp&mem_storeNum=${member.mem_storeNum}">상품관리</a></button>
				
				
				</div>
			</div>
		</div>
		<!-- div 2번  -->
		
		<div style="border: 0px solid black; width: 680px; height: 330px; float: left; font-size: large;">

			<div style="border: 1px solid white; height: 80px;margin-bottom: 1px; margin-top: 2px;">
			
				<form action="../member/updateStoreName" method="post">
					<input name="mem_id" value="${member.mem_id}" type="hidden">
					<input name="mem_storeName" class="update_form">
					<button type="submit" class="update_form">확인</button> 
				</form>
				
				<div style=" margin-top: 3%;">
				<span class="update" style="font-size: 22px;font-weight: bold;">${mem_storeName}&nbsp;&nbsp; </span><button type="button" class="update" onclick="update_storeName();">상점명 수정</button>
				</div>
				<hr>
			</div>

			<div style="border: 1px solid white; height: 80px; margin-bottom: 1px; margin-top: 2px;">

			<div style="margin-top: 3%;">
				<span style="font-size: 17px;" class="days" title="${getregDate}">
				<img class="imgsh2" alt="" src="${pageContext.request.contextPath}/resources/images/shopopen.png" width="19px;" height="19px;">
				&nbsp;상점오픈일 : <span class="ddays"></span>&nbsp;&nbsp;&nbsp;&nbsp;
				<img class="imgsh2" alt="" src="${pageContext.request.contextPath}/resources/images/shopsell.png" width="19px;" height="19px;">
				&nbsp;상품판매 : ${myselco} 회
				 <!-- store_product sell_status = 2인것  -->
				 </span>
			</div>			
			<hr>
			</div>
			<div style="border: 1px solid white; height: 80px;margin-bottom: 1px; margin-top: 2px;">
			<c:if test="${avg eq 0.0}">
			<div style="margin-top: 3%;">
			<span style="font-size: 22px;"> 거래내역이 없습니다. </span>			
			</div>	
			</c:if>
			
			<c:if test="${avg ne 0.0}">
			<div style="margin-top: 3%;">
			<span style="font-size: 22px;">평점 : <span style="color: blue;">${avg}</span> </span>
			</div>	
			</c:if>
			<hr>
			</div>
			
			<div style="border: 1px solid white; height: 80px; margin-bottom: 1px; margin-top: 2px;">
			<div style="margin-top: 3%;">
			<span style="font-size: 22px;">
			<img class="imgsh2" alt="" src="${pageContext.request.contextPath}/resources/images/ad_logo.png" width="25px;" height="25px;">	${mdata.mem_address}
			</span>
			<hr>
			</div>	
			<%-- 	${mdata.mem_email}
				${mdata.mem_phone} --%>
			</div>
		</div>
	</div>
		</c:if>
		
		<c:if test="${msnum ne mem_storeNum}">
						
	<div style="border: 1px solid black; width: 1024px; height: 340px; border-color: rgba(0,0,0,0.25);">

		<!-- div 1번 -->
		<div style="width: 340px; float: left;">
			<div style="border: 1px solid white; width: 330px; height: 330px; background-size : cover;  background-image: url('${pageContext.request.contextPath}/resources/images/shopback2.jpg');">
				<!-- 사진  -->
				<div style="width: 130px; width: 130px; margin-top: 40px;  margin-left: 30%;border-radius: 70%;overflow: hidden;">
					<c:if test="${flo eq 0 and mdata.mem_access eq 0}">
					<img class="imgsh" alt="" src="${pageContext.request.contextPath}/resources/images/user112.png" style="width: 100%; height: 100%;">
					</c:if>
					<c:if test="${flo ne 0 and mdata.mem_access eq 0}">
					<img class="imgsh" alt="" src="${pageContext.request.contextPath}/resources/images/user114.jpg" style="width: 100%; height: 100%;">
					</c:if>
					<c:if test="${mdata.mem_access eq 1}">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/bb1.png" style="width: 100%; height: 100%;">
					</c:if>
					
				</div>
				
				<!--별점  -->
					<div style=" text-align: center; margin-top: 30px;">
				<c:forEach var="i" begin="1" end="${flo}">
					<a><img class="imgsh" style="cursor: pointer; width: 22px; height: 20px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star22.png"></a>
				</c:forEach>
				<c:if test="${substar eq 1}">
					<a><img class="imgsh" style="cursor: pointer; width: 22px; height: 20px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star23.png"></a>
				</c:if>
					</div>
				
				
				
				<!-- 팔로우가 아니면 팔로우버튼 출력 -->
				<c:if test="${mdata.mem_access eq 0}">
				
				<div style=" height: 100px; margin-top: 60px; text-align: center;">
				
				<c:if test="${fonum.follow_Num eq null}">
				<div>
					<a href="./setinsertFollow?give_storeNum=${msnum}&take_storeNum=${mem_storeNum}&mem_storeNum=${mem_storeNum}"
						class="btn tex" id="pi" style="font-size:25px; color: white; font-weight: bold; "><img class="imgsh" alt="" src="${pageContext.request.contextPath}/resources/images/ff1.png"> <font style="text-shadow:3px 3px 3px rgb(0,0,0);">팔로우</font> </a>
				</div>
				</c:if>
				
				
				<!-- 팔로우 상태라면 언팔버튼 출력  -->
				<c:if test="${fonum.follow_Num ne null}">
				<div>
				<a href="./setDeleteFollow?follow_Num=${fonum.follow_Num}&mem_storeNum=${mem_storeNum}"
						class="btn" id="mi"style="font-size:25px; color: white; font-weight: bold;" ><img class="imgsh" alt="" src="${pageContext.request.contextPath}/resources/images/ff2.png"><font style="text-shadow:3px 3px 3px rgb(0,0,0);">팔로잉</font>   </a>
				</div>
				</c:if>
	
						
				<%-- <a>${fonum.follow_Num}</a> --%><!-- 팔로우 번호   ******  -->
				</div>
				</c:if>
			</div>
		</div>
		<!-- div 2번  -->
		
		<div style="border: 0px solid black; width: 680px; height: 330px; float: left; font-size: large;">

			<div style="border: 1px solid white; height: 80px; margin-bottom: 1px; margin-top: 2px;">

				<c:if test="${mdata.mem_access eq 0}">
				<div style="margin-top: 3%;">
				<span style="font-size: 22px; font-weight: bold;">${mem_storeName }</span>
				</div>	
				</c:if>
				<c:if test="${mdata.mem_access eq 1}">
				<div style="margin-top: 3%;">
				<h2>차단 회원 입니다.</h2>
				</div>	
				</c:if>
				<c:if test="${mdata.mem_storeNum eq null}">
				<div style="margin-top: 3%;">
				<h2>Nan</h2>
				</div>	
				</c:if>
		<hr>
			</div>

			<div style="border: 1px solid white; height: 80px; margin-bottom: 1px; margin-top: 2px;">
			<div style="margin-top: 3%;">
				<span style="font-size: 17px;" class="days" title="${getregDate}">
				<img class="imgsh2" alt="" src="${pageContext.request.contextPath}/resources/images/shopopen.png" width="19px;" height="19px;">
				 &nbsp;상점오픈일 : <span class="ddays"></span>&nbsp;&nbsp;&nbsp;&nbsp;
				 <img class="imgsh2" alt="" src="${pageContext.request.contextPath}/resources/images/shopsell.png" width="19px;" height="19px;">
				 &nbsp;상품판매 : ${myselco} 회
				 
				
				 </span>
			</div>	
			<hr>
			</div>

			<div style="border: 1px solid white; height: 80px; margin-bottom: 1px; margin-top: 2px; " >
			<c:if test="${avg eq 0.0}">
			<div style="margin-top: 3%;">
				<c:if test="${mdata.mem_storeNum eq null}">
				<h2>Nan</h2>
				</c:if>
				<c:if test="${mdata.mem_storeNum ne null}">
			<span style="font-size: 22px;"> 거래내역이 없습니다. </span>			
				</c:if>
			</div>	
			</c:if>
			  
			<c:if test="${avg ne 0.0}">
			<div style="margin-top: 3%;">
			<span style="font-size: 22px;">평점 :  <span style="color: blue;">${avg}</span> </span>
			</div>	
			</c:if>
			<hr>
			</div>

			<div style="border: 1px solid white; height: 80px; margin-bottom: 1px; margin-top: 2px; overflow: none;">
			<c:if test="${mdata.mem_access eq 0}">
			<div style="margin-top: 3%;">
			<span style="font-size: 22px;">
			<img class="imgsh2" alt="" src="${pageContext.request.contextPath}/resources/images/ad_logo.png" width="25px;" height="25px;">	${mdata.mem_address}
			</span>
			</div>	
			</c:if>
			<c:if test="${mdata.mem_access eq 1}">
			
			<h6><font color="red"><b>※ 신고누적으로 인한 차단으로 전화번호와 이메일이 공개 됩니다. (버튼을 누르세요)</b></font></h6>
			
			<span class="btn"data-toggle="collapse" data-target="#phone"style="font-size: 20px;">전화번호
			 <span id="phone" class="collapse" style="float: right; font-size: 20px;">
    			: ${mdata.mem_phone}
			 </span>
			 </span>
			
			
			<span class="btn"data-toggle="collapse" data-target="#email" style="font-size: 20px;">이메일
			 <span id="email" class="collapse" style="float: right; font-size: 20px;">
    			 : ${mdata.mem_email} 
			</span>
			</span>
			
			</c:if>
				
			<%-- 	${mdata.mem_email}
				${mdata.mem_phone} --%>
				<hr>
			</div>
		</div>
	</div>
		</c:if>

</div>
<h2></h2>

<script type="text/javascript">

function update_storeName(){
	$(".update").css("display","none");
	$(".update_form").css("display","block");
	
}


$(".button4").click(function(){
console.log("ff");
var num = $(this).attr("title");
	
});


/* 날짜 계산  */
var days = $(".days").attr("title");
var date = new Date(); 
var year = date.getFullYear(); 
var month = new String(date.getMonth()+1); 
var day = new String(date.getDate()); 

// 한자리수일 경우 0을 채워준다. 
if(month.length == 1){ 
  month = "0" + month; 
} 
if(day.length == 1){ 
  day = "0" + day; 
} 


var tod = year + "-" + month + "-" + day;
console.log(days);
console.log(tod);

var nal = new Date(tod) - new Date(days);
console.log(nal);

var cho = 24 * 60 * 60 * 1000;
console.log(parseInt(nal / cho)+"일");

$(".ddays").text(parseInt(nal / cho)+"일 전");

// 날짜계산

</script>
