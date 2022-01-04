<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib  prefix="spring" 	uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }
#header .inner .gnb li:nth-child(3) a { font-weight:700; }

.red { color:red; font-weight:700; font-size:15px; }

.ppic { padding-left:530px; margin-top:30px; }
.ppic:after { content:""; clear:both; display:block; }
.ppic li a { font-size:20px; color:#444; }
.pic { float:left; margin-right:10px; }

</style>
</head>
<body>
<%@ include file="../include/m_header.jsp" %>

<div class="container">

	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr class="info">
				<td align=center width=20>밀키트 고유번호</td>
				<td align=center width=34>종류</td>
				<td align=center width=99>이름</td>
				<td align=center width=40>가격</td>
				<td align=center width=30>재고</td>
				<td align=center width=20>할인률</td>
			</tr>
		</thead>	

		<c:forEach var="list" items="${productList}">	
			<tr>
				<td align=right>${list.mk_id }</td>
				<td align=center>${list.mk_kind}</td>
				<td align=left><a href="/manager/productView?mk_id=${list.mk_id}">${list.mk_name}</a> </td>
				<td align=right>${list.mk_price}원</td>
				<c:choose>
					<c:when test="${list.mk_count == 0 || list.mk_count < 0 }">
						<td align=right class="red">재고부족</td>
					</c:when>
					<c:otherwise>
						<td align=right>${list.mk_count}개</td>
					</c:otherwise>
				</c:choose>
				<td align=right>${list.mk_discount_rate}%</td>
				
			</tr>
		</c:forEach>	
	</table>
	
	<div class="paging">
		<ul class="ppic">
			<c:if test="${m_pageMaker.prev}">
				<li><a href="productList${m_pageMaker.makeQuery(m_pageMaker.startPage - 1)}">이전</a></li>
			</c:if> 
			
			<c:forEach begin="${m_pageMaker.startPage}" end="${m_pageMaker.endPage}" var="idx">
				<li class="pic"><a href="productList${m_pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>
			
			 <c:if test="${m_pageMaker.next && m_pageMaker.endPage > 0}">
				<li><a href="productList${m_pageMaker.makeQuery(m_pageMaker.endPage + 1)}">다음</a></li>
			</c:if> 
		</ul>
	</div>
</div>

</body>
</html>