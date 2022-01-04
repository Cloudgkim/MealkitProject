<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 설정하기</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; width:600px; text-align:center; }

.boxId { margin-bottom:30px; }
#password, #repassword { width:300px; }

label { font-size:18px; margin-bottom:10px; text-align:left; width:300px; }

.signUpBtn { background:darkgreen; width:300px; height:40px; font-size:15px; margin-top:10px; color:#fff; border:0; }
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<form class="form-horizontal" method="post" action="/mealkit/newPass" id="newPassForm">
		
		<input type="hidden" id="id" name="id" value="${id}" />
		
		<div align="center" class="boxId">
			<label>비밀번호 재설정</label>
			<input type="password" class="form-control" id="password" name="password" maxlength="16" placeholder="비밀번호를 입력하십시오."/>
		</div>
		
		<div align="center" class="boxId">
			<label>비밀번호 재설정 확인</label>
			<input type="password" class="form-control" id="repassword" name="repassword" maxlength="16" placeholder="비밀번호를 입력하십시오."/>
		</div>
		
		<button class="signUpBtn" type="submit" id="submit">확인</button>
		
	</form>
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
		
		if($('#password').val()=="") {
			alert("비밀번호를 입력하십시오.");
			$('#password').focus();
			return false;
		}
		
		if($("#password").val().length < 8){
			alert("비밀번호는 8자 이상으로 해야합니다.");
			$("#password").focus();
			return false;
		}
		
		if(isAlphaNumCheck($("#password").val()) == false) {
			alert("비밀번호는 숫자와 영문자만 입력 가능합니다.");
			$("#password").focus();
			return false;
		}
		
		if($('#repassword').val()=="") {
			alert("비밀번호를 다시 입력하십시오.");
			$('#repassword').focus();
			return false;
		}
		
		if($('#repassword').val() != $('#password').val()) {
			alert("비밀번호가 같지 않습니다.");
			$('#repassword').focus();
			return false;
		}
		
		alert("비밀번호 변경이 완료되었습니다.");
	});
})

</script>

</html>