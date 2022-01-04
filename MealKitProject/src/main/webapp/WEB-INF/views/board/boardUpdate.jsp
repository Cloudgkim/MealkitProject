<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }
.notice { font-size:20px; margin-bottom:30px; }
</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container">
	<form class="form-horizontal" method="post">
		<div class="form-group">
			<div class="col-sm-offset-3">
				<p class="notice">1:1문의 수정</p>
			</div>
		</div>

		<input type="hidden" name="bno" value="${boardview.bno}"/>
		
		<div class="form-group">
			<label class="control-label col-sm-2">아이디</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="writer" name="writer" value="${member.id}" readonly />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">질문 유형</label>
			<div class="col-sm-2">
				<select class="form-control" name="b_kind" id="b_kind">
					<c:forEach var="kind" items="${kind}">
						<option value="${kind.b_kind_id}"
						<c:if test="${kind.b_kind_name == boardview.b_kind}">selected</c:if>>
							${kind.b_kind_name}
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">문의 내용</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="title" name="title" value="${boardview.title}" />
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-7">
				<textarea rows="10" name="b_content" id="b_content" class="form-control">${boardview.b_content}</textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-3">
				<button type="submit" class="btn btn-primary">수정</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/footer.jsp" %>	
</body>
</html>