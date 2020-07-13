<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"></c:import>
<c:import url="./template/style.jsp"></c:import>

<style type="text/css">
.cbtn{
width: 128.5555555px;
height:50px;
float: left;
border: 0px;
border-right:solid 1px #f9f9f9;
border-left:solid 1px #f9f9f9;
background-color: white;
color: #888888;
font-weight: 600;
}
.cbtn:hover {
	background-color: #5c2392;
	color: white;
}
a:hover { text-decoration:none !important }
</style>


</head>
<body>
	<c:import url="./template/woozoo_nav.jsp"></c:import>
	<input type="hidden" value="${member.mem_id}" id="memberID">


	<!-- 메인페이지시작 -->
<div style="width: 1030px; margin-left: 440px; ">
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="${pageContext.request.contextPath}/resources/images/adv.png" alt="">
    </div>

    <div class="item">
      <img src="${pageContext.request.contextPath}/resources/images/adv_2.png" alt="">
    </div>

    <div class="item">
      <img src="${pageContext.request.contextPath}/resources/images/adv_6.png" alt="">
    </div>
    
        <div class="item">
      <img src="${pageContext.request.contextPath}/resources/images/adv_4.png" alt="">
    </div>

    <div class="item">
      <img src="${pageContext.request.contextPath}/resources/images/adv_5.png" alt="">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
	</div>
	
	<div id="rec" class="listBox" style=""></div>
	

	
