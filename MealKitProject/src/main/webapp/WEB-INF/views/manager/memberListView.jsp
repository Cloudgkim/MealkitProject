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
ul,li { list-style:none; }
a { text-decoration : none; color:inherit; }
.menu_wrap .dep1 { fontsize:0; }
.menu_wrap .dep1 > li { display:inline-block; vertical-align:top; width:130px; text-align:center; background:#ddd; font-size:16px; padding:10px 0; }   
.menu_wrap .dep1 > li > strong { background:#808080; color:#fff; }
.menu_wrap .dep1 > li:hover > .dep2 { display:block; }
.menu_wrap .dep1 > li > strong { display:block; padding:10px 0; }
.menu_wrap .dep2 a { display:block; padding:10px 0; }
.menu_wrap .dep2 > li > a:focus { background:#ddd; color:#dc143c };
.menu_wrap .dep2 > li > a:active { background:#222; color:#fff; }

.info th { text-align:center; }
</style>
</head>
<body>
<%@ include file="../include/m_header.jsp" %>

<div class="container-fluid" style="background-color:#234234; color:#FFF; height:200px; text-align  : center;">
	<br>
	<h1 style="margin-top:14px; font-size:5em;">밀키트 판매몰 관리</h1>
	<br>
	<h3 style="font-size:2em;">관리자가 밀키트 쇼핑몰에 관한 모든 것을 관리하는 페이지입니다.</h3>
	<br>
</div>
 
<div class="menu_wrap">
	<ul class = "dep1">
		<li>
			<strong>사용자 관리</strong>
			
			<ul class="dep2">
				<li><a href="/manager/memberListView">회원목록 조회</a></li>
			</ul>
		</li> 
	</ul>
</div>
 
<div class="container-fluid" style="text-align:left; margin-top:13px; padding-left:150px;">
	<h3 style="font-size:3em;">회원목록 조회</h3>
	<hr/>
	
	<div class="container" style="padding-right:0px; padding-left:0px; margin-right:400px;">
		<table class="table table-bordered table-striped table-hover">
			<tr class="info">
				<th>아이디</th>
				<th>비밀번호</th>
				<th >이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>생일</th>
				<th>버튼</th>
			</tr>
			 
			<c:forEach items="${memberdto}" var="member">
				<tr>
					<td align = "center" >${member.id}</td> 
					<td align = "center" >${member.password}</td> 
					<td align = "center" >${member.name}</td> 
					<td align = "center" >${member.tel}</td> 
					<td align = "center" >${member.address}</td> 
					<td align = "center" >${member.birth}</td>  
					<td align = "center" >
						<button class = "update btn btn-primary btn-sm" type="button">수정</button>
						<button class = "delete btn btn-warning btn-sm" type="button">삭제</button>
					</td>  
				</tr>
			</c:forEach>  
		</table>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>

<script>

$(".delete").click(function() {
	
	var id = $(this).parent().siblings().eq(0).text();
	 
	var result = confirm(id+"님을 회원에서 삭제하시겠습니까?");
	 
	if(result){
		$.ajax({
		type : "post",
		url : "/manager/memberDelete",
		data : { id : id },
		success : function(){
			alert(id+"님이 삭제되었습니다.");
			location.replace("memberListView");
			}
		})
	}
});
    
$(".update").click(function() {
	
	var id = $(this).parent().siblings().eq(0).text();
	
	var result = confirm(id+"님의 정보를 수정하시겠습니까?");
	
	if(result){
		location.href = "/manager/memberUpdateForm?id="+id;
	}
});

</script>
</html>