<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${mealkit.mk_name}</title>
<%@ include file="../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
#header .inner .gnb li:nth-child(3) a { font-weight:700; }
#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; z-index:5; }

#container { margin-top:50px; }
#container .inner { width:960px; }
#container .inner:after { content:""; clear:both; display:block; }

#allGoods { width:180px; float:left; }
.gTitle { font-size:25px; font-weight:700; color:#333; border-bottom:1px solid #777; padding-bottom:20px; margin-bottom:20px; }
.goods li { font-size:15px; margin-bottom:15px; }
.goods li a { color:#888; }
.goods li a:hover { color:#111; text-decoration:none; }

#showGoods { width:750px; float:right; margin-top:50px; }
#showGoods .img { float:left; margin-right:30px; }
.list { float:left; }
.list li { font-size:17px; color:#555; }
.list li:nth-child(1) { width:250px; margin-bottom:15px; }
.list li:nth-child(3) { color:red; }
.list li:first-child { color:#333; font-size:25px; font-weight:500; }
.list .price { color:#777; text-decoration:line-through; font-size:14px; border-bottom:1px solid #eee; width:250px; padding-bottom:60px; margin-bottom:30px; }
.list .price0 { border-bottom:1px solid #eee; width:250px; padding-bottom:60px; margin-bottom:40px; }

.goodsCnt { height:270px; }
.goodsCnt:after { content:""; clear:both; display:block; }
.goodsCnt li:first-child { float:left; font-size:15px; margin-top:5px; }
.goodsCnt li:last-child { border:1px solid #999; float:right; margin-right:10px; }

.goodsPrice { height:80px; }
.goodsPrice:after { content:""; clear:both; display:block; }
.goodsPrice li:first-child { float:left; font-size:15px; margin-top:5px; }
.goodsPrice li:last-child { float:right; margin-right:10px; color:red; font-size:15px; margin-top:5px; }

.btns:after { content:""; clear:both; display:block; }
.btns li:first-child { float:left; font-size:15px; margin-top:5px; }
.btns li:last-child { float:right; margin-right:10px; color:red; font-size:15px; margin-top:5px; }
.btns li .btn { width:125px; }

#detail { margin-top:100px; margin-bottom:80px; }
#detail .img { margin-bottom:50px; }
#detail p { font-size:20px; width:800px; margin-bottom:50px; }

.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}

#listReview { margin-top:18px; margin-left:-5px; }

.bigReview { border-bottom:1px solid #e9e9e9; padding-bottom:20px; width:750px; }
.bigReview:after { content:""; display:block; clear:both; }
#r_detail { margin-top:7px; width:650px; float:left; }
.reviewWriteBtn { float:right; margin-right:30px; margin-top:20px; }
.tt { word-break:break-all; }

</style>
</head>
<body onload="InitializeStaticMenu();">
<%@ include file="../include/header.jsp" %>

<div id="STATICMENU">
	<div>
		<button type="button" class="btn btn-warning btn-lg" onclick="window.scrollTo(0,0);">▲</button>
	</div>
	
	<div>
		<button type="button" class="btn btn-warning btn-lg" onclick="window.scrollTo(0,99999999);">▼</button>
	</div>
</div>

<div id="container">
	<div class="inner">
	
		<div id="allGoods">
			<p class="gTitle">모든 반찬</p>
			<ul class="goods">
				<c:forEach items="${kind}" var="kind">
					<li><a href = "goods_kind?kind_name=${kind.kind_name}"> ${kind.kind_name} (${kind.kind_count})</a></li>
				</c:forEach>
			</ul>
		</div>
		
		<input type="hidden" name="r_mkno" value="${mealkit.mk_id}"/>
		<input type="hidden" name="member_id" value="${member.id}" />
		
		<div id="showGoods">
			<div class="img"><img src="/resources${mealkit.mk_img}" alt="images" width="450px" height="450px" /></div>
			
			<ul class="list">
				<li>${mealkit.mk_name}</li>
				<c:if test="${mealkit.mk_discount_rate == 0}">
					<li class="price0">${mealkit.mk_price}원</li>
				</c:if>
				
				<c:if test="${mealkit.mk_discount_rate != 0}">
					<li>${mealkit.mk_discount_rate}% <fmt:formatNumber value="${mealkit.mk_price * (100- mealkit.mk_discount_rate) / 100}" type="number" maxFractionDigits="0" />원</li>
					<li class="price">${mealkit.mk_price}원</li>
				</c:if>
			</ul>
			
			<ul class="goodsCnt">
				<li>상품 수량</li>
				<li><button type="button" class="btn btn-sm minus">─</button> <span>1</span> <button type="button" class="btn btn-sm plus">┼</button></li>
			</ul>
			
			<hr>
			<ul class="goodsPrice">
				<li>총 상품 금액</li>
				<li><span><fmt:formatNumber value="${mealkit.mk_price * (100- mealkit.mk_discount_rate) / 100}" type="number" maxFractionDigits="0" /></span>원</li>
			</ul>
			
			<ul class="btns">
				<li><button type="button" class="btn btn-primary love">찜하기</button></li>
				<li><button type="button" class="btn btn-danger goCart">장바구니 담기</button></li>
			</ul>
			
			<form action="/shop/goCart" method="post" id="cartForm">
				<input type="hidden" name="mk_img" value="${mealkit.mk_img}" />
				<input type="hidden" name="buy_id" value="${member.id}" />
				<input type="hidden" name="mk_id" value="${mealkit.mk_id}" />
				<input type="hidden" name="mk_name" value="${mealkit.mk_name}" />
				<input type="hidden" name="buy_price" id="buy_price" />
				<input type="hidden" name="buy_count" id="buy_count" />
			</form>
			
			<form action="/shop/goZzim?mk_id=${mealkit.mk_id}" method="post" id="zzimForm" name="zzimForm">
			   <input type="hidden" name="buy_id" id="buy_id" value="${member.id}"/>
			   <input type="hidden" name="mk_id"  id="mk_id" value="${mealkit.mk_id}"/>
			   <input type="hidden" name="mk_name" id="mk_name" value="${mealkit.mk_name}"/>
			   <input type="hidden" name="mk_price" id="mk_price" value="${mealkit.mk_price * (100- mealkit.mk_discount_rate) / 100}"/>
			   <input type="hidden" name="mk_img" id="mk_img" value="${mealkit.mk_img}"/>
			</form>
			
			<div id="detail">
				<div class="img"><img src="/resources${mealkit.mk_img}" alt="images" width="800px" height="auto" /></div>
				<p>${mealkit.mk_content}</p>
				<img src="/resources/images/sajin1.jpg" alt="사진1" />
				<img src="/resources/images/close.jpg" alt="사진2" />
			</div>
			
			<c:if test="${msg==true}">
				<form name="reviewForm" method="post">
					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="rating" value="5"checked="checked" />
						<label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="rating" value="4"/>
						<label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="rating" value="3"/>
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="rating" value="2"/>
						<label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="rating" value="1" />
						<label for="1-star" class="star">★</label>
					</div>
					
					<div class="bigReview">
						<textarea rows="3" cols="130" id="r_detail" placeholder ="리뷰를 작성해 주세요" required ="required"></textarea>
						<button type="button" class="reviewWriteBtn btn" id="btnReview">작성</button>
					</div>
					
				</form>
			</c:if>
			
			<div id="listReview"></div>
			
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp" %>
</body>

<script>

$(document).ready(function() {
	listReview2(); //json리턴방식
	
	// 댓글쓰기 버튼클릭 이벤트
	$("#btnReview").click(function(){
		if($("#r_detail").val() == "") {
			alert("내용을 입력하세요");
			$("#r_detail").focus();
	        return; 
		}
		
		r_detail();
	});
	
});

function r_detail(){

	var r_detail = $("#r_detail").val();
	var r_mkno = "${mealkit.mk_id}"  //원글번호
	
	var r_writer = "${member.id}"
	var star = $('input[name=rating]:checked').val();
	
	$.ajax({
		type : "post",
		url : "/shop/writeReview",
		data :  {r_detail: r_detail, r_mkno: r_mkno, r_writer: r_writer, star : star}, //변수이름 :실제값
		success:function(){
			alert("한줄평이 등록되었습니다.");
			$("#r_detail").val("");
			listReview2();
		}
	});
}

function listReview2() {
  
	$.ajax({
		type:"get",
		url :"/shop/readReview?r_mkno=${mealkit.mk_id}",
		// comment아래 listJson으로 매핑된 메소드를 불러서 그 return값을 result로 받아서 아이디가 listCommetn인 div에 뿌려줘
		success:function(result) {
				
	        var output ="<table class='tt' border-bottom=1>";
	        
			for(var i in result){
				output += "<tr>";
				output += "<td>" + "&nbsp" + "&nbsp" + "<b>"+result[i].r_writer+"</b>";
				output += "("+changeDate(result[i].r_date)+")";
				output += "&nbsp" + "&nbsp"+"(별점 : "+result[i].star+")"+"&nbsp" + "&nbsp";
				output += "<button onclick= reviewDelete1("+result[i].r_no+");>삭제</button><br/><br/></td></tr>";
				output += "<tr><td>&nbsp" + "&nbsp" + result[i].r_detail+"<hr/></td></tr>";
	        }
			
	        output +="</table>";
	        
	        $("#listReview").html(output);
	        
		}   
     
	});
}

function reviewDelete1(r_no){
	var result = confirm("삭제하시겠습니까?(작성자 본인만 할 수 있습니다.)");
	
	if(result){
		reviewDelete(r_no);
	}
}

function reviewDelete(r_no){
	
	$.ajax({
		url : "/shop/deleteReview/"+r_no,
		type : "post",
		success : function(data){
			if(data == 1){
				listReview2();
			}
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

$('.goods li a').click(function(){
	$('.goods li a').css({ color:"#888", });
	$(this).css({ color:"#111" });
});

var i=1;

$('.minus').click(function(){
	
	if(i<2) {
		alert("최소 수량은 1개입니다.");
	} else {
		i--;
		$('.goodsCnt li:eq(1) span').text(i);
		var price = Math.ceil(${mealkit.mk_price * (100- mealkit.mk_discount_rate) / 100});
		$('.goodsPrice li:eq(1) span').text(Number(price * i).toLocaleString());
	}
});

$('.plus').click(function(){
	
	$.ajax({
		type:"POST",
        url :"/shop/goods_count",
        data:{ "cnt" : $('.goodsCnt li:eq(1) span').text(), "mk_id" : ${mealkit.mk_id} },
        success:function(result){
        	if(result <= $('.goodsCnt li:eq(1) span').text()) {
        		alert("밀키트 재고 수량을 초과했습니다.");
        	} else {
        		i++;
        		$('.goodsCnt li:eq(1) span').text(i);
        		var price = Math.ceil(${mealkit.mk_price * (100- mealkit.mk_discount_rate) / 100});
        		$('.goodsPrice li:eq(1) span').text(Number(price * i).toLocaleString());
        	}
		}
	}); 
			
});

$('.goCart').click(function(){
	var price = Math.ceil(${mealkit.mk_price * (100- mealkit.mk_discount_rate) / 100});
	var buy_price = price * i;
	var buy_count = parseInt($('.goodsCnt li:eq(1) span').text());
	
	$('#buy_price').val(buy_price);
	$('#buy_count').val(buy_count);
	$('#cartForm').submit();
});

$('.love').click(function(){
	
	var mk_id = $("#mk_id").val();
	var buy_id = $("#buy_id").val();
	var mk_name = $("#mk_name").val();
	var mk_price = parseInt($("#mk_price").val());
	var mk_img = $("#mk_img").val();
	   
	if(buy_id==""){
		$('#zzimForm').submit();
	} else {
    	
		$.ajax({
			type:"POST",
	        url :"/shop/zzimCheck",
	        data:{mk_id:mk_id, buy_id:buy_id, mk_name:mk_name, mk_price:mk_price, mk_img:mk_img},
	        success:function(result){
	         
	           if(result!=1){ //select해서 1을안가져왔따면 false라서 0을 가져온상태!
	             	alert("상품을 찜하셨습니다.");
	           
					if(confirm("'찜한상품'으로 이동하시겠습니까?")){
						location.href = "/shop/zzim";
	                }
					
	           } else { //select해서 1을 가져왔다면
					alert("이미 찜하신 상품입니다.");
	           }
			}
		});
	}
});
</script>

</html>