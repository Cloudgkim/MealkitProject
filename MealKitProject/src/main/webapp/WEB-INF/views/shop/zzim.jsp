<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member.id}의 찜한상품</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
#header .inner .gnb li:first-child a { font-weight:700; }
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

.allChc span { margin-left:45px; font-size:15px; }
.allChc span input { margin-right:13px; }

.product { position:relative; }
.product a { font-size:15px; color:#666; }
.product a:first-child { margin-right:10px; }
.product a:last-child { position:absolute; left:92px; top:30px; color:red; }

tr td:last-child a { font-size:25px; color:#777; margin-top:20px; display:inline-block; }

.countcss { border:1px solid #999; height:32px; display:inline-block; margin-top:18px; }
.atm, .cartId { display:none; }
.totalM { font-size:20px; }
.totalM .real { margin-top:18px; display:inline-block; }
.btns { text-align:center; margin-bottom:70px; margin-top:50px; }
.btns a:last-child { margin-left:30px; }

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<c:if test="${cnt=='zero'}">
	<div class="zBox">
		<div class="inner">
			<p>찜한상품이</p>
			<p>없습니다</p>
			
			<a href="../shop/goods_list">쇼핑하러 가기</a>
		</div>
	</div>
</c:if>

<c:if test="${cnt=='noze'}">
	<div class="jang">
		<div class="inner">
			<p class="title">찜한 상품</p>
			<button class="btn" type="button" onclick="deleteValue();">선택삭제</button>
		</div>
	</div>
	
	<div class="jangCart">
		<div class="inner">
			<div>
				<table class="table" border="1">
					<thead>
						<tr>
							<td class="allChc" colspan="3">
								<span><input id="allCheck" type="checkbox" name="allCheck"/>전체 선택</span>
							</td>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${zzims}" var="zzim">
							<tr>
								<td align="center">
									<input name="RowCheck" type="checkbox" class="list-checkBox" value="${zzim.zzim_id}" />
									<input type="hidden" value="${zzim.buy_id}" />
									<input type="hidden" value="${zzim.mk_id}" />
									<input type="hidden" value="${zzim.mk_price}" />
								</td>
								<td class="product">
									<a href="goods_view?mk_id=${zzim.mk_id}"><img src="/resources${zzim.mk_img}" width="70" height="70" /></a>
									<a href="goods_view?mk_id=${zzim.mk_id}"><span>${zzim.mk_name}</span></a>
									<a href="goods_view?mk_id=${zzim.mk_id}"><span><fmt:formatNumber value="${zzim.mk_price}" />원</span></a>
								</td>
								<td align="center">
									<a href="#" class="goCart">
										<span class="glyphicon glyphicon-shopping-cart"></span>
									</a>
									
									<form action="/" id="zzimForm">
										<input type="hidden" value="${zzim.zzim_id}" />
										<input type="hidden" value="${zzim.buy_id}" />
										<input type="hidden" value="${zzim.mk_id}" />
										<input type="hidden" value="${zzim.mk_price}" />
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="btns">
				<a href="../shop/goods_list" class="btn btn-lg btn-info">계속 쇼핑하기</a>
				<a href="#" id="submit" class="btn btn-lg btn-primary">선택사항 장바구니에 담기</a>
			</div>
		</div>
	</div>
	
</c:if>

<%@ include file="../include/footer.jsp" %>
</body>

<script>

var chkObj = $("input[name='RowCheck']");
var rowCnt = chkObj.length;

$('#allCheck').click(function(){
	for (var i=0; i < chkObj.length; i++){
		chkObj[i].checked = this.checked;
	}
});

$("input[name='RowCheck']").click(function(){
	if($("input[name='RowCheck']:checked").length == rowCnt){
		$('#allCheck')[0].checked = true;
	}
	else{
		$('#allCheck')[0].checked = false;
	}
});

$('.goCart').click(function(){
	
	$.ajax({
	    url : "/shop/zzimGo",
	    type : 'POST',
	    traditional : true,
	    data : { "zzim_id" : $(this).next().children().eq(0).val(), "buy_id" : $(this).next().children().eq(1).val(), 
	    		 "mk_id" : $(this).next().children().eq(2).val(), "mk_price" : $(this).next().children().eq(3).val() },
	    		 
        success: function(jdata){
            if(jdata == "sumCart") {
            	var result = confirm("아이콘 장바구니에 담겼습니다. 이동하시겠습니까?");
            	location.reload();
            	if(result) { location.href="../shop/cart"; }
            }
        }
	});
});

$('#submit').click(function(){

	var valueArr = new Array();
	var buyId = new Array();
	var mkId = new Array();
	var mkPrice = new Array();
	
    var list = $("input[name='RowCheck']");
    
    for(var i = 0; i < list.length; i++){
    	
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
            buyId.push(list.eq(i).next().val());
        	mkId.push(list.eq(i).next().next().val());
        	mkPrice.push(list.eq(i).next().next().next().val());
        }
    }
    
    if (valueArr.length == 0){
    	alert("선택된 제품이 없습니다.");
    	
    } else {
    	
		$.ajax({
		    url : "/shop/arrZzimgo",
		    type : 'POST',
		    traditional : true,
		    data : { "zzimId" : valueArr, "buy_id" : buyId, "mk_id" : mkId, "mk_price" : mkPrice },
            success: function(jdata){
                if(jdata == "sumCart") {
                	var result = confirm("장바구니에 담겼습니다. 이동하시겠습니까?");
                	location.reload();
                	
                	if(result) {
                		location.href="../shop/cart";
                	}
                }
            }
		});
	}
});

/* JSON으로 배열 이용해서 컨트롤러로 넘기는 방법 - 작동은 되는데 너무 복잡해서 주석처리
$('#submit').click(function(){
	
	var zzimDTO = [];
    var list = $("input[name='RowCheck']");

    for(var i = 0; i < list.length; i++){
    	
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
        	var data = {
        		zzim_id : list[i].value,
        		buy_id : list.eq(i).next().val(),
        		mk_id : list.eq(i).next().next().val(),
        		mk_price : list.eq(i).next().next().next().val()
        	};
        
        	// param 배열에 data 오브젝트를 담는다.
            zzimDTO.push(data);
        }	
    }
    
    if (list.length == 0){
    	alert("선택된 제품이 없습니다.");    	
    } else {
		$.ajax({
		    url : "/shop/zzimGo",
		    type : 'POST',
		    traditional : true,
		    data : { "zzimDTO" : JSON.stringify(zzimDTO) },
		    dataType: 'json',
            success: function(jdata){
                if(jdata.result) {
                	var aa = confirm("장바구니에 담겼습니다. 이동하시겠습니까?");
                	location.reload();
                	
                	if(aa) {
                		location.href="../shop/cart";
                	}
                }
            }
		});
	}
});
*/
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
    	
    } else {
		var chk = confirm("정말 삭제하시겠습니까?");
		
		if(chk) {
			$.ajax({
			    url : "/shop/zzDelete",
			    type : 'POST',
			    traditional : true,
			    data : { valueArr : valueArr },
	            success: function(jdata){
	                if(jdata == 'zz') {
	                    alert("삭제 성공");
	                    location.replace("zzim")
	                }
	                else{
	                    alert("삭제 실패");
	                }
	            }
			});
		}
	}
}

</script>

</html>