<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }
</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container">
	<form class="form-horizontal" action="/manager/notice_write" method="POST">

		<div class="form-group">
			<label class="control-label col-sm-2">제  목 : </label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="notice_title" name="notice_title" maxlength="50" placeholder="Enter Title"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">내  용</label>
			<div class="col-sm-4">
				<textarea rows="10" cols="120" name="notice_content" id="notice_content"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3">
				<button type="reset"  class="btn btn-warning btn-sm">다시 작성하기</button>
				<button type="submit" class="btn btn-primary btn-sm" id="submit">글 올리기</button>
			</div>
		</div>
	</form>
</div>
</body>

<script>
$('#submit').click(function(){
	if($('#notice_title').val()=="") {
		alert("제목을 입력하십시오.");
		$('#notice_title').focus();
		return false;
	}
	
	if($('#notice_content').val()=="") {
		alert("내용을 입력하십시오.");
		$('#notice_content').focus();
		return false;
	}
});

</script>
</html>