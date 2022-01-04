<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

.container { margin-top:70px; margin-bottom:70px; width:600px; text-align:center; position:relative; }

.boxId { margin-bottom:30px; }
#userID { width:300px; }
#tel1, #tel2, #tel3 { width:100px; float:left; }
.clear { padding-left:135px; }
.clear:after { content:""; display:block; clear:both; }

label { font-size:18px; margin-bottom:10px; width:300px; text-align:left; }

.signUpBtn { background:darkgreen; width:300px; height:40px; font-size:15px; margin-top:50px; color:#fff; border:0; }

.error { font-size:15px; margin-top:30px; color:red; position:absolute; left:140px; top:155px; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<form class="form-horizontal" method="post" action="/mealkit/findPass" id="findPassForm">
		
		<div align="center" class="boxId">
			<label>아이디</label>
			<input type="text" class="form-control" id="userID" name="id" maxlength="16" placeholder="아이디를 입력하십시오."/>
		</div>
		
		<input type="hidden" id="tel" name="tel" />
		
		<label>전화번호</label>
		
		<div class="clear">
			<select class="form-control" id="tel1" name="tel1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
			
			<input type="text" class="form-control" id="tel2" name="tel2" maxlength="4" placeholder="Tel"/>
			<input type="text" class="form-control" id="tel3" name="tel3" maxlength="4" placeholder="Tel"/>
		</div>
		
		<c:if test="${msg == false}">
			<div class="error">
				<p>아이디와 전화번호를 다시 한번 확인하시기 바랍니다.</p>
			</div>
		</c:if>
		
		<button class="signUpBtn" type="submit" id="submit">확인</button>
		
	</form>
</div>

<%@ include file="../include/footer.jsp" %>

</body>

<script>
$(function(){
	$('#submit').click(function(){
		
		if($('#userID').val()=="") {
			alert("아이디를 입력하십시오.");
			$('#userID').focus();
			return false;
		}
		
		if($('#tel2').val()=="") {
			alert("전화번호를 입력하십시오.");
			$('#tel2').focus();
			return false;
		}
		
		if($('#tel3').val()=="") {
			alert("전화번호를 입력하십시오.");
			$('#tel3').focus();
			return false;
		}
		
		$('#tel').val($('#tel1').val() + "-" + $('#tel2').val() + "-" + $('#tel3').val());
	});
})

</script>
</html>