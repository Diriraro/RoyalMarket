<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<script>
		var sell_num = '${vo.sell_num}'; //게시글 번호

		$('[name=qnaInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
			var insertData = $('[name=qnaInsertForm]').serialize(); //qnaInsertForm의 내용을 가져옴
			qnaInsert(insertData); //Insert 함수호출(아래)
		});

		

		//댓글 목록 
		function qnaList() {
			$
					.ajax({
						url : '/productQna/qnaList',
						type : 'get',
						data : {
							'sell_num' : sell_num
						},
						success : function(data) {
							var a = '';
							$.each(data,function(key, value) {
												var pqsnum = value.pq_storeNum;
												var pqnum = value.pq_num;
												a += '<div class="qnaArea" style="width:630px; border-bottom:1px solid #e2e2e2; margin-bottom: 15px;">';
												a += '<div class="qnaInfo'+value.pq_num+'">';
												//상점연결하기
												a += '<a href='
														+ "../shop/myshop?mem_storeNum="+pqsnum
														+ ' style="color: #ababab; font-size: 14px; font-weight: 600;">'
														+ value.pq_storeName
														+ '  </a><font style="color: #ababab;margin-left:480px;">'+ value.pq_regDate+ '</font> ';
												a += '<input type="hidden" id="pq_storeNum" value="'+pqsnum+'" />'
												a += '<input type="hidden" id="mem_storeNum" value="${member.mem_storeNum}" />'
												
												a += '<div class="qnaContents'+value.pq_num+'"> <p style="margin-top: 7px;"> 내용 : '
														+ value.pq_contents
														+ '</p>';
												a += '<button style="border: 0px;" class="reply" value="'+value.pq_storeName+'" ><img style="cursor: pointer;" alt="" src="${pageContext.request.contextPath}/resources/images/pqna_logo.png"></button>';
												a += '<a id="qq" onclick="qnaDelete('+ value.pq_num+ ');"><img style="cursor: pointer;" alt="" src="${pageContext.request.contextPath}/resources/images/pqnad_logo.png"></a></div>';
												a += '</div></div>';
											/* 	
												$(document).on('click', '#'+value.pq_num+'', function() {
													var a = value.pq_storeNum; 
													var b = ${member.mem_storeNum};	
													if(a == b){ 
														alert("일치"); 
														}else if(b != a){ 
														alert('불일치'); 
														return false;
														stopPropagation();
														}else { c
														console.log('모든 조건을 만족하지 않습니다.'); }
													}); 			 */
	

												});

							$(".qnaList").html(a);
						}
					});
		}

		//댓글 등록
		function qnaInsert(insertData) {
			var qnacontents = $("#pq_contents").val().trim();
			if (qnacontents == "") {
				alert("문의사항을 입력해주세요");
				stopPropagation();
			} else {
				$.ajax({
					url : '/productQna/qnaInsert',
					type : 'post',
					data : insertData,
					success : function(data) {
						if (data == 1) {
							qnaList(); //댓글 작성 후 댓글 목록 reload
							$('[name=pq_contents]').val('');
						}
					}
				});
			}
		}

		//댓글 삭제 
		function qnaDelete(sell_num,) {
			var pq_storeNum = $("#pq_storeNum").val()
			var mem_storeNum = $("#mem_storeNum").val()
			if(pq_storeNum!=mem_storeNum){
				alert("자신의 댓글만 삭제할 수 있습니다.");
				stopPropagation();
				}else{
			$.ajax({
				url : '/productQna/qnaDelete/' + sell_num,
				type : 'post',
				success : function(data) {
					if (data == 1)
						if(confirm("정말 삭제하시겠습니까 ?") == true){
					    }
						qnaList(sell_num); //댓글 삭제후 목록 출력 
				}
			});
				}

		}

		$(document).ready(function() {
			qnaList(); //페이지 로딩시 댓글 목록 출력 
		});

	</script>

</body>
</html>