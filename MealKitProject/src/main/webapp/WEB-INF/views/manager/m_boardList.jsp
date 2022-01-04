<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }
#header .inner .gnb li:last-child a { font-weight:700; }

.notice { font-size:20px; margin-bottom:30px; }
</style>

</head>
<body>
<%@ include file="../include/m_header.jsp" %>

<div class="container">
	<div align="center">
		<p class="notice">1:1 문의 사항</p>
	</div>
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>문의유형</th>
				<th>제    목</th>
				<th>글쓴이</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<% int i=0; %>
			<c:forEach items="${boardlist}" var="Boardlist">
			<tr>
				<td><%=++i%></td>
				<td>${Boardlist.b_kind}</td>
				<td><a href="/manager/m_boardView?bno=${Boardlist.bno}">${Boardlist.title}</a></td>
				<td>${Boardlist.writer}</td>
				<td><fmt:formatDate value="${Boardlist.b_reg_Date}" pattern="yyyy년 MM월 dd일"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>	
</body>
</html>