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
	<div align="center">
		<p class="notice">공지 사항</p>
	</div>
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
		<% int i=0; %>
			<c:forEach items="${noticelist}" var="noticelist">
			<tr>
				<td><%=++i%></td>
				<td><a href="/notice_board/notice_view?bno=${noticelist.notice_bno}">${noticelist.notice_title}</a></td>
				<td>${noticelist.notice_content}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>	

<%@ include file="../include/footer.jsp" %>
</body>
</html>