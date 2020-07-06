<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							$
									.each(
											data,
											function(key, value) {
												a += '<div class="qnaArea" style="width:630px; border-bottom:1px solid darkgray; margin-bottom: 15px;">';
												a += '<div class="qnaInfo'+value.pq_num+'">';
												//상점연결하기
												a += '<a href='
														+ "../shop/myshop?mem_storeNum=${member.mem_storeNum}"
														+ ' style="color: #ababab; font-size: 14px; font-weight: 600;">'
														+ value.pq_storeName
														+ '  </a>'
														+ value.pq_regDate
														+ ' ';
												a += '<a onclick="qnaDelete('
														+ value.pq_num
														+ ');"> 삭제 </a> </div>';
												a += '<div class="qnaContents'+value.pq_num+'"> <p style="margin-top: 7px;"> 내용 : '
														+ value.pq_contents
														+ '</p>';
												a += '<button class="reply" value="'+value.pq_storeName+'" >답글달기</button>';
												a += '</div></div>';
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
		function qnaDelete(sell_num) {
			$.ajax({
				url : '/productQna/qnaDelete/' + sell_num,
				type : 'post',
				success : function(data) {
					if (data == 1)
						qnaList(sell_num); //댓글 삭제후 목록 출력 
				}
			});

		}

		$(document).ready(function() {
			qnaList(); //페이지 로딩시 댓글 목록 출력 
		});
	</script>

</body>
</html>