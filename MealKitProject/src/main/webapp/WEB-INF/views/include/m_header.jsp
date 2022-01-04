<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="header">
	<div class="inner">
		<h1><a href="/manager/managerHome"><img src="/resources/images/logo.svg" alt="logo" /></a></h1>
		
				<c:if test="${manager == null}">
			<ul>
				<!-- <li><a href="#">내 정보</a></li> -->
				<li><a href="../manager/managerLogin">로그인</a></li>
			</ul>
		</c:if>
		
		<c:if test="${manager != null}">
			<ul>
				<li class="logout"><a href="#">로그아웃</a></li>
			</ul>
		</c:if>
			<ul class="gnb">
				<li><a href="../manager/productRegister"><span class="glyphicon glyphicon-barcode"></span> 밀키트 등록</a></li>
           		<li><a href="../manager/orderList"><span class="glyphicon glyphicon-plane"></span> 밀키트 주문 목록</a></li>
           		<li><a href="../manager/productList"><span class="glyphicon glyphicon-inbox"></span> 밀키트 목록 확인</a></li>
           		<li><a href="../manager/notice_list"><span class="glyphicon glyphicon-volume-up"></span> 공지사항</a></li>
            	<li><a href="../manager/m_boardList"><span class="glyphicon glyphicon-user"></span> 1 : 1 문의</a></li>
			</ul>
	</div>
</div>

<script>
$('.logout').click(function(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		location.href="/mealkit/logout";
	} 
});
</script>