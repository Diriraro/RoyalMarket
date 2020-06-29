<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    <div class="container">

		<form action="./comments" id="frm" method="post">
						
			<div class="form-group">
				<label for="sq_contents">Contents:</label>
				<textarea rows="" cols="" class="form-control" id="sq_contents" name="sq_contents" style="width:900px; height: 150px; "></textarea>
			</div>
			
			<input type="button" id="btn" class="btn btn-default" value="Write">
		</form>

	</div>