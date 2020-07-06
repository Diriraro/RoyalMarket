<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test님의 코인 충전</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
.wrap1{
	width: 100%;
	
}

</style>
</head>
<body>
	<div style="width: 100%; height:50px ;background-color: #5c2392;"class="wrap1" >
		<div style="color:white; font-size: x-large; text-align: center; line-height:50px;"><b style="margin-top: 100px;">포인트 충전하기</b></div>
	</div>
	
	<div class="container">
		<div style="border: 1px solid black; display: block; height:50px; border-radius: 4px; margin-top:30px;">
			<div style="display: inline-block; float: left; margin-top: 4px; margin-left: 3px;"><h4><b>현재 ${member.mem_id}님의 보유 포인트</b></h4></div>
			<div style="display: inline-block; float: right; margin-top: 4px; margin-right: 3px; "> <h4><b> ${point}원 </b></h4></div>
		</div>
		
		<h3>충전 선택</h3>
		<div style="width: 100%; height: 50px;">
			<div style="float: left; height: 30px; width: 80px; border-radius:4px; background-color: #00e6e6; text-align: center; line-height: 30px; ">카카오페이</div>
		</div>
		
		<form action="/payment/pay" method="get" id="frm">
			<div style=" height: 20px; width: 70px; margin-top: 35px; float: left;"><b>충전 금액</b> </div>
			<div><input type="text" id="amount" name="amount" style="height:40px; border-radius: 4px; margin-top:30px;"></div>
			<hr>
			<div class="container">
				·포인트는 우주마켓에서만 이용 가능합니다.<br>
				·우주마켓 포인트로 카카오캐시로 환전 및 환불이 불가능합니다.<br>
			</div>
			
			<div style="margin-top: 15px;"><input class="check" type="checkbox" id="check1">&nbsp; 충전 내용을 확인하였고 유료 서비스약관에 동의 합니다.</div>
			<div><input class="check" type="checkbox" id="check2">&nbsp; 우주마켓 포인트 이용 약관에 동의합니다.</div>

			<div><button type="submit" style="background-color: #5c2392; height: 30px; color: white; margin-top:15px; float: left"; id="goCharge">충전하기</button></div>
		</form>

	</div>
	
<script type="text/javascript">
	var result1= false;
	var result2 = false;

	$("#check1").click(function(){
		result1 = true;

		if(!check1.checked){
				result1=false;
				
		}

	});

	$("#check2").click(function(){
		result2 = true;

		if(!check2.checked){
				result2=false;
				
		}
	
	});
	


	$("#goCharge").click(function(){
		var amount = $("#amount").val();
	
				
		if(result1==false || result2==false){
			alert("이용약관을 모두 체크해 주세요");
			 return false;
		}else if(result1==false && result2==false){
			alert("이용약관을 모두 체크해 주세요");
			 return false;
			}
		else if(amount==""){
			alert("충전할 금액을 입력하세요");
			return false;
		}else{
			$("#frm").submit();
		}
	});

</script>
	
</body>
</html>