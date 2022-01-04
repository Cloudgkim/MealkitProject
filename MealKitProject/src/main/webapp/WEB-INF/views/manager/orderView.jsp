<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib  prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 목록</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; }
#header .inner .gnb li:nth-child(2) a { font-weight:700; }

#container_box table th { text-align:center; padding:10px; border-bottom:1px solid #666; }

.orderInfo { border:5px solid #eee; padding:20px 70px; margin:30px 0; }
.orderInfo p { font-size:15px; padding:3px 0; }
.orderInfo span { font-size:17px; font-weight:bold; display:inline-block; width:250px; }

.orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
.orderView li::after { content:""; display:block; clear:both; }

.deliveryChange { text-align:right; }
.deliveryChange .btn { margin-right:15px; }
 
</style>

</head>
<body>
<%@ include file="../include/m_header.jsp" %>

<section class="container">
	<div id="container_box">
		<div class="orderView">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="info">
						<th>주문번호</th>
						<th>주문날짜</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>주문상태</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="orderView" items="${orderView}">				
						<tr>
							<td align=center>${orderView.order_id}</td>
							<td align=center>${orderView.buy_date}</td>
							<td align=center>${orderView.mk_name}</td>
							<td align=center><fmt:formatNumber pattern="###,###,###" value="${orderView.buy_price}" /> 원</td>
							<td align=center>${orderView.buy_count}</td>
							<td class="delivery" align=center>${orderView.delivery}</td>
						</tr>
					</c:forEach>
					
		 			<tr>
						<td class="amount" align="right" colspan="6">
							<c:choose>
								<c:when test= "${allMoney < 30000}">
									주문금액 <fmt:formatNumber value="${allMoney}" />원 + 배송비 5,000원 = <fmt:formatNumber value="${allMoney + 5000}" />원
								</c:when>
								<c:when test= "${allMoney > 30000}">
									주문금액 <fmt:formatNumber value="${allMoney}" />원 + 배송비 0원 = <fmt:formatNumber value="${allMoney}" />원
								</c:when>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div>	
				
		<div class="orderInfo">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">
				<c:if test="${status.first}">
					<p><span>주문 번호</span>${orderView.order_id}</p>
					<p><span>주문자 아이디</span>${orderView.member_id}</p>
					<p><span>수령인 이름</span>${orderView.delivery_name}</p>
					<p><span>수령인 휴대폰 번호</span>${orderView.delivery_tel}</p>
					<p><span>수령인 주소</span>${orderView.delivery_address}</p>
					
					<p><span>최종 결제금액</span>
						<c:choose>
							<c:when test="${allMoney < 30000}">
								<fmt:formatNumber value="${allMoney + 5000}" />원
							</c:when>
							<c:when test="${allMoney > 30000}">
								<fmt:formatNumber value="${allMoney}" />원
							</c:when>
						</c:choose>
					</p>
					
					<p><span>주문상태</span>${orderView.delivery}</p>
					
					<div class="deliveryChange">
						<form role="form" method="post" class="deliveryForm">
							<input type="hidden" name="orderId" value="${orderView.order_id}" />
							<input type="hidden" name="delivery" class="delivery" value="" />
						</form>
						
						<button type="button" class="btn btn-info delivery1_btn">입금 확인</button>
						<button type="button" class="btn btn-success delivery2_btn">배송 중</button>
						<button type="button" class="btn btn-danger delivery3_btn">배송 완료</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</section>

</body>


<script>

$(".delivery1_btn").click(function(){
	$(".delivery").val("입금 확인");
	$(".deliveryForm").submit();
});

$(".delivery2_btn").click(function(){
	$(".delivery").val("배송 중");
	$(".deliveryForm").submit();
});

$(".delivery3_btn").click(function(){
	$(".delivery").val("배송 완료");
	$(".deliveryForm").submit();
});

</script>
</html>