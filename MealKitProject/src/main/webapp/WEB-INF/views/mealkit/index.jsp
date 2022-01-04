<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
</style>

</head>
<body>
<div id="header">
	<div class="inner">
		<h1><a href="/"><img src="/resources/images/logo.svg" alt="logo" /></a></h1>
		<c:if test="${member == null}">
			<ul>
				<li><a href="mealkit/join">회원가입</a></li>
				<li><a href="mealkit/login">로그인</a></li>
				<li><a href="manager/managerLogin">관리자 로그인</a></li>
			</ul>
		</c:if>
		
		<c:if test="${member != null}">
			<ul>
				<li><a href="../mealkit/myPage">내 정보</a></li>
				<li><a href="mealkit/delete">회원 탈퇴</a></li>
				<li class="logout"><a href="#">로그아웃</a></li>
			</ul>
		</c:if>
		
		<ul class="gnb">
			<li><a href="../shop/zzim"><span class="glyphicon glyphicon-heart"></span> 찜한상품</a></li>
			<li><a href="../shop/cart"><span class="glyphicon glyphicon-credit-card"></span> 장바구니</a></li>
			<li><a href="../shop/goods_list"><span class="glyphicon glyphicon-apple"></span> 반찬보기</a></li>
			<li><a href="mealkit/story"><span class="glyphicon glyphicon-user"></span> 이야기</a></li>
		</ul>
	</div>
</div>

<div id="visual">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		
		<!-- Wrapper for slides : 사진에 대한 설정 -->
		<div class="carousel-inner">
			<div class="item active">
				<img class="img-responsive center-block" src="/resources/images/image1.jpg" alt="image1.jpg" />
			</div>
			
			<div class="item">
				<img class="img-responsive center-block" src="/resources/images/image2.jpg" alt="image2.jpg" />
			</div>
			
			<div class="item">
				<img class="img-responsive center-block" src="/resources/images/image3.jpg" alt="image3.jpg" />
			</div>
			
			<div class="item">
				<img class="img-responsive center-block" src="/resources/images/image4.jpg" alt="image4.jpg" />
			</div>
			
			<div class="item">
				<img class="img-responsive center-block" src="/resources/images/image5.jpg" alt="image5.jpg" />
			</div>
		</div>
		
		<!-- controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
		
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>
	</div>
</div>

<div id="content">
</div>
<div><%@ include file="../include/footer.jsp" %></div>

</body>

<script>
$('.logout').click(function(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		location.href="/mealkit/logout";
	} 
});

</script>
</html>