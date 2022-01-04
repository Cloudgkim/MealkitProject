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
.select_img img { width:500px; height:auto; margin:20px 0; }
.btn { margin-bottom:30px; }

</style>

</head>
<body>
<%@ include file="../include/m_header.jsp" %>


<div class="container">
	<form class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<div class="col-sm-offset-3">
				<h1>밀키트 수정</h1>
			</div>
		</div>

		<input type="hidden" name="mk_id" value="${productView.mk_id}"/>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 이름</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" 
				name="mk_name" id="mk_name" maxlength="50" value="${productView.mk_name}"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 가격</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" 
				name="mk_price" id="mk_price" maxlength="30" value="${productView.mk_price}"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 종류</label>
			<div class="col-sm-2">
				<select class="form-control" name="mk_kind" id="mk_kind">
					<c:forEach var="kind" items="${kind}">
						<option value="${kind.kind_name}" 
						<c:if test="${productView.mk_kind == kind.kind_name}">selected</c:if>>
							${kind.kind_name}
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
	
	
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 재고량</label>
			<div class="col-sm-2">
				<div class="input-group">
					<input type="text" class="form-control" maxlength="6" 
					name="mk_count" id="mk_count" value="${productView.mk_count}"/>
				</div>
			</div>
		</div>
		
		<div class="inputArea">
	        <label class="control-label col-sm-2" for="mk_img">밀키트 이미지</label>
	        <input type="file" id="mk_img" name="file" />
	        
	        <div class="select_img">
		        <img src="/resources${productView.mk_img}" />
		        <input type="hidden" name="mk_img" value="${productView.mk_img}" />
	        </div>
	       
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
	        </script>
      	</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 내용</label>
			<div class="col-sm-4">
				<textarea rows="10" cols="50" name="mk_content">${productView.mk_content}</textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">할인율</label>
			<div class="col-sm-2">
				<div class="input-group">
					<input type="text" class="form-control" size="4" maxlength="4" 
					name="mk_discount_rate" name="mk_count" id="mk_count"
						 value="${productView.mk_discount_rate}"/>
					<span class="input-group-addon"> %</span>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-3">
				<button type="submit" class="btn btn-primary">수정완료</button>
			</div>
		</div>
		
	</form>
</div>





</body>

<script>
$('.logout').click(function(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		location.href="/mealkit/logout";
	}
});
</script>
</html>