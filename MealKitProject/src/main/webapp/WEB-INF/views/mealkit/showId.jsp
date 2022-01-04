<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

.container { margin-top:70px; margin-bottom:70px; width:600px; text-align:center; position:relative; }
.userId { font-size:20px; }
label { font-size:18px; margin-bottom:10px; width:300px; text-align:center; }

.findBtn { background:darkgreen; width:300px; height:40px; font-size:15px; margin-top:50px; color:#fff; border:0; }

</style>


</head>
<body>
<%@ include file="../include/header.jsp" %>
  
<div class="container">
	<label>가입 아이디</label>
	<hr/>
	<h2 class ="userId">${id}</h2>
	<a href = findPass><button class = "findBtn" type = "button" id = "findPass">비밀번호 찾기</button></a>
</div>
 
<%@ include file="../include/footer.jsp" %>
</body>

<script>

</script>

</html>