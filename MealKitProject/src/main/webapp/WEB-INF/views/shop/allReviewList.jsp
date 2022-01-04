<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }

.gTitle { font-size:25px; font-weight:700; color:#333; border-bottom:1px solid #777; padding-bottom:20px; }

.reviews { border-bottom:1px solid #e9e9e9; padding:15px 0; }
.reviews:after { content:""; display:block; clear:both; }
.reviews li:nth-child(1) { float:left; margin-right:15px; }
.reviews li:nth-child(2) { font-size:15px; word-break:break-all; margin-top:5px; }
.reviews li:nth-child(3) { margin:5px 0; color:#777; font-weight:300; }
.reviews li:nth-child(4) { float:left; margin-right:10px; color:#777; font-weight:300; }
.reviews li:nth-child(5) { float:left; }
.reviews li:nth-child(6) { float:right; color:#777; font-weight:300; }

.ppic { padding-left:530px; margin-bottom:80px; }
.ppic:after { content:""; clear:both; display:block; }
.ppic li a { font-size:20px; color:#444; }
.pic { float:left; margin-right:10px; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<p class="gTitle">리뷰 목록</p>
	<table class="table table-bordered table-hover">
		<tbody>
			<c:forEach items="${list}" var="list">
				<ul class="reviews">
					<li><img src="/resources${list.mk_img}" alt="images" width="90px" height="90px" /></li>
					<li>${list.r_detail}</li>
					<li>${list.mk_name}</li>
					<li>${list.r_writer}</li>
					<li>
						<c:choose>
							<c:when test="${list.star == 5 }">★★★★★</c:when>
							<c:when test="${list.star == 4 }">★★★★</c:when>
							<c:when test="${list.star == 3 }">★★★</c:when>
							<c:when test="${list.star == 2 }">★★</c:when>
							<c:when test="${list.star == 1 }">★</c:when>
						</c:choose>
					</li>
					<li><fmt:formatDate value="${list.r_date}" pattern="yyyy년 MM월 dd일"/></li>
				</ul>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="paging">
	  <ul class="ppic">
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="allReviewList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li class="pic"><a href="allReviewList${pageMaker.makeQuery(idx)}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="allReviewList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
	    </c:if> 
	  </ul>
	</div>
		
</div>	

<%@ include file="../include/footer.jsp" %>
</body>
</html>