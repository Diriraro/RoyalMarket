<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="w3-container">
	<div class="topnav">
		<a class="check " title="NoticeList">공지 목록</a> <a class="check active"
			title="NoticeWrite">공지 등록</a>
	</div>
	<br> <br>
	<form>
		<!-- action="noticeWrite" method="post" enctype="multipart/form-data" -->
		<div class="form-group">
			<label for="title">공지사항 제목 :</label> <input type="text"
				class="form-control" id="notitle" name="notitle">
		</div>
		<div class="form-group">
			<label for="contents">공지사항 내용 :</label>
			<textarea rows="" cols="" class="form-control" id="summernote"
				name="no_contents"></textarea>
		</div>

		<button type="submit" id="noticeSubmit" class="btn btn-default">등록</button>
	</form>
</div>

<script>
	$('#summernote').summernote(
			{

				tabsize : 2,
				height : 500,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
</script>
