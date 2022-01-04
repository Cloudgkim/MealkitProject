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
#header .inner .gnb li:nth-child(4) a { font-weight:700; }

.notice { font-size:20px; margin-bottom:30px; }
.container #tt tbody tr .cut { width:892px; overflow:hidden; border-top:0; border-right:0; border-left:0; text-overflow:clip; text-overflow:ellipsis; display:block; white-space:nowrap; }

</style>

</head>
<body>
<%@ include file="../include/m_header.jsp" %>

<div class="container">
	<div align="center">
		<p class="notice">공지 사항</p>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-10">
			<a href="${path}/manager/notice_write" class="btn btn-primary">공지사항 작성</a>
		</div>
	</div>
	<table class="table table-bordered table-striped table-hover" id="tt">
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
				<td align="center"><%=++i%></td>
				<td><a href="/manager/notice_view?bno=${noticelist.notice_bno}">${noticelist.notice_title}</a></td>
				<td class="cut">${noticelist.notice_content}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>	
</body>
</html>