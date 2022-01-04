<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }

.notice { font-size:20px; margin-bottom:30px; }
</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container">
	<form class="form-horizontal" method="post">
		<div class="form-group">
			<div align="center">
				<p class="notice">공지사항</p>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">제  목</label>
			<div class="col-sm-4">
				<!-- value="${view.title}"에 쌍따옴표를 제거하면 데이터에서 공백이 있는 부분까지만 출력된다. -->
				<input type="text" class="form-control" name="title" maxlength="50" value="${Noticeview.notice_title}" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">내  용</label>
			<div class="col-sm-4">
				<textarea rows="10" cols="120" name="b_content" readonly="readonly">${Noticeview.notice_content}</textarea>
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/footer.jsp" %>	
</body>
</html>