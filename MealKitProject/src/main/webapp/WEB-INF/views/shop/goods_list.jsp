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
.searchType { width:70px; height:40px; }
.search { width:290px; }
.searchBtn { position:absolute; right:0; top:0; }
#searchKeyword { height:40px; }

#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; z-index:5; }

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

.cut { height:30px; overflow:hidden; text-overflow:clip; text-overflow:ellipsis; white-space:nowrap; margin-top:10px; }
/*
.paging { position:absolute; left:300px; bottom:10px; }
.ppic:after { content:""; clear:both; display:block; }
.ppic li a { font-size:20px; color:#444; }
.pic { float:left; margin-right:10px; }
*/

.lover { position:relative; }
.love { border:0; position:absolute; left:7px; bottom:7px; font-size:25px; color:#fff; width:45px; height:45px; background:rgba(0,0,0,0.5); text-align:center; padding-top:6px; }
.goCart { border:0; position:absolute; right:7px; bottom:7px; font-size:25px; color:#fff; width:45px; height:45px; background:rgba(0,0,0,0.5); text-align:center; padding-top:6px; }

.kindList:after { content:""; display:block; clear:both; }

</style>

<body onload="InitializeStaticMenu();">

<div id="STATICMENU">
	<div>
		<button type="button" class="btn btn-warning btn-lg" onclick="window.scrollTo(0,0);">▲</button>
	</div>
	
	<div>
		<button type="button" class="btn btn-warning btn-lg" onclick="window.scrollTo(0,99999999);">▼</button>
	</div>
</div>

<div id="header">
	<div class="inner">
		<h1><a href="/"><img src="/resources/images/logo.svg" alt="logo" /></a></h1>
		<c:if test="${member == null}">
			<ul>
				<li><a href="../mealkit/join">회원가입</a></li>
				<li><a href="../mealkit/login">로그인</a></li>
			</ul>
		</c:if>
		
		<c:if test="${member != null}">
			<ul>
				<li><a href="../mealkit/myPage">내 정보</a></li>
				<li><a href="../mealkit/delete">회원 탈퇴</a></li>
				<li class="logout"><a href="#">로그아웃</a></li>
			</ul>
		</c:if>
		
		<ul class="gnb">
			<li><a href="../shop/zzim"><span class="glyphicon glyphicon-heart"></span> 찜한상품</a></li>
			<li><a href="../shop/cart"><span class="glyphicon glyphicon-credit-card"></span> 장바구니</a></li>
			<li><a href="../shop/goods_list"><span class="glyphicon glyphicon-apple"></span> 반찬보기</a></li>
			<li><a href="../mealkit/story"><span class="glyphicon glyphicon-user"></span> 이야기</a></li>
		</ul>
		
		<div class="search">
			<form action="goods_list_search" id="searchList">
				<select class="searchType" name="searchType">
					<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제품 이름</option>
					<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>종류</option>
				</select>
				 
				<input type="text" name="keyword" id="searchKeyword" placeholder="검색어를 입력하십시오"/>
			</form>
			
			<button class='searchBtn'><span class="glyphicon glyphicon-search"></span></button>
		</div>
	</div>
</div>

<div id="container">
	<div class="inner">
	
		<div id="allGoods">
		
			<p class="gTitle">모든 반찬</p>
			<ul class="goods">
				<c:forEach items="${kinds}" var="kind">
					<li><a href = "goods_kind?kind_name=${kind.kind_name}"> ${kind.kind_name} (${kind.kind_count})</a></li>
				</c:forEach>
			</ul>
		</div>
		
		<div id="showGoods">
			<c:if test="${kind == null}">
				<c:forEach items="${kinds}" var="kind">
					<c:if test="${kind.kind_count != 0}">
					
						<p class="gTitle">${kind.kind_name}</p>
						
						<div class="kindList">
							<c:forEach items="${allMeals}" var="list">
								<c:if test="${kind.kind_name == list.mk_kind}">
								
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
										<li class="gkind"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_kind}</a></li>
										
										<c:if test="${list.mk_discount_rate == 0}">
											<li class="price"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_price}원</a></li>
										</c:if>
										
										<c:if test="${list.mk_discount_rate != 0}">
											<li class="price"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_discount_rate}%</a></li>
											<li class="price"><a href="goods_view?mk_id=${list.mk_id}"><fmt:formatNumber value="${list.mk_price * (100- list.mk_discount_rate) / 100}" type="number" maxFractionDigits="0" />원</a></li>
											<li class="price line"><a href="goods_view?mk_id=${list.mk_id}"><fmt:formatNumber value="${list.mk_price}" />원</a></li>
										</c:if>
									</ul>
								</c:if>
							</c:forEach>
						</div>
						
					</c:if>
				</c:forEach>
			</c:if>
		
			<c:forEach items="${kind}" var="kind">
				<c:if test="${kind.kind_count != 0}">
					<p class="gTitle">${kind.kind_name}</p>
					
					<div class="kindList">
						<c:forEach items="${allMeals}" var="list">
							<c:if test="${kind.kind_name == list.mk_kind}">
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
										
										<form class="loveOrCart" action="/shop/goCart" method="post">
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
									<li><a href="goods_view?mk_id=${list.mk_id}">${list.mk_content}</a></li>
									<li class="gkind"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_kind}</a></li>
									
									<c:if test="${list.mk_discount_rate == 0}">
										<li class="price"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_price}원</a></li>
									</c:if>
									
									<c:if test="${list.mk_discount_rate != 0}">
										<li class="price"><a href="goods_view?mk_id=${list.mk_id}">${list.mk_discount_rate}%</a></li>
										<li class="price"><a href="goods_view?mk_id=${list.mk_id}"><fmt:formatNumber value="${list.mk_price * (100- list.mk_discount_rate) / 100}" type="number" maxFractionDigits="0" />원</a></li>
										<li class="price line"><a href="goods_view?mk_id=${list.mk_id}"><fmt:formatNumber value="${list.mk_price}" />원</a></li>
									</c:if>
								</ul>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
			<!--
			<div class="paging">
				<ul class="ppic">
					<c:if test="${pageMaker.prev}">
						<li><a href="goods_list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if> 
					
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="pic"><a href="goods_list${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="goods_list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if> 
				</ul>
			</div>
			-->
		</div>
		
	</div>
</div>
	
<%@ include file="../include/footer.jsp" %>
</body>

<script>
$('.goods li a').click(function(){
	
	$('.goods li a').css({ color:"#888", });
	$(this).css({ color:"#111" });
});
/*
$('.searchBtn').click(function() {
	self.location = "goods_list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#searchKeyword').val());
});
*/
$('.searchBtn').click(function() {
	$('#searchList').submit();
});

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



$('.logout').click(function(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		location.href="/mealkit/logout";
	} 
});
</script>
</html>