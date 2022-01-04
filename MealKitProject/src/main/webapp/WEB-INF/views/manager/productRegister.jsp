<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 등록</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:45px; }
#header .inner .gnb li:first-child a { font-weight:700; }
.title { font-size:25px; margin-bottom:10px; font-weight:700; }
.select_img img { margin:20px 0; }
.btnss { margin-bottom:50px; }

</style>

</head>
<body>
<%@ include file="../include/m_header.jsp" %>

<div class="container">
	<form class="form-horizontal" method="post" enctype="multipart/form-data" action="/manager/productRegister">
		<div class="form-group">
			<div class="col-sm-offset-1">
				<p class="title">밀키트 등록</p>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 이름</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" 
				name="mk_name" id="mk_name" maxlength="50" placeholder="이름을 입력하십시오."/>
			</div>
		</div>
		
		<div class="form-group">
			<div id="msg2" class="col-sm-6" align="right"></div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 가격</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" 
				name="mk_price" id="mk_price" maxlength="30" placeholder="가격을 입력하십시오."/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 종류</label>
			<div class="col-sm-2">
				<select class="form-control" name="mk_kind" id="mk_kind">
					<c:forEach var="kind" items="${kind}">
						<option value="${kind.kind_name}">${kind.kind_name}</option>
					</c:forEach>
				</select>
			</div>
		</div>		
	
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 재고량</label>
			<div class="col-sm-2">
				<div class="input-group">
					<input type="text" class="form-control" maxlength="6" 
					name="mk_count" id="mk_count" placeholder="재고량을 입력하십시오."/>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="inputArea">
				<label class="control-label col-sm-2" for="mk_img">밀키트 이미지</label>
			 	<input type="file" id="mk_img" name="file" />
				<div class="select_img"><img src="" /></div>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 내용</label>
			<div class="col-sm-4">
				<textarea rows="10" cols="50" name="mk_content" placeholder="내용을 입력하십시오."></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">할인율</label>
			<div class="col-sm-2">
				<div class="input-group">
					<input type="text" class="form-control" size="4" maxlength="4" name="mk_discount_rate" id="mk_discount_rate" placeholder="할인율"/>
					<span class="input-group-addon"> %</span>
				</div>
			</div>
		</div>
		
		<div class="form-group btnss">
			<div class="col-sm-offset-3">
				<button type="reset"  class="btn btn-warning btn-sm">다시 작성하기</button>
				<button type="submit" class="btn btn-primary btn-sm" id="submit">등록하기</button>
			</div>
		</div>
	</form>
</div>

</body>

<script>

$("#mk_img").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    
	    reader.onload = function(data) {
	    	$(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    
	    reader.readAsDataURL(this.files[0]);
   	}
 	});

// 숫자 검사
function isNumberCheck(inputVal) {
	
	var_normalize = /[^0-9]/gi; // 정규식
	if(var_normalize.test(inputVal) == true) {
		return false;
	} else {
		return true;
	}
}

// jQuery를 이용하여 페이지가 로딩되면 할 수 있는 것들을 만든다.
$(function(){
	
	// 취소 버튼을 누르면
	$('.cancel').click(function(){
		location.href="/";
	});
	
	// 아이디에 글자를 입력하면 실시간으로 사용이 가능한지 아닌지 검사한다.
	$('#mk_name').on("input", function(){
		var inputID = $('#mk_name').val();
		
		$.ajax({
			url: "/manager/mkCheck",
			type: "post",
			dataType: "json",
			data: { "mk_name" : inputID },
			success: function(data){
				if(inputID.length < 2) {
					$('#msg2').text("밀키트 이름이 너무 짧습니다.");
				} else if(inputID != "" && inputID.length >= 2 && data == "0") {
					$('#msg2').text("사용할 수 있는 밀키트 이름입니다.");
				} else if(data == 1) {
					$('#msg2').text("이미 사용 중인 밀키트 이름입니다.");
				}
			}
		});
	});

	$("#submit").click(function() {
		
		if($("#mk_name").val() == "") {
			alert("밀키트 이름를 입력하십시오.");
			$("#mk_name").focus();
			return false;
		}
		
		var str = document.getElementById('mk_name');

		var blank_pattern = /^\s+|\s+$/g;
		if( str.value.replace( blank_pattern, '' ) == "" ){
		    alert(' 공백만 입력되었습니다 ');
		    return false;
		}
		
		if($("#mk_price").val() == "") {
			alert("밀키트 가격을 입력하십시오.");
			$("#mk_price").focus();
			return false;
		}
		if(!isNumberCheck($("#mk_price").val())) {
			alert("가격은 숫자만 입력 가능합니다.");
			$("#mk_price").focus();
			return false;
		}
		
		if($("#mk_count").val() == "") {
			alert("밀키트 재고량을 입력하십시오.");
			$("#mk_count").focus();
			return false;
		}
		if(!isNumberCheck($("#mk_count").val())) {
			alert("재고량은 숫자만 입력 가능합니다.");
			$("#mk_count").focus();
			return false;
		}
		
		if($("#mk_discount_rate").val() == "") {
			alert("할인율을 입력하십시오.");
			$("#mk_discount_rate").focus();
			return false;
		}
		if(!isNumberCheck($("#mk_discount_rate").val())) {
			alert("할인율은 숫자만 입력 가능합니다.");
			$("#mk_discount_rate").focus();
			return false;
		}
		
		alert("등록이 완료되었습니다.");
	});
	
})
</script>
</html>