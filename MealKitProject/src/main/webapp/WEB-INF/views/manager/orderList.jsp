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
		<title>주문 목록</title>
		<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }
#header .inner .gnb li:nth-child(2) a { font-weight:700; }

.ppic { padding-left:530px; margin-top:30px; }
.ppic:after { content:""; clear:both; display:block; }
.ppic li a { font-size:20px; color:#444; }
.pic { float:left; margin-right:10px; }

</style>

	</head>
<body>
<%@ include file="../include/m_header.jsp" %>
<div class="container">
	
	<table class="table table-bordered table-hover">
		<thead>
			<tr class="info">
				<td align=center width=20>주문번호</td>
				<td align=center width=30>상품명</td>
				<td align=center width=5>수량</td>
				<td align=center width=11>주문자</td>
				<td align=center width=20>주문상태</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="orderList" items="${orderList}">	
				<tr>
					<td align=center><a href="../manager/orderView?order_id=${orderList.order_id}">${orderList.order_id}</a></td>
					<td align=center>${orderList.mk_name}</td>
					<td align=center>${orderList.buy_count}</td>
					<td align=center>${orderList.member_id}</td>
					<td align=center>${orderList.delivery}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<div class="paging">
		<ul class="ppic">
			<c:if test="${m_pageMaker.prev}">
				<li><a href="orderList${m_pageMaker.makeQuery(m_pageMaker.startPage - 1)}">이전</a></li>
			</c:if> 
			
			<c:forEach begin="${m_pageMaker.startPage}" end="${m_pageMaker.endPage}" var="idx">
				<li class="pic"><a href="orderList${m_pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>
			
			 <c:if test="${m_pageMaker.next && m_pageMaker.endPage > 0}">
					<li><a href="orderList${m_pageMaker.makeQuery(m_pageMaker.endPage + 1)}">다음</a></li>
			</c:if> 
		</ul>
	</div>

</div>	

</body>

</html>