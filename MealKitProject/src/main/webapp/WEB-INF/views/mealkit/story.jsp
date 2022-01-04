<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트만의 이야기</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
#header .inner .gnb li:last-child a { font-weight:700; }

#story { width:100%; margin-bottom:150px; }
#story .inner { width:960px; text-align:center; }
#story .food1 { margin-top:90px; margin-bottom:90px; }

#story .context { text-align:left; margin-left:80px; width:800px; }
.context .title { font-size:35px; font-weight:500; color:#333; margin-bottom:20px; }
.context p { font-size:20px; color:#666; font-weight:300; }

#story .food2 { margin-top:90px; margin-bottom:90px; }
#story .context.con2 { margin-bottom:60px; }

#story .f_title { margin-left:80px; font-size:35px;
	 font-weight:500; color:#333; border-top:1px solid #999; border-bottom:1px solid #999; width:800px; padding:50px 0px; }

.homeBtn { margin-top:130px; font-size:20px; width:300px; height:40px; background:#fff; border:1px solid #999; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="story">
	<div class="inner">
		<p class="food1"><img src="/resources/images/food1.jpg" alt="음식1" /></p>
		
		<div class="context">
			<p class="title">집반찬연구소의 시작</p>
			<p>2015년 어느날, 아내에게 물었습니다.</p>
			<br>
			<p>"식사 준비할 때 뭐가 제일 힘들어요?"</p>
			<p>"흠... 무슨 반찬을 해야하나... 메뉴 고민이 가장 힘들죠"</p>
			<p>"그럼 식사 준비하는데 얼마나 걸려요?"</p>
			<p>"뭐, 장봐서 준비하고, 요리하고, 치우고.. 다 하면 하루에 3시간 넘게 걸리는 것 같은데요?</p>
			<br>
			<p>저는 놀랐습니다. 하루 3시간이면, 한 달 90시간. 1년에 1,095시간, 결혼하고 50년이 지나면 <b>무려 6.25년.</b></p>
			<br>
			<p>'가정이 생기면 가족의 끼니를 챙기는 시간만 6년이 넘는구나... 아내에게 이 시간을 돌려줄 수 있다면, 꿈을 꾸는 시간으로 채울 수 있겠구나!'</p>
			<br>
			<p>그래서 저는 제 아내를 위해, 이 시대를 살아가는 부모를 위해, 그리고 그들이 가진 꿈들을 위해. <b>식사 준비 시간을 좀 더 행복한 곳에 사용할 수 있도록</b> 집반찬연구소를 만들었습니다.</p>
		</div>
		
		<p class="food2"><img src="/resources/images/food2.jpg" alt="음식2" /></p>
		
		<div class="context con2">
			<p class="title">292,513 시간을 <br>
							선물하기 위해...</p>
			<p>집반찬연구소의 2021년 목표는 고객님들께 <b>292,513시간</b>을 선물하는 것입니다. </p>
			<p>집반찬연구소를 통해 292,513시간 만큼의 시간이 더 소중하고 행복하게 사용될 수 있도록, </p>
			<p>우리는 <b>보이지 않는 곳에서 끊임없이 혁신하고 노력</b>할 것입니다.</p>
		</div>
		
		<div class="f_title">
			<p>집반찬연구소는</p>
			<p>시간을 선물합니다.</p>
		</div>
		
		<button type="button" class="homeBtn">홈으로</button>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
$(function(){
	$('.homeBtn').click(function(){
		location.href="/";
	});
})
</script>
</body>
</html>