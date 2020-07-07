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

<style type="text/css">
.f{
display: none;
}
.c{
display: none;
}
.n{
display: none;
}
.cc{
display: none;
}
.p{
display: none;
}
.cbtn{
width: 114.444444px;
height:50px;
float: left;
}

.cbtn:hover {
	background-color: yellow;
}

</style>


</head>
<body>
	<c:import url="./template/woozoo_nav_index.jsp"></c:import>


	<!-- 메인페이지시작 -->
<div style="width: 1030px; margin-left: 440px; margin-top:50px; background-color: yellow;">
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
    <li data-target="#myCarousel" data-slide-to="5"></li>
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
      <img src="${pageContext.request.contextPath}/resources/images/adv_3.png" alt="">
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
	

	
</div>

	<div style="width: 1030px; height:20px; margin-left: 440px; margin-top:50px;">
	<button id="c0_btn" class="cbtn">패션잡화</button>
	<button id="c1_btn" class="cbtn">여성의류</button>
	<button id="c2_btn" class="cbtn">남성의류</button>
	<button id="c3_btn" class="cbtn">디지털/가전</button>
	<button id="c4_btn" class="cbtn">생활/문구/가구/식품</button>
	<button id="c5_btn" class="cbtn">유아동/출산</button>
	<button id="c6_btn" class="cbtn">스타굿즈</button>
	<button id="c7_btn" class="cbtn">스포츠/레저</button>
	<button id="c8_btn" class="cbtn">뷰티/미용</button>
	</div>
	<div style="background-color: red;">
	<div id="c0_title" style="width: 1030px; height:20px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">
	패션잡화
	<a href="/product/productList?kind=sk&search=패션잡화"><font>전체보기</font></a>
	</div>
	<div id="c0" style="height: 650px;"></div>
	
	<div id="c1_title" style="width: 1030px; height:20px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">
	여성의류
	<a href="/product/productList?kind=sk&search=패션잡화"><font>전체보기</font></a>
	</div>
	<div id="c1" style="height: 650px;"></div>
	
	<div id="c2_title" style="width: 1030px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">
	남성의류
	<a href="/product/productList?kind=sk&search=패션잡화"><font>전체보기</font></a>
	</div>
	<div id="c2"></div>
	
	<div id="c3_title" style="width: 1030px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">
	디지털/가전
	<a href="/product/productList?kind=sk&search=패션잡화"><font>전체보기</font></a>
	</div>
	<div id="c3"></div>
	
	<div id="c4_title" style="width: 1030px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">
	생활/문구/가구/식품
	<a href="/product/productList?kind=sk&search=패션잡화"><font>전체보기</font></a>
	</div>
	<div id="c4"></div>
	
	<div id="c5_title" style="width: 1030px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">
	유아동/출산
	<a href="/product/productList?kind=sk&search=패션잡화"><font>전체보기</font></a>
	</div>
	<div id="c5"></div>
	
	<div id="c6_title" style="width: 1030px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">
	스타굿즈
	<a href="/product/productList?kind=sk&search=패션잡화"><font>전체보기</font></a>
	</div>
	<div id="c6"></div>
	
	<div id="c7_title" style="width: 1030px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">스포츠/레저</div>
	<div id="c7"></div>
	
	<div id="c8_title" style="width: 1030px; margin-left: 440px; margin-top:50px; background-color: yellow;border-top: 1px solid black;">뷰티/미용</div>
	<div id="c8"></div>
	</div>
	<c:import url="../template/footer_index.jsp"></c:import>



	<script type="text/javascript">

		$(".carousel").carousel({interval:3000});

		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=패션잡화",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c0").html(Parse_data); //div에 받아온 값을 넣는다.
/* 		                alert("통신 데이터 값 : " + Parse_data); */
		            }
		             
		        });
		    });

		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=여성의류",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c1").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });

		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=남성의류",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c2").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });


		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=디지털/가전",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c3").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });

		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=생활/문구/가구/식품",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c4").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });

		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=유아동/출산",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c5").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });

		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=스타굿즈",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c6").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });

		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=스포츠/레저",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c7").html(Parse_data); //div에 받아온 값을 넣는다.
		            }
		             
		        });
		    });

		  $(document).ready(function(){
		    	
		        $.ajax({
		            type : "GET", //전송방식을 지정한다 (POST,GET)
		            url : "product/productList?kind=sk&search=뷰티/미용",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		            error : function(){
		                alert("통신실패!!!!");
		            },
		            success : function(Parse_data){
		                $("#c8").html(Parse_data); //div에 받아온 값을 넣는다.
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


		    </script>




</body>
</html>