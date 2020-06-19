<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    <!-- modelattribute = 컨트롤에서 VO타입으로 보내줘야함  -->
	<form:form modelAttribute="boardVO" action="${board}${path}" method="post">
	
	<!-- vo.num == path ="num" 같은형식 -->
		<form:input path="num" type="hidden" id="num" />
	
	  <div class="form-group">
	    <label for="title">Title:</label>
	    <form:input path="title" type="text"  class="form-control" id="title"  ></form:input>
	    <form:errors path="title"></form:errors>
	  </div>
	  <div class="form-group">
	    <label for="writer">Writer:</label>
	    <form:input path="writer" type="text" class="form-control" id="writer" readonly="true" value="${member.id}" />
	    <form:errors path="writer" cssClass="r"></form:errors>
	  </div>
	  
	  <div class="form-group">
	    <label for="contents">Contents:</label>
	    <form:textarea path="contents" rows="" cols="" class="form-control" id="contents" ></form:textarea>
	    <form:errors path="contents"></form:errors>
	  </div>
	  
	  <input type="button" class="btn btn-info" id="add" value="FileAdd">
	  <div class="form-group" id="f"></div>

	  <button type="submit" class="btn btn-default">Submit</button>
	</form:form>