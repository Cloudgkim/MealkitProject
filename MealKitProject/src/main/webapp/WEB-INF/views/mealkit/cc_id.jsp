<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member.id}님 정보</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;800&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

/* visual */
.t_visual { height:300px; width:100%; background:url("/resources/images/food3.jpg") no-repeat top center; position:relative; margin-bottom:70px; }
.t_visual .inner { width:960px; position:relative; }
.t_visual_black { height:300px; width:100%; background:rgba(0,0,0,0.5); position:absolute; }

.me { position:absolute; left:0; top:0; margin-top:90px; }
.me p { color:#fff; font-family:'Nanum Myeongjo',serif; }
.me p:first-child { font-weight:800; font-size:40px; margin-bottom:15px; }
.me p:last-child { font-size:20px; }

/* myContent */
#myContent { height:750px; }
#myContent .inner { width:960px; }
#myContent .inner:after { content:""; clear:both; display:block; }

.left_bar { float:left; }
.left_bar .myShopping { width:200px; border-bottom:1px solid #888; margin-bottom:20px; }
.left_bar .myShopping:last-child { border:0; }
.left_bar .myShopping li { margin-bottom:20px; position:relative; }
.left_bar .myShopping li:first-child { color:#333; font-weight:700; font-size:20px; } 
.left_bar .myShopping li a { color:#666; font-weight:300; font-size:15px; }
.glyphicon-chevron-right { color:#666; position:absolute; right:0; top:4px; }

.m_content { float:right; width:700px; }
.m_content .order { font-size:20px; }


</style>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="t_visual">
	<div class="t_visual_black"></div>
	
	<div class="inner">
		<div class="me">
			<p>${member.name}</p>
			<p>${member.id}님 환영합니다.</p>
		</div>
	</div>
</div>

<div id="myContent">
	<div class="inner">
		<div class="left_bar">
			<ul class="myShopping">
				<li>나의 쇼핑 정보</li>
				<li><a href="../mealkit/myPage">주문/배송 조회 및 변경</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="../shop/goReviewPage">상품후기 작성</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="../board/boardList">1:1 문의</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="#">내가 찜한 제품</a><span class="glyphicon glyphicon-chevron-right"></span></li>
			</ul>
			
			<ul class="myShopping">
				<li>나의 계정</li>
				<li><a href="updateMypage">회원 정보 수정</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="#">쿠폰</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="#">적립금</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="cc_id">추천인 아이디</a><span class="glyphicon glyphicon-chevron-right"></span></li>
			</ul>
			
			<ul class="myShopping">
				<li>고객센터</li>
				<li><a href="#">조리법</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="#">공지사항</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="#">자주 묻는 질문</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="#">업데이트 소식</a><span class="glyphicon glyphicon-chevron-right"></span></li>
			</ul>
		</div>
		
		<div class="m_content">
			<p class="order">추천인 아이디</p>
			<hr>
			
			<form class="form-horizontal" method="post" action="/mealkit/cc_id" id="ccidForm">
			
				<input type="hidden" name="ccid" value="${member.id}" />
			
				<div class="form-group">
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id" name="id" maxlength="16" placeholder="추천인을 입력하세요."/>
					</div>
					
					<button class="btn btn-primary" type="submit" id="submit" >확인</button>
				</div>
				
				<c:if test="${msg == false}">
					<div class="error">
						<p>아이디를 다시 한번 확인하시기 바랍니다.</p>
					</div>
				</c:if>
				
				<c:if test="${turemsg == false}">
					<div class="error">
						<p>이미 추천인이 입력되어있습니다.</p>
					</div>
				</c:if>
				
				<c:if test="${msg == true}">
					<div class="ccGood">
						<p>추천인이 입력 되었습니다.</p>
					</div>
				</c:if>

			</form>
		</div>
		
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
<script>
function isAlphaNumCheck(input) {
	var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	return containsCharsOnly(input, chars);
}

function containsCharsOnly(input, chars) {
	for(var inx=0; inx < input.length; inx++) {
		if(chars.indexOf(input.charAt(inx)) == -1) {
			return false;
		}
	}
}
$(function(){
	$('#submit').click(function(){
		if($('#id').val()=="") {
			alert("아이디을 입력하십시오.");
			$('#id').focus();
			return false;
		}
		if(isAlphaNumCheck($("#id").val()) == false) {
			alert("숫자와 영문자만 입력 가능합니다.");
			$("#id").focus();
			return false;
		}
	});	
})




</script>

</html>