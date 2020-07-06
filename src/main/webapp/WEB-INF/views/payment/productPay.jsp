<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<c:import url="../template/woozoo_nav.jsp"></c:import>
	<c:import url="../template/style.jsp"></c:import>

	<div class="container">
		<br><br><br>
		<font style="font-size: x-large;"><b>주문</b></font>
		<hr style="border: solid 1px #5c2392;">
		<br><br><br><br>
		
		<div style="border: 1px solid white">
			<font style="font-size: x-large;"><b>상품 정보</b></font>
			
			<hr style="border: solid 1px #5c2392;">
			<div style="width: 385px; height: 500px; border: 2px solid #5c2392; background-color display: inline-block; float: right;">
			<form action="./productTrading" method="post">

				<div style="margin-top: 10px;">
					<font style="color: red; font-size: large; margin-left: 10px; float: left"><b>총 상품 금액</b></font>
					<font style="color: red; font-size: large; margin-right: 10px; float: right;"><b>${sell_price}  원</b></font>
					<br><br><br>
				</div>
				<div style="margin-top:30px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>배송비</b></font>
					<font style="color: red; font-size: large; margin-right: 10px; float: right;"><b>2500  원</b></font> 	
				</div>
				<hr style="border: solid 1px #e4e4e4;">
				
				<div style="margin-top:20px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>적립금</b></font>
					<font style="color: blue; font-size: large; margin-right: 10px; float: right;"><b>${cash.mem_cash}  원</b></font>
				</div>
				<div>
				<br>
					<b>
					<input type="text" numberOnly value="0" id="cashAmount" style="float: left; margin-left: 15px; width: 100px;" placeholder="사용할 적립금">
					<fmt:parseNumber var="test" value="0" integerOnly="true"/>
					<input type="button" class="btn btn-success" id="useCash" value="사용하기">
					<input type="button" class="btn btn-primary" id="useAll" value="전부 사용">
					</b>
				</div>
				<hr style="border: solid 1px #e4e4e4;">
				
				<div style="margin-top:20px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>보유하신 포인트</b></font>
					<font style="color: blue; font-size: large; margin-right: 10px; float: right;"><b>${point}  원</b></font> 
				</div>
				
				
				<hr style="border: solid 1px #e4e4e4;">
				
				<div style="margin-top:20px; height: 20px;">
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>결제 예정 포인트</b></font>
					<font style="color: red; font-size: large; margin-right: 10px; float: right;">
					<b><input type="text" id="sprice" style="color: red; font-size: large; 
							width: 100px; border: white; background: white; text-align: right;" value="${sell_price+2500}" 
							disabled="disabled"> 원</b></font> 	<!-- 값이 바뀌어야되므로 input속성 -->
				</div>
				<div>
				<br>
					<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>사용하는 적립금</b></font>
					<font style="color: blue; font-size: large; margin-right: 10px; float: right;">
					<b><input type="text" id="scash" style="color: blue; font-size: large; 
							width: 100px; border: white; background: white; text-align: right;" value="0" 
							disabled="disabled"> 원</b></font> <!-- 값이 바뀌어야되므로 input속성 -->
				</div>
				   <br>
				<c:if test="${point lt sell_price+2500-cash.mem_cash}">	<!-- 포인트+적립금이 구매금액보다 적을경우 -->
					<div style="margin-top:20px; height: 20px;">
						<font style="color: red; font-size: large; margin-left: 10px; float: left;"><b>포인트가 부족합니다!!</b></font> 	
					</div>
					<div style="margin-top: 10px;">	
						<button type="button" class="btn btn-danger" id="pointCharge" style="float: right; margin-right: 10px; margin-top: 5px;">포인트 충전하기</button>
					</div>
				</c:if>
					<c:if test="${point ge sell_price-test+2500-cash.mem_cash}">	<!-- 포인트+적립금이 구매금액보다 많거나 같을경우 -->
					<div style="margin-top:20px; height: 20px;">
						<font style="color: black; font-size: large; margin-left: 10px; float: left"><b>결제 후 잔여 포인트</b></font>
						<font style="color: blue; font-size: large; margin-right: 10px; float: right;"><b>
						<input type="text" id="spoint" style="color: blue; font-size: large; 
							width: 100px; border: white; background: white; text-align: right;" value="${point-(sell_price+2500)}" 
							disabled="disabled"> 원</b></font> 	<!-- 값이 바뀌어야되므로 input속성 -->
					</div>
					<div style="margin-top: 10px;">
						<button type="button" class="btn btn-primary" id="productPay" style="float: right; margin-right: 10px; margin-top: 5px;">상품 결제하기</button>
					</div>
				</c:if>
				<!-- post parameter -->
				<input type="hidden" id="cash" name="cash" value="0">							
				<input type="hidden" id="sel_price" name="sell_price" value="${sell_price+2500}">
				<input type="hidden" id="sel_num" name="sell_num" value="${sell_num}">
				<!-- cash 		: 차감되는 적립금
					 sel_price 	: 차감되는 포인트 -->
			</form>	
	
			</div>
			<div style="width: 715px; height: 500px; margin-right:15px; display: inline-block; float: left;">
				<table class="table" style="margin-top: 10px;">
					<tr style="border-top: 2px solid black; border-bottom:2px solid black; text-align: center; background-color:#c2d6d6; ">
						<td>상풍 정보</td>
						<td>상품 금액</td>
						<td style="width: 15%">적립 예정</td>
						<td style="width: 10%;">배송비</td>
					</tr>
					<tr style="height: 250px; text-align: center; font-size: 25px; border-bottom: 1px solid #e4e4e4;">
						<td style="text-align: left; border-right: 1px solid #e4e4e4;">
							<div style="display: inline-block;"><img alt="images" src="${pageContext.request.contextPath}/upload/product/${image}" style="width: 200px; height: 200px;"></div>					
							<div style="display: inline-block;">&nbsp;&nbsp;&nbsp;${sell_product}</div>
							</td>
						<td style="vertical-align: middle; border-right: 1px solid #e4e4e4;">${sell_price}</td>
						<td style="vertical-align: middle; border-right: 1px solid #e4e4e4; color: red"><b>test</b></td>
						<td style="vertical-align: middle ;">2500</td>
					</tr>
				</table>
			</div>
		</div>

