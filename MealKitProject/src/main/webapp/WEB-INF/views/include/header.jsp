<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="header">
	<div class="inner">
		<h1><a href="/"><img src="/resources/images/logo.svg" alt="logo" /></a></h1>
		<c:if test="${member == null}">
			<ul>
				<li><a href="../mealkit/join">회원가입</a></li>
				<li><a href="../mealkit/login">로그인</a></li>
			</ul>
		</c:if>
		
		<c:if test="${member != null}">
			<ul>
				<li><a href="../mealkit/myPage">내 정보</a></li>
				<li><a href="../mealkit/delete">회원 탈퇴</a></li>
				<li class="logout"><a href="#">로그아웃</a></li>
			</ul>
		</c:if>
		
		<ul class="gnb">
		    <li><a href="../shop/zzim"><span class="glyphicon glyphicon-heart"></span> 찜한상품</a></li>
			<li><a href="../shop/cart"><span class="glyphicon glyphicon-credit-card"></span> 장바구니</a></li>
			<li><a href="../shop/goods_list"><span class="glyphicon glyphicon-apple"></span> 반찬보기</a></li>
			<li><a href="../mealkit/story"><span class="glyphicon glyphicon-user"></span> 이야기</a></li>
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