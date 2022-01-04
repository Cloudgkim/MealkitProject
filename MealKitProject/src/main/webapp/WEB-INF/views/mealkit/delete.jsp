<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
	<form class="form-horizontal" method="post" action="/mealkit/delete" id="deleteForm">
		
		<input type="hidden" id="id" name="id" value="${member.id}" />
		<input type="hidden" id="pass" name="pass" value="${member.password}" />
		
		<div align="center" class="boxId">
			<label>비밀번호 확인</label>
			<input type="password" class="form-control" id="password" name="password" maxlength="16" placeholder="비밀번호를 입력하십시오."/>
		</div>
		
		<div align="center" class="boxId">
			<label>비밀번호 재확인</label>
			<input type="password" class="form-control" id="repassword" name="repassword" maxlength="16" placeholder="비밀번호를 입력하십시오."/>
		</div>
	</form>
	
	<button class="signUpBtn" type="button" id="submit">확인</button>
</div>

<%@ include file="../include/footer.jsp" %>
</body>

<script>
$('#submit').click(function(){
	
	if($('#password').val()=="") {
		alert("비밀번호를 입력하십시오.");
		$('#password').focus();
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
	
	if($('#pass').val() != $('#password').val()) {
		alert("비밀번호가 올바르지 않습니다.");
		$('#password').focus();
		return false;
	}
	
	var result = confirm("정말 탈퇴하시겠습니까?");
	
	if(result){
		
		if(${yes == "yes"}){
			var result2 = confirm("등록하신 게시글을 모두 삭제 하시겠습니까?");
			
			if(result2) {
				alert("회원 탈퇴가 완료되었습니다.");
				$('#deleteForm').submit();
			} 
		} 
		
		else if(${no == "no"}) {
			alert("회원 탈퇴가 완료되었습니다.");
			$('#deleteForm').submit();
		}
	}
});

</script>

</html>