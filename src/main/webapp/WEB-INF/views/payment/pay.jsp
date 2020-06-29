<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>


<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<%-- <title>/${member.id} 님의 결제  </title> --%>
<title>Test 결제창</title>
<c:import url="../template/boot.jsp"></c:import>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

<script>   
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp92077235'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용   imp92077235  << 내꺼 제출전 에 pg 리스트 추가
        var msg;

        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'WooJoo Market',
            amount : ${amount},					// 금액 
            buyer_email : '${member.mem_email}', 
            buyer_name : '${member.mem_name}',			
            buyer_tel : '${member.mem_phone}',		
            buyer_addr : '${member.mem_address}',			
            buyer_postcode : '123-456',     // 우편번호 ???
           // m_redirect_url : 'www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/payment/paySuccess?amount=${amount}&mem_point=${member.mem_point}&mem_id=${member.mem_id}&key=${key}';
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href='<%=request.getContextPath()%>/payment/payFail';
                alert(msg);
            }
        });
        
    });
    function noEvent() { // 새로 고침 방지
        if (event.keyCode == 116) {
            alert("새로고침불가.");
            event.keyCode = 2;
            return false;
        } else if (event.ctrlKey
                && (event.keyCode == 78 || event.keyCode == 82)) {
            return false;
        }
    }
document.onkeydown = noEvent;

    </script>
 
</body>
</html>