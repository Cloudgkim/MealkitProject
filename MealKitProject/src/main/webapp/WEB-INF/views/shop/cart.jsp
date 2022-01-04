<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member.id}의 장바구니</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
#header .inner .gnb li:nth-child(2) a { font-weight:700; }
.inner { width:960px; position:relative; }

/* zero */
.zBox { width:100%; height:180px; background:#fafafa; }
.zBox .inner { padding-top:60px; }
.zBox .inner p { font-size:20px; font-weight:700; }
.zBox .inner a { position:absolute; right:0; top:60px; width:250px; height:50px; border:1px solid #444; font-size:15px; text-align:center; color:#555; padding-top:13px; }

/* noze */
.jang { margin-top:50px; height:100px; }
.jang .title { font-size:20px; font-weight:700; }
.jang button { position:absolute; right:0; top:50px; }

.product { position:relative; }
.product a { font-size:15px; color:#666; }
.product a:first-child { margin-right:10px; }
.product a:last-child { position:absolute; left:92px; top:30px; color:red; }

.countcss { border:1px solid #999; height:32px; display:inline-block; margin-top:18px; }
.atm, .cartId { display:none; }
.totalM { font-size:20px; }
.totalM .real { margin-top:18px; display:inline-block; }
.btns { text-align:center; margin-bottom:70px; margin-top:50px; }
.btns a { margin-left:30px; }

.none { display:none; }

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<c:if test="${cnt=='zero'}">
	<div class="zBox">
		<div class="inner">
			<p>장바구니에</p>
			<p>밀키트를 담아주세요.</p>
			
			<a href="../shop/goods_list">밀키트 담기</a>
		</div>
	</div>
</c:if>

<c:if test="${cnt=='noze'}">
	<div class="jang">
		<div class="inner">
			<p class="title">장바구니</p>
			<button class="btn" type="button" onclick="deleteValue();">선택삭제</button>
		</div>
	</div>
	
	<div class="jangCart">
		<div class="inner">
			<div>
				<form id="choiceForm" action="/shop/goPay">
					<table class="table" border="1">
						<thead>
							<tr>
								<td align="center"><input id="allCheck" type="checkbox" name="allCheck"/></td>
								<td align="center" width="500">상품 정보</td>
								<td align="center">수량</td>
								<td align="center">주문금액</td>
							</tr>
						</thead>
						
						<tbody>
						
							<c:forEach items="${carts}" var="cart">
								<tr>
									<td align="center">
										<input name="RowCheck" type="checkbox" class="list-checkBox" value="${cart.cart_id}" />
										<input name="mk_id" type="checkbox" class="none" value="${cart.mk_id}" />
									</td>
									
									<td class="product">
										<a href="goods_view?mk_id=${cart.mk_id}"><img src="/resources${cart.mk_img}" width="70" height="70" /></a>
										<a href="goods_view?mk_id=${cart.mk_id}"><span>${cart.mk_name}</span></a>
										<a href="goods_view?mk_id=${cart.mk_id}"><span><fmt:formatNumber value="${cart.buy_price / cart.buy_count}" />원</span></a>
									</td>
									
									<td align="center"><span class="countcss">
										<button type="button" class="btn btn-sm minus">─</button> 
										<span>${cart.buy_count}</span>
										<span class="cartId">${cart.cart_id}</span>
										<button type="button" class="btn btn-sm plus">┼</button>
										</span>
									</td>
									
									<td class="none">
										<c:forEach items="${mealkits}" var="mealkit">
											<c:if test="${cart.mk_id eq mealkit.mk_id}">
												<span class = "mkcount">${mealkit.mk_count}</span>
											</c:if>
										</c:forEach>
									</td>

									<td align="center" class="totalM">
										<span class="atm">${cart.buy_price}</span>
										<span class="real"><fmt:formatNumber value="${cart.buy_price}" /></span>원
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="btns">
				<a href="../shop/goods_list" class="btn btn-lg btn-info">계속 쇼핑하기</a>
				<a href="#" id="choiceBuy" class="btn btn-lg btn-success">선택 주문하기</a>
				<a href="../shop/goPay" class="btn btn-lg btn-primary">전체 주문하기</a>
			</div>
		</div>
	</div>
	
</c:if>

<%@ include file="../include/footer.jsp" %>
</body>

<script>

$(function(){
	
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		var mk_id = $("input[name='mk_id']");
		
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
			mk_id[i].checked = this.checked;
		}
	});
	
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
		
		var chk_listArr = $("input[name='RowCheck']");
		var mk_id = $("input[name='mk_id']");
		
		for (var i=0; i < mk_id.length; i++){
			if(chk_listArr[i].checked){
				mk_id[i].checked = true;
	        } else {
	        	mk_id[i].checked = false;
	        }
		}
	});
});

$('#choiceBuy').click(function(){
	
	if($("input[name='mk_id']:checked").length == 0){
		alert("선택된 상품이 없습니다.");
	} else{
		$('#choiceForm').submit();		
	}
});

function deleteValue(){
	
	var valueArr = new Array();
    var list = $("input[name='RowCheck']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    
    if (valueArr.length == 0){
    	alert("선택된 제품이 없습니다.");
    	
    } else{
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk) {
			
			$.ajax({
			    url : "/shop/delete",         // 전송 URL
			    type : 'POST',                // GET or POST 방식
			    traditional : true,
			    data : { valueArr : valueArr },
	            success: function(jdata){
	                if(jdata == 'cc') {
	                    alert("삭제 성공");
	                    location.replace("cart")
	                }
	                else{
	                    alert("삭제 실패");
	                }
	            }
			});
		}
	}
}

$('.minus').click(function(){
	
var i = parseInt($(this).next().text());
	
	if(i<2) {
		return false;
	} else {
		var money = $(this).parent().parent().next().next().find('.atm').text();
		var realM = parseInt(money / i);
		i--;
		$(this).next().text(i);
		$(this).parent().parent().next().next().find('.real').text(Number(realM * i).toLocaleString());
		$(this).parent().parent().next().next().find('.atm').text(realM * i);
		
		$.ajax({
			url: "/shop/goUpdate",
			type: "post",
			dataType: "json",
			data: { "buy_price" : $(this).parent().parent().next().next().find('.atm').text(), "buy_count" : $(this).next().text(), "cart_id" : $(this).next().next().text() },
			success: function(data){ }
		});
	}
});

$('.plus').click(function(){
	
	var i = parseInt($(this).prev().prev().text());
	
	var j = $(this).parent().parent().next().find('.mkcount').text();
	if(i>=j){
		alert("재고수량보다 많이 구매하실 수 없습니다.");
		return;
	}
	
	var money = $(this).parent().parent().next().next().find('.atm').text();
	var realM = parseInt(money / i);
	i++;
	$(this).prev().prev().text(i);
	$(this).parent().parent().next().next().find('.real').text(Number(realM * i).toLocaleString());
	$(this).parent().parent().next().next().find('.atm').text(realM * i);
	
	$.ajax({
		url: "/shop/goUpdate",
		type: "post",
		dataType: "json",
		data: { "buy_price" : $(this).parent().parent().next().next().find('.atm').text(), "buy_count" : $(this).prev().prev().text(), "cart_id" : $(this).prev().text() },
		success: function(data){ }
	});
	
});

</script>

</html>