</div>	
		


<script type="text/javascript">
	$("#pointCharge").click(function(){
		location.href="javascript:popup()";
	})	
	/* $("#productPay").click(function() {
		var check = confirm("상품을 결제 하시겠습니까?");
		if(check){
			location.href="./productTrading?sell_num=${sell_num}&sell_price=${sell_price}";
		}
	}); */

	$("input:text[numberOnly]").on("keyup", function() {	//input에 숫자만 입력
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});

	$('input[type="text"]').keydown(function() {			//input에서 엔터키 막기
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
	
	function popup(){
	    var url = "payment/pointCharge";
	    var name = "포인트 충전";
	    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	    window.open(url, name, option);
	}
			

	$("#cashAmount").click(function(){		// input 클릭시에 기본값 0 없애기
		if($(this).val()==0){
			$(this).val('');
		}
	})
	$("#cashAmount").blur(function(){		// 100원 미만 절사 & 입력 안했을시 기본값
		if($(this).val()==''){
			$(this).val('0');
		}else{
			$(this).val(Math.floor($(this).val()/100) * 100);
		}
	})

	$("#useAll").click(function(){
		var check = confirm("적립금을 전부 사용하시겠습니까?")
		
		if(check){
			
			var cash = ${cash.mem_cash};						// 보유 적립금
			var sell_price= ${sell_price+2500};					// 현재 가격+배송비
			var point = ${point};								// 보유 포인트
			
			if(cash>=${sell_price+2500}){						// 사용하는 적립금이 결제금액보다 많을경우
				
				$("#cashAmount").val(sell_price);				// 적립금 적는 input
				$("#cash").val(sell_price);						// 파라미터로 넘겨주는 적립금
				$("#scash").val(sell_price);					// 사용하는 적립금 표시
				$("#sprice").val('0');							// 결제 예정 포인트 표시
				$("#sel_price").val('0');						// 파라미터로 넘겨주는 결제포인트
				$("#spoint").val(point);						// 결제 후 잔여 포인트 표시
				alert("적용되었습니다.");
			}else{
				
				$("#cashAmount").val(cash);						// 적립금 적는 input
				$("#cash").val(cash);							// 파라미터로 넘겨주는 적립금
				$("#scash").val(cash);							// 사용하는 적립금 표시
				$("#sprice").val(sell_price-cash);				// 결제 예정 포인트 표시
				$("#sel_price").val(sell_price-cash);			// 파라미터로 넘겨주는 결제포인트
				$("#spoint").val(point-sell_price+cash);		// 결제 후 잔여 포인트 표시
				alert("적용되었습니다.");
			}
		}
	})
	
	$("#useCash").click(function(){
		var cashAmount = $("#cashAmount").val()*1;				// input에 적힌 숫자
		var cash = ${cash.mem_cash};							// 보유 적립금
		if(cashAmount<=cash){
			
			var check = confirm("적립금을 "+cashAmount+" 만큼 사용하시겠습니까?")
			if(check){
				var sell_price= ${sell_price+2500};
				var point = ${point};
							
				if(cashAmount>${sell_price+2500}){
					
					alert("판매가격보다 많은 적립금을 사용할 수 없습니다.");
					$("#cashAmount").val(sell_price);				// 적립금 적는 input
					$("#cash").val(sell_price);						// 파라미터로 넘겨주는 적립금
					$("#scash").val(sell_price);					// 사용하는 적립금 표시
					$("#sprice").val('0');							// 결제 예정 포인트 표시
					$("#sel_price").val('0');
					$("#spoint").val(point);						// 결제 후 잔여 포인트 표시
					
				}else{
					
					$("#cash").val(cashAmount);
					$("#scash").val(cashAmount);
					$("#sprice").val(sell_price-cashAmount);		// 결제 예정 포인트 표시
					$("#sel_price").val(sell_price-cashAmount);
					$("#spoint").val((point-sell_price)+cashAmount);		// 결제 후 잔여 포인트 표시
					alert("적용되었습니다.");
				}
			}
		}else{
			alert("보유 적립금을 초과합니다.")
			$("#cashAmount").val('0');
		}
		
	})
	
	$("#productPay").click(function(){
		if($("#spoint").val()>=0){						//포인트를 다 쓰던 적립금을 합치던 어떻게든 마이너스가 나오면 결제 안됨 / 남은 포인트가 0 이상이면 결제됨
			$("#productPay").attr("type","submit");
		}else{
			alert("포인트가 부족하여 결제할 수 없습니다. 적립금을 사용해주세요.")
		}
	})

</script>
		<c:import url="../template/footer.jsp"></c:import>
</body>
</html>