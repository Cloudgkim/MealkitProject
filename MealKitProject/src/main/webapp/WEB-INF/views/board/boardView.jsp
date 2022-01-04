<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
.container { margin-top:70px; margin-bottom:70px; }
#containerId { margin-left:200px; margin-bottom:35px; width :600px; text-align:right; }
#listComment { margin-left:200px; }
</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container">
	<form class="form-horizontal" action="/board/boardDelete" method="post" id="delForm">
		<div class="form-group">
			<div class="col-sm-offset-3">
				<h1>게시글 상세 정보</h1>
			</div>
		</div>
		
		<input type="hidden" name="bno" value="${boardview.bno}"/>

		<div class="form-group">
			<label class="control-label col-sm-2">아이디</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="writer" name="writer" value="${member.id}" readonly />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">질문 유형</label>
			<div class="col-sm-2">
				<select class="form-control" name="b_kind" id="b_kind">
					<option value="${boardview.b_kind}">${boardview.b_kind}</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2">문의 내용</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="title" name="title" value="${boardview.title}" readonly />
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-7">
				<textarea rows="10" name="b_content" id="b_content" class="form-control" readonly>${boardview.b_content}</textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-3">
				<a class="btn btn-primary" href="/board/boardUpdate?bno=${boardview.bno}">수정</a>&nbsp;&nbsp;
				<a class="btn btn-danger" href="#" id="Del">삭제</a>
			</div>
		</div>
	</form>
</div>

<!-- 댓글작성 -->
<div class ="container">
 <div id = "containerId">
<div style="width :800px; text-align:center" align ="center">
<textarea  rows = "5" cols ="130" id = "comment" placeholder ="댓글을 작성하세요" required ="required"></textarea>
<br/>
<button type ="button" id = "btnComment" class = "btn btn-warning" >댓글등록</button>
</div>
</div>
</div>

<!--댓글보여주는 영역 -->

<div id="listComment"></div>
<br/>
<br/>

<%@ include file="../include/footer.jsp" %>	

</body>

<script>
//해당 문서가 로딩이 되면 이 함수를 실행할꺼임
//$(function(){
$(document).ready(function() {
	 listComment2(); //json리턴방식
   //댓글쓰기 버튼클릭 이벤트
	$("#btnComment").click(function(){
		if($("#comment").val()==""){
	    	alert("댓글 내용을 입력하세요");
	        $("#comment").focus();
	        return; }
		comment();
	});
});

function comment(){
    //alert("2222222");
	  var comment = $("#comment").val();
	    //alert(comment);
	  var bno = "${boardview.bno}"  //원글번호
	 // var param ="comment="+comment+"&bno="+bno; //댓글내용과 원글번호 전달
	  var writer = "${boardview.writer}"
	  $.ajax({
		  type : "post",
		  url : "/comment/insert",
		  //다 boardView에서 넘어온 값들임
		  data :  {comment: comment, bno: bno, writer: writer}, //변수이름 :실제값
			success:function(){
				alert("댓글이 등록되었습니다.");
				$("#comment").val("");
				listComment2();
			}
	});
}


function listComment2() {
    //alert("listComment2()가 실행됩니다.");
   $.ajax({
      type:"get",
      url :"/comment/listJson?bno=${boardview.bno}",
      //comment아래 listJson으로 매핑된 메소드를 불러서 그 return값을 result로 받아서 아이디가 listCommetn인 div에 뿌려줘
      success:function(result) {
         var output ="<table border-bottom=1 , width = 810>";
         for(var i in result){
            output += "<tr>";
            output += "<td>" + "&nbsp" + "&nbsp" + "<b>"+result[i].writer+"</b>";
             output += "("+changeDate(result[i].reg_date)+")<a onclick= commentDelete1("+result[i].idx+");>삭제</a><br/><br/></td></tr>";
            output += "<tr><td>&nbsp" + "&nbsp" + result[i].comment+"<hr/></td></tr>";
         }
         output +="</table>";
         $("#listComment").html(output);
      }   
      
   });

}


function commentDelete1(idx){
	var result = confirm("삭제하시겠습니까?(본인 댓글만 삭제할수 있습니다.)");
	if(result){
		commentDelete(idx);
	}
}

function commentDelete(idx){
	
     //alert(idx);
	 $.ajax({
		 url : "/comment/delete/"+idx,
		 type : "post",
		 success : function(data){
			 //alert(data);
			 if(data==1)
				 listComment2();
		 }
	 });
 }
	 
function changeDate(data){
	   var date = new Date(data);
	   var year = date.getFullYear();
	   var month = date.getMonth() + 1;
	   var day = date.getDate();
	   var hour = date.getHours() - 9;
	   var minute = date.getMinutes();
	   var second = date.getSeconds();
	   
	   month = month < 10 ? '0' + month : month;
	   hour = hour<10 ? '0'+hour : hour;
	   minute = minute < 10 ? '0' + minute : minute;
	   second = second < 10 ? '0' + second : second;
	   
	   strDate = year+"-"+month+"-"+day+" "+hour+":" +minute+":" + second;
	   return strDate;   
	}
	
$('#Del').click(function(){
	var result = confirm("삭제하시겠습니까?");
	if(result) {
		$('#delForm').submit();
	}
});



</script>
</html>