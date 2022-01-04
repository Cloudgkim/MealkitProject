  <%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member.id}님의 결제하기</title>

<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
#header .inner .gnb li:nth-child(2) a { font-weight:700; }
.inner { width:960px; position:relative; }

.jang { margin-top:50px; height:80px; }
.jang .title { font-size:30px; font-weight:700; }

.product { position:relative; font-size:15px; color:#666; }
.product .name { margin-left:10px; }
.product span:last-child { position:absolute; left:92px; top:30px; color:red; }

.countcss { height:32px; display:inline-block; margin-top:18px; font-size:20px; }
.atm { display:none; }
.totalM { font-size:20px; }
.totalM .real { margin-top:18px; display:inline-block; }
.btns { text-align:center; margin-bottom:70px; margin-top:50px; }
.btns a:last-child { margin-left:30px; }

.amount { font-size:20px; color:red; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="jang">
	<div class="inner">
		<p class="title">결제하기</p>
	</div>
</div>

<div class="jangCart">
	<div class="inner">
		<div>
			<table class="table" border="1">
				<thead>
					<tr>
						<td align="center" width="500">상품 정보</td>
						<td align="center">수량</td>
						<td align="center">주문금액</td>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${carts}" var="cart">
						<tr>
							<td class="product">
								<img src="/resources${cart.mk_img}" width="70" height="70" />
								<span class="name">${cart.mk_name}</span>
								<span><fmt:formatNumber value="${cart.buy_price / cart.buy_count}" />원</span>
							</td>
							<td align="center"><span class="countcss"><span>${cart.buy_count}</span></span></td>
							<td align="center" class="totalM">
								<span class="atm">${cart.buy_price}</span>
								<span class="real"><fmt:formatNumber value="${cart.buy_price}" /></span>원
							</td>
						</tr>
					</c:forEach>
						<tr>
							<td align="center">(3 만원 이상 구매시 무료 배송)</td>
							<td align="center">총 금액</td>
							<td class="amount" align="right">
							<c:choose>
								<c:when test= "${allMoney < 30000}">
									총 주문금액 + 배송비 : <fmt:formatNumber value="${allMoney + 5000}" />원
								</c:when>
								<c:when test= "${allMoney > 30000}">
									총 주문금액 : <fmt:formatNumber value="${allMoney}" />원
								</c:when>
							</c:choose>
							</td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<div class="jang">
			<div class="inner">
				<p class="title">주문자 정보</p>
			</div>
		</div>
		
		<form class="form-horizontal" method="post" action="/shop/goPay" id="goPayForm">
			
			<div class="form-group">
				<label class="control-label col-sm-1">이 름</label>
				<c:forEach items="${RowCheck}" var="RowCheck">
					<input type="hidden" name="RowCheck" value="${RowCheck}" />
				</c:forEach>
				<c:forEach items="${mk_id}" var="mk_id">
					<input type="hidden" name="mk_id" value="${mk_id}" />
				</c:forEach>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="name" name="delivery_name" maxlength="16" placeholder="이름을 입력하십시오."/>
				</div>
			</div>
			
			<input type="hidden" class="form-control" id="tel" name="delivery_tel" />
			
			<div class="form-group">
				<label class="control-label col-sm-1">전화번호</label>
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
				<label class="control-label col-sm-1">우편번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="zipcode" name="zipcode" readonly />
					<input type="button" class="form-control btn btn-success" onclick="daumZipCode()" value="우편번호검색" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1">주 소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="address01" id="address01" readonly />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1">상세주소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="address02" id="address02" />
					<input type="hidden" id="address" name="delivery_address" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-1">가상 계좌</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="account" id="account" value="국민은행 12345-123-123456" readonly />
				</div>
			</div>
		</form>
		
		<div class="btns">
			<a href="../shop/cart" class="btn btn-lg btn-info">취소하기</a>
			<a href="#" id="submit" class="btn btn-lg btn-primary">주문하기</a>
		</div>
		
	</div>
</div>
<%@ include file="../include/footer.jsp" %>

</body>

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

function containsChars(input, chars) {
	for(var inx=0; inx < input.length; inx++) {
		if(chars.indexOf(input.charAt(inx)) != -1) {
			return true;
		}
	}
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

// 이름 검사
function isNameCheck(input) {
	
	var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*()_+=-[]{}?;:\|<>.,";
	return containsChars(input, chars);
}

$("#submit").click(function() {
	
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
	
	$('#tel').val( $('#tel1').val() + "-" + $('#tel2').val() + "-" + $('#tel3').val() );
	$('#address').val($('#address01').val()+ " " + $('#address02').val());
	alert("주문이 완료되었습니다.");
	
	$('#goPayForm').submit();
});


</script>

</html>