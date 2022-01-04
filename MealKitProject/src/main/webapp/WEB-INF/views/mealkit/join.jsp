<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

.container { margin-top:70px; margin-bottom:70px; }
</style>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<form class="form-horizontal" method="post" action="/mealkit/registerAjax" id="regiForm">
		
		<div class="form-group">
			<label class="control-label col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="userID" name="id" maxlength="16" placeholder="아이디를 입력하십시오."/>
			</div>
		</div>
		
		<div class="form-group">
			<div id="msg2" class="col-sm-5" align="right"></div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="password" name="password" maxlength="16" placeholder="비밀번호를 입력하십시오."/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">비밀번호 확인</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="repasswd" name="repasswd" maxlength="16" placeholder="비밀번호를 다시 입력하십시오."/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">이 름</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="name" maxlength="16" placeholder="이름을 입력하십시오."/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-3">
				<input type="hidden" class="form-control" id="tel" name="tel" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">전화번호</label>
			<div class="col-sm-2">
				<select class="form-control" id="tel1" name="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
			</div>
			<div class="input-group col-sm-3">
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
			<div id="msg1" class="col-sm-5" align="right"></div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">우편번호</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="zipcode" name="zipcode" readonly />
				<input type="button" class="form-control btn btn-success" onclick="daumZipCode()" value="우편번호검색" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">주 소</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="address01" id="address01" readonly />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">상세주소</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="address02" id="address02" />
				<input type="hidden" id="address" name="address" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">생일</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="birth" name="birth" />
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<button class="btn btn-primary signUpBtn" type="submit" id="submit">회원가입</button>
				<button class="cancel btn btn-danger" type="button">취소</button>
			</div>
		</div>
		
	</form>
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
/*
$('#address02').on("input", function(){
	var plus = $('#address02').val();
	 $('#address').val(addr+" "+plus);
}) 

// 아이디 중복검사 버튼을 눌렀을 경우
function fn_idCheck(){
	
	spaceCheck();
	
	$.ajax({
		url: "/member/idCheck",
		type: "post",
		dataType: "json",
		data: { "id": $('#userID').val() },
		success: function(data){
			if(data == 1) {
				alert("이미 사용 중인 아이디입니다.");
				$('#userID').focus();
			} else if(data == 0) {
				alert("사용 가능한 아이디입니다!");
				$('#idCheck').attr("value","Y");
			}
		}
	});
}
*/
// -----------------------------------------------------------------------------------------------------------------------
/*
function spaceCheck(){

	var str = document.getElementById('userID');

	if( str.value == '' || str.value == null ){
	    alert( '값을 입력해주세요' );
	    return false;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( str.value.replace( blank_pattern, '' ) == "" ){
	    alert(' 공백만 입력되었습니다 ');
	    return false;
	}

	//공백 금지
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test( str.value) == true){
	    alert(' 공백은 사용할 수 없습니다. ');
	    return false;
	}

	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if( special_pattern.test(str.value) == true ){
	    alert('특수문자는 사용할 수 없습니다.');
	    return false;
	}

}
*/
//-----------------------------------------------------------------------------------------------------------------------

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
		location.href="/";
	});
	
	// 아이디에 글자를 입력하면 실시간으로 사용이 가능한지 아닌지 검사한다.
	$('#userID').on("input", function(){
		var inputID = $('#userID').val();
		
		$.ajax({
			url: "/mealkit/idCheck",
			type: "post",
			dataType: "json",
			data: { "id" : inputID },
			success: function(data){
				if(inputID.length < 4) {
					$('#msg2').text("아이디가 너무 짧습니다.");
				} else if(inputID != "" && inputID.length >= 4 && data == "0") {
					$('#msg2').text("사용할 수 있는 아이디입니다.");
				} else if(data == 1) {
					$('#msg2').text("이미 사용 중인 아이디 입니다.");
				}
			}
		});
	});
	
	// 전화번호를 입력했을 시 이미 가입된 회원인지 아닌지 확인한다.
	$('#tel3').on("input", function(){
		var inputphone = $('#tel1').val() + "-" + $('#tel2').val() + "-" + $('#tel3').val();
		
		$.ajax({
			url: "/mealkit/phone",
			type: "post",
			dataType: "json",
			data: { "tel" : inputphone },
			success: function(data){
				if(data >= 1) {
					alert("이미 회원가입이 되어 있습니다.");
				}
			}
		});
	});
	
	$("#submit").click(function() {
		
		var str = document.getElementById('userID');

		if( str.value == '' || str.value == null ){
		    alert( '아이디를 입력해주세요' );
		    $("#userID").focus();
		    return false;
		}

		var blank_pattern = /^\s+|\s+$/g;
		if( str.value.replace( blank_pattern, '' ) == "" ){
		    alert(' 공백만 입력되었습니다 ');
		    return false;
		}

		//공백 금지
		//var blank_pattern = /^\s+|\s+$/g;(/\s/g
		var blank_pattern = /[\s]/g;
		if( blank_pattern.test( str.value) == true){
		    alert(' 공백은 사용할 수 없습니다. ');
		    return false;
		}

		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

		if( special_pattern.test(str.value) == true ){
		    alert('특수문자는 사용할 수 없습니다.');
		    return false;
		}
		
		if(isAlphaNumCheck(str.value) == false) {
			alert("아이디는 숫자와 영문자만 입력 가능합니다.");
			$('#userID').focus();
			return false;
		}
		
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
		alert("가입을 환영합니다.");
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
	// buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
	// buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
	// buttonText: "Select date"	// 조그만한 아이콘 툴팁
    minDate: new Date('1900-01-01'),
    maxDate: "-1D",

});


</script>
</body>
</html>