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
.container { margin-top:70px; margin-bottom:70px; }
#header .inner .gnb li:nth-child(3) a { font-weight:700; }
.oriImg { width:500px; height:auto; margin:20px 0; }
.noze { float:left; color:red; font-size:17px; margin-top:5px; }
.btnss { margin-bottom:50px; }

</style>

</head>
<body>
<%@ include file="../include/m_header.jsp" %>


<div class="container">
	<form class="form-horizontal" action="/manager/productDelete" method="post" id="delForm">
		<div class="form-group">
			<div class="col-sm-offset-3">
				<h1>밀키트 상세 정보</h1>
			</div>
		</div>
		
		<input type="hidden" name="mk_id" id="mk_id" value="${productView.mk_id}" />
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 이름</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" 
				name="mk_name" id="mk_name" maxlength="50" value="${productView.mk_name}" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 가격</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" 
				name="mk_price" id="mk_price" maxlength="30" value="${productView.mk_price}" readonly="readonly"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 종류</label>
			<div class="col-sm-2">
				<div class="input-group">
					<input type="text" class="form-control" maxlength="6" 
					name="mk_kind" id="mk_kind" value="${productView.mk_kind}" readonly="readonly"/>
				</div>
			</div>
		</div>
		
		<c:if test="${productView.mk_count != 0 }">
			<div class="form-group">
				<label class="control-label col-sm-2">밀키트 재고량</label>
				<div class="col-sm-2">
					<div class="input-group">
						<input type="text" class="form-control" maxlength="6" 
						name="mk_count" id="mk_count" value="${productView.mk_count}" readonly />
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${productView.mk_count == 0 }">
			<div class="form-group">
				<label class="control-label col-sm-2">밀키트 재고량</label>
				<div class="col-sm-2">
					<div class="input-group">
						<input type="text" class="form-control" maxlength="6" 
						name="mk_count" id="mk_count" value="${productView.mk_count}" readonly />
					</div>
				</div>
				<p class="noze">상품 수량이 부족합니다.</p>
			</div>
		</c:if>
		
		<div class="inputArea">
			<label class="control-label col-sm-2" for="mk_img">이미지</label>
			<img src="/resources${productView.mk_img}" class="oriImg"/>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 내용</label>
			<div class="col-sm-4">
				<textarea rows="10" cols="50" name="mk_content"  readonly="readonly">${productView.mk_content}</textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">할인율</label>
			<div class="col-sm-2">
				<div class="input-group">
					<input type="text" class="form-control" size="4" maxlength="4" 
					name="mk_discount_rate" name="mk_count" id="mk_count"
						 value="${productView.mk_discount_rate}" readonly="readonly"/>
					<span class="input-group-addon"> %</span>
				</div>
			</div>
		</div>
		
		<div class="form-group btnss">
			<div class="col-sm-offset-3">
				<a class="btn btn-primary" href="/manager/productUpdate?mk_id=${productView.mk_id}">수정하기</a>&nbsp;&nbsp;
				<button type="button" class="btn btn-danger" id="Del" >삭제하기</button>
			</div>
		</div>
		
	</form>
</div>

</body>


<script>
$('#Del').click(function(){
	var result = confirm("삭제하시겠습니까?");
	if(result) {
		$('#delForm').submit();
	}
});

</script>
</html>