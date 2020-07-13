<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<h1>공지사항 수정</h1>
	<form>
		<input type="hidden" id="nonum" name="nonum" value="${no_select.nonum}"> 
		<input type="hidden" id="no_regDate" name="no_regDate" value="${no_select.no_regDate}">
		<div class="form-group">
			<label for="title">공지사항 제목:</label> 
			<input type="text" class="form-control" id="notitle" name="notitle"	value="${no_select.notitle}">
		</div>
		<div class="form-group">
			<label for="contents">공지사항 내용:</label>
			<textarea rows="" cols="" class="form-control" id="summernote" name="no_contents">${no_select.no_contents}</textarea>
		</div>

		<button type="submit" id="noticeUpdate" class="btn btn-default">Submit</button>
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