</div>
	<div style="background-color: #f9f9f9;">
	<br><br>
	<font style="margin-left: 440px;font-size: 25px;font-weight: 500;color: black;">카테고리별 상품</font>
	<div style="width: 1030px; height:20px; margin-left: 440px;margin-top: 20px;">
	<button id="c0_btn" class="cbtn">패션잡화</button>
	<button id="c1_btn" class="cbtn">여성의류</button>
	<button id="c2_btn" class="cbtn">남성의류</button>
	<button id="c3_btn" class="cbtn">디지털/가전</button>
	<button id="c6_btn" class="cbtn">스타굿즈</button>
	<button id="c7_btn" class="cbtn">스포츠/레저</button>
	<button id="c8_btn" class="cbtn">뷰티/미용</button>
	<button id="c4_btn" class="cbtn">기타</button>
	</div>
	<br>
	
	<div id="c0_title" style="width: 1030px; height:20px; margin-left: 440px; margin-top:50px;">
	<font style="font-size: 20px;font-weight:bold; ;color: #212121;">패션잡화</font>
	<a href="/product/productList?kind=sk&search=패션잡화">
	<font style="font-size: 20px;font-weight:bold; ;color: #cccccc;">&nbsp;전체보기</font></a>
	</div>
	<br>
	<div id="c0" class="listBox" style="height: 650px;"></div>
	
	<div id="c1_title" style="width: 1030px; height:20px; margin-left: 440px; margin-top:50px;border-top: 1px solid #e5e5e5;">
	<br><br>
	<font style="font-size: 20px;font-weight:bold; ;color: #212121;">여성의류</font>
	<a href="/product/productList?kind=sk&search=여성의류">
	<font style="font-size: 20px;font-weight:bold; ;color: #cccccc;">&nbsp;전체보기</font></a>
	</div>
	<br><br><br>
	<div id="c1" class="listBox" style="height: 650px;"></div>
	
	<div id="c2_title" style="width: 1030px; margin-left: 440px; margin-top:50px;border-top: 1px solid #e5e5e5;">
	<br><br>
	<font style="font-size: 20px;font-weight:bold; ;color: #212121;">남성의류</font>
	<a href="/product/productList?kind=sk&search=남성의류">
	<font style="font-size: 20px;font-weight:bold; ;color: #cccccc;">&nbsp;전체보기</font></a>
	</div>
	<br><br><br>
	<div id="c2" class="listBox" style="height: 650px;"></div>
	
	<div id="c3_title" style="width: 1030px; margin-left: 440px; margin-top:50px;border-top: 1px solid #e5e5e5;">
	<br><br>
	<font style="font-size: 20px;font-weight:bold; ;color: #212121;">디지털/가전</font>
	<a href="/product/productList?kind=sk&search=디지털/가전">
	<font style="font-size: 20px;font-weight:bold; ;color: #cccccc;">&nbsp;전체보기</font></a>
	</div>
	<br><br><br>
	<div id="c3" class="listBox" style="height: 650px;"></div>
	
	<div id="c6_title" style="width: 1030px; margin-left: 440px; margin-top:50px;border-top: 1px solid #e5e5e5;">
	<br><br>
	<font style="font-size: 20px;font-weight:bold; ;color: #212121;">스타굿즈</font>
	<a href="/product/productList?kind=sk&search=스타굿즈">
	<font style="font-size: 20px;font-weight:bold; ;color: #cccccc;">&nbsp;전체보기</font></a>
	</div>
	<br><br><br>
	<div id="c6" class="listBox" style="height: 650px;"></div>
	
	<div id="c7_title" style="width: 1030px; margin-left: 440px; margin-top:50px;border-top: 1px solid #e5e5e5;">
	<br><br>
	<font style="font-size: 20px;font-weight:bold; ;color: #212121;">스포츠/레저</font>
	<a href="/product/productList?kind=sk&search=스포츠/레저">
	<font style="font-size: 20px;font-weight:bold; ;color: #cccccc;">&nbsp;전체보기</font></a>
	</div>
	<br><br><br>
	<div id="c7" class="listBox" style="height: 650px;"></div>
	
	<div id="c8_title" style="width: 1030px; margin-left: 440px; margin-top:50px;border-top: 1px solid #e5e5e5;">
	<br><br>
	<font style="font-size: 20px;font-weight:bold; ;color: #212121;">뷰티/미용</font>
	<a href="/product/productList?kind=sk&search=뷰티/미용">
	<font style="font-size: 20px;font-weight:bold; ;color: #cccccc;">&nbsp;전체보기</font></a>
	</div>
	<br><br><br>
	<div id="c8" class="listBox" style="height: 650px;"></div>
	
	<div id="c4_title" style="width: 1030px; margin-left: 440px; margin-top:50px;border-top: 1px solid #e5e5e5;">
	<br><br>
	<font style="font-size: 20px;font-weight:bold; ;color: #212121;">기타</font>
	<a href="/product/productList?kind=sk&search=기타">
	<font style="font-size: 20px;font-weight:bold; ;color: #cccccc;">&nbsp;전체보기</font></a>
	</div>
	<br><br><br>
	<div id="c4" class="listBox" style="height: 650px;"></div>
	
	</div>
	<c:import url="./template/footer.jsp"></c:import>



	<script type="text/javascript">
		$(".carousel").carousel({interval:3000});
  		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/homeProductList?curPage=1&kind=sk&search=패션잡화",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패1");
		            },
		            success : function(Parse_data){
		                $("#c0").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    }); 
		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/homeProductList?kind=sk&search=여성의류",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패2");
		            },
		            success : function(Parse_data){
		                $("#c1").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });
		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/homeProductList?kind=sk&search=남성의류",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패3");
		            },
		            success : function(Parse_data){
		                $("#c2").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });
		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/homeProductList?kind=sk&search=디지털/가전",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패4");
		            },
		            success : function(Parse_data){
		                $("#c3").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });
		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/homeProductList?kind=sk&search=기타",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패5");
		            },
		            success : function(Parse_data){
		                $("#c4").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });
		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/homeProductList?kind=sk&search=스타굿즈",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패6");
		            },
		            success : function(Parse_data){
		                $("#c6").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });
		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/homeProductList?kind=sk&search=스포츠/레저",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패7");
		            },
		            success : function(Parse_data){
		                $("#c7").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });
		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/homeProductList?kind=sk&search=뷰티/미용",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패8");
		            },
		            success : function(Parse_data){
		                $("#c8").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    }); 
		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/recProductList",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패9");
		            },
		            success : function(Parse_data){
		                $("#rec").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });
		        
		        $("#c0_btn").on("click",function(){
		        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
		        var location = document.querySelector("#c0_title").offsetTop;
		        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
		        });
		        $("#c1_btn").on("click",function(){
			        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
			        var location = document.querySelector("#c1_title").offsetTop;
			        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			        });
		        $("#c2_btn").on("click",function(){
			        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
			        var location = document.querySelector("#c2_title").offsetTop;
			        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			        });
		        $("#c3_btn").on("click",function(){
			        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
			        var location = document.querySelector("#c3_title").offsetTop;
			        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			        });
		        $("#c4_btn").on("click",function(){
			        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
			        var location = document.querySelector("#c4_title").offsetTop;
			        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			        });
		        $("#c5_btn").on("click",function(){
			        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
			        var location = document.querySelector("#c5_title").offsetTop;
			        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			        });
		        $("#c6_btn").on("click",function(){
			        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
			        var location = document.querySelector("#c6_title").offsetTop;
			        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			        });
		        $("#c7_btn").on("click",function(){
			        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
			        var location = document.querySelector("#c7_title").offsetTop;
			        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			        });
		        $("#c8_btn").on("click",function(){
			        var menuHeight = document.querySelector("#header_wrap").offsetHeight;
			        var location = document.querySelector("#c8_title").offsetTop;
			        window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			        });
		        
		        $(function() {
			        var member = $("#memberID").val().trim();
			        if(member != ""){
					$(".listBox").on("click",".qqq",function() {
						var sell_num = $(this).prop("title");
 						var myCookie = getCookie("recentSearch");
						if (myCookie == null) {
							setCookie("recentSearch", sell_num, 1)
						} else {
							sell_num += "/" + myCookie;
							setCookie("recentSearch", sell_num, 1)
						} 
					})
			        }
				})

				function setCookie(key, value, expiredays) {
					var todayDate = new Date();
					todayDate.setDate(todayDate.getDate() + expiredays);
					document.cookie = key + "=" + escape(value) + "; path=/; expires="
							+ todayDate.toGMTString() + ";"
				}
				function getCookie(cname) {
					var name = cname + "=";
					var decodedCookie = decodeURIComponent(document.cookie);
					var ca = decodedCookie.split(';');
					for (var i = 0; i < ca.length; i++) {
						var c = ca[i];
						while (c.charAt(0) == ' ') {
							c = c.substring(1);
						}
						if (c.indexOf(name) == 0) {
							return c.substring(name.length, c.length);
						}
					}
					return null;
				}
		    </script>
</body>
</html>