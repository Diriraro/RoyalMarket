<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.update_form{
	display: none;
}



</style>

<!-- shop 페이지가 공통으로 가져갈곳  -->

<div class="container">
<!-- 모든 컨트롤에서는 이름을 출력해줘야함.  -->
	<%-- <h2>${mem_storeName}</h2>  --%> 
	<%-- <h2>${msname}님 접속중 </h2> --%>
		<c:if test="${msnum eq mem_storeNum }">
	<div style="border: 1px solid black; width: 1024px; height: 340px; border-color: rgba(0,0,0,0.25);">

		<!-- div 1번 -->
		<div style="width: 340px; float: left;">
			<div style="border: 1px solid white; width: 330px; height: 330px; background-size : cover;  background-image: url('${pageContext.request.contextPath}/resources/images/shopback2.jpg');">
				<!-- 사진  -->
				<div style="width: 130px; width: 130px; margin-top: 40px;  margin-left: 30%;border-radius: 70%;overflow: hidden;">
					<!-- 카카오 이미지 확인  -->
					<img alt="" src="${pageContext.request.contextPath}/resources/images/user11.png" style="width: 100%; height: 100%;">
				</div>
				
				<!--별점  -->
					<div style=" text-align: center; margin-top: 22px;">
				<c:forEach var="i" begin="1" end="${flo}">
					<a><img style="cursor: pointer; width: 22px; height: 20px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star22.png"></a>
				</c:forEach>
				<c:if test="${substar eq 1}">
					<a><img style="cursor: pointer; width: 22px; height: 20px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star23.png"></a>
				</c:if>
					</div>
				
				<div style=" height: 100px; margin-top: 60px; text-align: center;">
					
					<a class="zzimbtn btn" style=" font-size: 25px; color: white;"  href="../product/myProductList?kind=sp&mem_storeNum=${member.mem_storeNum}">
				 상품관리</a>
				
				
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
				<span style="font-size: 17px;"><img alt="" src="${pageContext.request.contextPath}/resources/images/date_logo.png"> ${getregDate} </span>
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
			<img alt="" src="${pageContext.request.contextPath}/resources/images/ad_logo.png">	${mdata.mem_address}
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
					<c:if test="${mdata.mem_access eq 0}">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/user11.png" style="width: 100%; height: 100%;">
					</c:if>
					<c:if test="${mdata.mem_access eq 1}">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/bb1.png" style="width: 100%; height: 100%;">
					</c:if>
					
				</div>
				
				<!--별점  -->
					<div style=" text-align: center; margin-top: 30px;">
				<c:forEach var="i" begin="1" end="${flo}">
					<a><img style="cursor: pointer; width: 22px; height: 20px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star22.png"></a>
				</c:forEach>
				<c:if test="${substar eq 1}">
					<a><img style="cursor: pointer; width: 22px; height: 20px;" alt=""
					src="${pageContext.request.contextPath}/resources/images/star23.png"></a>
				</c:if>
					</div>
				
				
				
				<!-- 팔로우가 아니면 팔로우버튼 출력 -->
				<c:if test="${mdata.mem_access eq 0}">
				
				<div style=" height: 100px; margin-top: 60px; text-align: center;">
				
				<c:if test="${fonum.follow_Num eq null}">
				<div>
					<a href="./setinsertFollow?give_storeNum=${msnum}&take_storeNum=${mem_storeNum}&mem_storeNum=${mem_storeNum}"
						class="btn" id="pi" style="font-size:25px; color: white; font-weight: bold;"><img alt="" src="${pageContext.request.contextPath}/resources/images/ff1.png"> 팔로우 </a>
				</div>
				</c:if>
				
				
				<!-- 팔로우 상태라면 언팔버튼 출력  -->
				<c:if test="${fonum.follow_Num ne null}">
				<div>
				<a href="./setDeleteFollow?follow_Num=${fonum.follow_Num}&mem_storeNum=${mem_storeNum}"
						class="btn" id="mi"style="font-size:25px; color: white; font-weight: bold;" ><img alt="" src="${pageContext.request.contextPath}/resources/images/ff2.png">팔로잉    </a>
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
		<hr>
			</div>

			<div style="border: 1px solid white; height: 80px; margin-bottom: 1px; margin-top: 2px;">
			<div style="margin-top: 3%;">
				<span style="font-size: 17px;">상점오픈일  :: ${getregDate }</span>
			</div>	
			<hr>
			</div>

			<div style="border: 1px solid white; height: 80px; margin-bottom: 1px; margin-top: 2px; " >
			<c:if test="${avg eq 0.0}">
			<div style="margin-top: 3%;">
			<span style="font-size: 22px;"> 거래내역이 없습니다. </span>			  
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
			 거래장소 :${mdata.mem_address}
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







</script>
