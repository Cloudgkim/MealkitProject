<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반찬 보기</title>
<%@ include file="../include/includeFile.jsp" %>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
#header .inner .gnb li:nth-child(3) a { font-weight:700; }

#container { margin-top:50px; }
#container .inner { width:960px; }
#container .inner:after { content:""; clear:both; display:block; }

#allGoods { width:180px; float:left; }
.gTitle { font-size:25px; font-weight:700; color:#333; border-bottom:1px solid #777; padding-bottom:20px; margin-bottom:20px; }
.goods li { font-size:15px; margin-bottom:15px; }
.goods li a { color:#888; }
.goods li a:hover { color:#111; text-decoration:none; }

#showGoods { width:750px; float:right; position:relative; padding-bottom:50px; }
.list { float:left; width:230px; margin-right:20px; margin-bottom:30px; }
.list li a { color:#777; font-size:15px; }
.list li:nth-child(2) a { color:#333; font-size:23px; font-weight:500; }
.list li:first-child { margin-bottom:15px; }
.list .price { float:left; margin-right:5px; font-size:17px; }
.list .price a { color:red; }
.list .price.line a { color:#777; text-decoration:line-through; font-size:14px; }

.lover { position:relative; }
.love { border:0; position:absolute; left:7px; bottom:7px; font-size:25px; color:#fff; width:45px; height:45px; background:rgba(0,0,0,0.5); text-align:center; padding-top:7px; }
.goCart { border:0; position:absolute; right:7px; bottom:7px; font-size:25px; color:#fff; width:45px; height:45px; background:rgba(0,0,0,0.5); text-align:center; padding-top:6px; }

.cut { height:30px; overflow:hidden; text-overflow:clip; text-overflow:ellipsis; white-space:nowrap; margin-top:10px; }

</style>

<body>
<%@ include file="../include/header.jsp" %>
    
<div id= "container">
	<div class = "inner">
		<div id="allGoods">
		
			<p class="gTitle">모든 반찬</p>
			
			<ul class="goods">
				<c:forEach items="${kind}" var ="kind">
					<li><a href = "goods_kind?kind_name=${kind.kind_name}"> ${kind.kind_name} (${kind.kind_count})</a></li>
				</c:forEach>
			</ul>
		</div>
	
		<div id ="showGoods">
			    
			<p class="gTitle">${kindView.kind_name}</p>
			
			<c:forEach items="${listPage}" var ="list">
				<ul class="list">
					<li class="lover">
						<a href="goods_view?mk_id=${list.mk_id}">
							<img src="/resources${list.mk_img}" alt="images" width="230px" height="230px" />
						</a>
						<button type="button" class="love"><span class="glyphicon glyphicon-heart-empty"></span></button>
						<input type="hidden" value="${list.mk_id}" />
						<input type="hidden" value="${member.id}" />
						<input type="hidden" value="${list.mk_name}" />
						<input type="hidden" value="${list.mk_price * (100- list.mk_discount_rate) / 100}" />
						<input type="hidden" value="${list.mk_img}" />
						
						<form action="/shop/goCart" method="post">
							<input type="hidden" name="mk_id" value="${list.mk_id}" />
							<input type="hidden" name="buy_id" value="${member.id}" />
							<input type="hidden" name="mk_name" value="${list.mk_name}" />
							<input type="hidden" name="buy_price" value="${list.mk_price * (100- list.mk_discount_rate) / 100}" />
							<input type="hidden" name="mk_img" value="${list.mk_img}" />
							<input type="hidden" name="buy_count" value="1" />
						</form>
						<button type="button" class="goCart"><span class="glyphicon glyphicon-shopping-cart"></span></button>
					</li>
					
					<li><a href="goods_view?mk_id=${list.mk_id}">${list.mk_name}</a></li>
					<li class="cut"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_content}</a></li>
					<li><a href="goods_view?mk_id=${list.mk_id}">${list.mk_kind}</a></li>
					
					<c:if test="${list.mk_discount_rate == 0}">
						<li class="price"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_price}원</a></li>
					</c:if>
					
					<c:if test="${list.mk_discount_rate != 0}">
						<li class="price"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_discount_rate}%</a></li>
						<li class="price"><a href="goods_view?mk_id=${list.mk_id}"><fmt:formatNumber value="${list.mk_price * (100- list.mk_discount_rate) / 100}" type="number" maxFractionDigits="0" />원</a></li>
						<li class="price line"><a href="goods_view?mk_id=${list.mk_id}"><fmt:formatNumber value="${list.mk_price}" />원</a></li>
					</c:if>
				</ul>
			</c:forEach>
			
		</div>  
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>

<script>
$('.love').click(function(){
	
	var mk_id = $(this).next().val();
	var buy_id = $(this).next().next().val();
	var mk_name = $(this).next().next().next().val();
	var mk_price = parseInt($(this).next().next().next().next().val());
	var mk_img = $(this).next().next().next().next().next().val();
	
	if(buy_id == ""){
		location.href="/shop/goZzim";
	} else {
    	
		$.ajax({
			type:"POST",
	        url :"/shop/zzimCheck",
	        data:{ mk_id:mk_id, buy_id:buy_id, mk_name:mk_name, mk_price:mk_price, mk_img:mk_img },
	        success:function(result){
	         
	           if(result!=1){ //select해서 1을안가져왔따면 false라서 0을 가져온상태!
	             	alert("상품을 찜하셨습니다.");
	           
					if(confirm("'찜한상품'으로 이동하시겠습니까?")){
						location.href="/shop/zzim";
	                }
					
	           } else { //select해서 1을 가져왔다면
					alert("이미 찜하신 상품입니다.");
	           }
			}
		});
	}
});

$('.goCart').click(function(){
	
	var mk_price = $(this).prev().children().eq(3).val();
	$(this).prev().children().eq(3).val(parseInt(mk_price));
	$(this).prev().submit();
});

</script>
</html>