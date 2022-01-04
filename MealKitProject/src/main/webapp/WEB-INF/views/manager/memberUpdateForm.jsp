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

ul,li{ list-style:none; }
a { text-decoration:none; color:inherit; }
.menu_wrap .dep1 { fontsize:0; }
.menu_wrap .dep1 > li { display:inline-block; vertical-align:top; width:130px; text-align:center; background:#ddd; font-size:16px; padding:10px 0; }   
.menu_wrap .dep1 > li > strong { background:#808080; color:#fff; }
.menu_wrap .dep1 > li:hover > .dep2 { display:block; }
.menu_wrap .dep1 > li > strong { display:block; padding:10px 0; }
.menu_wrap .dep2 a { display:block; padding:10px 0; }
.menu_wrap .dep2 > li > a:focus { background:#ddd; color:#dc143c; }
.menu_wrap .dep2 > li > a:active { background:#222; color:#fff; }

.idInfo { font-size:25px; font-weight:700; margin-left:200px; }
.inner { width:960px; }

.btns { margin-bottom:70px; }
</style>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="../include/m_header.jsp" %>

<div class="container-fluid" style="background-color:#234234; color:#FFF; height:200px; text-align:center;">
	<br>
	<h1 style="margin-top:14px; font-size:5em;">밀키트 판매몰 관리</h1>
	<br>
	<h3 style="font-size:2em;">관리자가 밀키트 쇼핑몰에 관한 모든 것을 관리하는 페이지입니다.</h3>
	<br>
</div>
 
<div class="menu_wrap">
	<ul class="dep1">
		<li>
			<strong>사용자 관리</strong>
			
			<ul class = "dep2">
				<li><a href="/manager/memberListView">회원목록 조회</a></li>
			</ul>
		</li> 
	</ul>
</div>

<div class= "container-fluid" style="text-align:left; margin-top:13px; padding-left:150px;">
	<div class="inner">
		<form class="form-horizontal" method="post" action="/manager/memberUpdate" id="updateForm">
			<p class="idInfo">${id}님의 회원정보 수정</p>
			<hr/>
			
			<div class="form-group">
				<label class="control-label col-sm-3">아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="id" value="${id}" readonly />
				</div>
			</div>
					
			<div class="form-group">
				<label class="control-label col-sm-3">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password" name="password" maxlength="16" placeholder="새 비밀번호" />
				</div>
			</div>
	
			<div class="form-group">
				<label class="control-label col-sm-3">비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="repasswd" name="repasswd" maxlength="16" placeholder="새 비밀번호 확인" />
				</div>
			</div>
					
			<div class="form-group">
				<label class="control-label col-sm-3">이 름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="name" name="name" maxlength="16" />
				</div>
			</div>
			
			<input type="hidden" class="form-control" id="tel" name="tel" />
					
			<div class="form-group">
				<label class="control-label col-sm-3">전화번호</label>
				
				<div class="col-sm-2">
					<select class="form-control" id="tel1" name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				
				<div class="input-group col-sm-4">
					<div class="input-group-addon">-</div>
					
					<div>
						<input type="text" class="form-control col-sm-1" id="tel2" name="tel2" maxlength="4" placeholder="Tel"/>
					</div>
					
					<div class="input-group-addon">-</div>
					
					<div>
						<input type="text" class="form-control col-sm-1" id="tel3" name="tel3" maxlength="4" placeholder="Tel"/>
					</div>
				</div>
			</div>
				
			<div class="form-group">
				<label class="control-label col-sm-3">우편번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="zipcode" name="zipcode" readonly />
					<input type="button" class="form-control btn btn-success" onclick="daumZipCode()" value="우편번호검색" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-3">주 소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="address01" id="address01" readonly />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-3">상세주소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="address02" id="address02" />
					<input type="hidden" id="address" name="address" />
				</div>
			</div>
				
			<div class="form-group">
				<label class="control-label col-sm-3">생일</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="birth" name="birth" />
				</div>
			</div>
				
			<div class="form-group btns">
				<div class="col-sm-offset-3 col-sm-6">
					<button class="btn btn-primary signUpBtn" type="submit" id="submit">정보수정</button>
					<button class="cancel btn btn-danger" type="button">취소</button>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var addr = ''; // 주소 변수

function daumZipCode() {
	new daum.Postcode({
	    oncomplete: function(data) {
	
	        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	            addr = data.roadAddress;
	        } else { // 사용자가 지번 주소를 선택했을 경우(J)
	            addr = data.jibunAddress;
	        }
	        document.getElementById('zipcode').value = data.zonecode;
	        document.getElementById("address01").value = addr;
	        // 커서를 상세주소 필드로 이동한다.
	        document.getElementById("address02").focus();
	        
	        $('#address').val(addr);
	    }
	}).open({
		popupKey:"nopop"
	});
}

// 숫자 검사
function isNumberCheck(inputVal) {
	
	var_normalize = /[^0-9]/gi; // 정규식
	if(var_normalize.test(inputVal) == true) {
		return false;
	} else {
		return true;
	}
}

// 검사 로직
function containsCharsOnly(input, chars) {
	for(var inx=0; inx < input.length; inx++) {
		if(chars.indexOf(input.charAt(inx)) == -1) {
			return false;
		}
	}
}

function containsChars(input, chars) {
	for(var inx=0; inx < input.length; inx++) {
		if(chars.indexOf(input.charAt(inx)) != -1) {
			return true;
		}
	}
}

// 영문자와 숫자 판별
function isAlphaNumCheck(input) {
	var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	return containsCharsOnly(input, chars);
}

// 이름 검사
function isNameCheck(input) {
	var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*()_+=-[]{}?;:\|<>.,";
	return containsChars(input, chars);
}

// jQuery를 이용하여 페이지가 로딩되면 할 수 있는 것들을 만든다.
$(function(){
	
	// 취소 버튼을 누르면
	$('.cancel').click(function(){
		location.href="memberListView";
	});
	
	$("#submit").click(function() {
		
		if($("#password").val() == "") {
			alert("비밀번호를 입력하십시오.");
			$("#password").focus();
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
		if($("#repasswd").val() == "") {
			alert("비밀번호 다시 입력하십시오.");
			$("#repasswd").focus();
			return false;
		}
		if($('#password').val() != $('#repasswd').val()) {
			alert("비밀번호가 같지 않습니다.");
			$("#repasswd").focus();
			return false;
		}
		if($("#name").val() == "") {
			alert("이름를 입력하십시오.");
			$("#name").focus();
			return false;
		}
		if(isNameCheck($("#name").val()) == true) {
			alert("이름에는 숫자나 특수문자,영문을 사용할 수 없습니다.");
			$('#name').focus();
			return false;
		}
		if($("#tel2").val() == "") {
			alert("전화번호를 입력하십시오.");
			$("#tel2").focus();
			return false;
		}
		if(!isNumberCheck($("#tel2").val())) {
			alert("전화번호는 숫자만 입력이 가능합니다.");
			$("#tel2").focus();
			return false;
		}
		
		if($("#tel3").val() == "") {
			alert("전화번호를 입력하십시오.");
			$("#tel3").focus();
			return false;
		}
		if(!isNumberCheck($("#tel3").val())) {
			alert("전화번호는 숫자만 입력이 가능합니다.");
			$("#tel3").focus();
			return false;
		}
		
		if($("#address01").val() == "") {
			alert("주소를 입력하십시오.");
			$("#address02").focus();
			return false;
		}
		if($("#address02").val() == "") {
			alert("주소를 입력하십시오.");
			$("#address02").focus();
			return false;
		}
		
		if($("#birth").val() == "") {
			alert("생일을 입력하십시오.");
			$("#birth").focus();
			return false;
		}
		
		$('#tel').val( $('#tel1').val() + "-" + $('#tel2').val() + "-" + $('#tel3').val() );
		$('#address').val($('#address01').val()+ " " + $('#address02').val());
		
		alert("회원 정보가 수정되었습니다.");
	});
})

$("#birth").datepicker();

$.datepicker.setDefaults({
	showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다. 
	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다. 
	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
    dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
    prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
    nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
    closeText: '닫기', // 닫기 버튼 텍스트 변경
    currentText: '오늘', // 오늘 텍스트 변경
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
    showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
    yearSuffix: '년',	//
    showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
    minDate: new Date('1900-01-01'),
    maxDate: "-1D",
});


</script>
</body>
</html>