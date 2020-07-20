<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member.mem_id}님의 포인트 정산 - 우주장터</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
.wrap1{
	width: 100%;
}

</style>
</head>
<body>
	<div style="width: 100%; height:50px ;background-color: #5c2392;"class="wrap1" >
		<div style="color:white; font-size: x-large; text-align: center; line-height:50px;"><b style="margin-top: 100px;">포인트 출금하기</b></div>
	</div>
	
	<div class="container">
		<div style="border: 1px solid black; display: block; height:50px; border-radius: 4px; margin-top:30px;">
			<div style="display: inline-block; float: left; margin-top: 4px; margin-left: 3px;"><h4><b>현재 ${member.mem_id}님의 보유 포인트</b></h4></div>
			<div style="display: inline-block; float: right; margin-top: 4px; margin-right: 3px; "> <h4><b> ${point}원 </b></h4></div>
		</div>
		
			
	
		<form action="/payment/calculate" method="post" id="frm">
			<div style=" height: 20px; width: 70px; margin-top: 35px; float: left; display: inline-block;"><b>출금 계좌</b> </div>
			<div style="display: inline-block;"><input type="text" id="account" name="account" style="height:40px; border-radius: 4px; margin-top:30px;"  placeholder="숫자만 입력해 주세요"></div>
			
			<div style=" height: 20px; width: 60px; margin-top: 35px; margin-left:15px; display: inline-block;"><b>출금 은행</b> </div>
			<div style="display: inline-block;">
				<select name="searchYear" id="searchYear">
					<option value="국민은행">국민은행</option>
					<option value="신한은행">신한은행</option>
					<option value="우리은행">우리은행</option>
					<option value="기업은행">기업은행</option>
					<option value="농협">농협</option>
					<option value="수협">수협</option>
					<option value="카카오뱅크">카카오뱅크</option>
					<option value="KEB하나은행">KEB하나은행</option>
					<option value="SC제일은행">SC제일은행</option>
				</select>

			</div>
			<br>
			
			<div style=" height: 20px; width: 70px; margin-top: 35px; float: left;"><b>출금 금액</b> </div>
			<div><input type="text" id="amount" name="amount" style="height:40px; border-radius: 4px; margin-top:30px; " title="${point}"></div>
			
			<hr>
		
			<div style="margin-top: 15px;"><input class="check" type="checkbox" id="check1">&nbsp; 정산 내용을 확인하였고 정산서비스 약관에 동의 합니다.</div>
			<div><input class="check" type="checkbox" id="check2">&nbsp; 우주마켓 포인트 이용 약관에 동의합니다.</div>

			<div style="text-align: center;">
				<button type="submit" style="background-color: #5c2392; width:100px; height: 30px; color: white; margin-top:15px; display: inline-block; border:1px solid white; border-radius: 10px;"  id="goCharge">출금하기</button>
				<button type="submit" style="background-color: #5c2392; width:100px; height: 30px; color: white; margin-top:15px; display: inline-block; border:1px solid white; border-radius: 10px;"  id="Cancel">취소하기</button>
			</div>
			
		</form>

	</div>
	
<script type="text/javascript">
	var result1= false;
	var result2 = false;

	$("#amount").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	    
	});

	//포인트 초과했을때 alert 띄우기 ()
/* 	$("#amount").on("blur", function() {
		  //console.log($(this).attr("title"));
		    if($(this).val>$(this).attr("title")){
				alert("보유 포인트 초과");
				$(this).val("");
			    }
		}); */

	$("#amount").blur(function(){
		var a = $("#amount").attr("title");
		var b = $("#amount").val();

		if(b>a){
				alert("보유 포인트를 초과합니다.");
				$("#amount").value="";
				$("#amount").val('');
			}
		})
	
	$("#account").on("keyup", function() {
		
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	  
	});
	
	
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

	$("#Cancel").click(function(){
			close();
		})


	$("#goCharge").click(function(){
		var amount = $("#amount").val();
	
				
		if(result1==false || result2==false){
			alert("이용약관을 모두 체크해 주세요");
			 return false;
		}else if(result1==false && result2==false){
			alert("이용약관을 모두 체크해 주세요");
			 return false;
			}
		else if(amount=="" || amount=="0"){
			alert("정산할 금액을 입력하세요");
			return false;
		}else if(amount<1000){
			alert("1000원 이상부터 정산이 가능합니다")
			return false;
		}else{
			$("#frm").submit();
		}
	});

</script>
	
</body>
</html>