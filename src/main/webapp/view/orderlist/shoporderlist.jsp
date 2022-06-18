<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<!-- JQUERY-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- FONTAWESOME -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<title>매장 주문 내역</title>
<style>

#ordertable{
width: 100%;
}
#ordertable td{
border: 1px solid orange;
}

.grouptable{
border: 1px solid black;
}


</style>
</head>
<body>




<c:set var="total" value="0"/>
<c:set var="isnotfirst" value="0"/>
<c:set var="group_seq" value="-1"/>



<table id="ordertable">

<c:forEach items="${orderlist}" var="order">
<c:if test="${group_seq ne order.ORDER_GROUP}">

<tr id="group${group_seq}" class="grouptable"><td>
<c:set var="cnt" value="${cnt+1}"/>
<c:if test="${isnotfirst eq 1}">
<tr class="grouptr${cnt-1}">
<td colspan="3" id="total">합계: <c:out value="${total}"/> 원</td>
</tr>
</c:if>
<c:set var="isnotfirst" value="1"/>
<c:set var="total" value="0"/>
<c:set var="group_seq" value="${order.ORDER_GROUP}"/>
<tr class="orderdata grouptr${cnt}">
<td id="lefttd"></td><td id="midtd">${order.ORDER_TABLENUM}번 테이블 (${order.ORDER_STATUS})</td><td id="righttd">${order.ORDER_DATE}</td>
</tr>
</c:if>
<tr>
<td></td><td>[${order.MENU_CATEGORY}] ${order.MENU_NAME}</td><td>단가: ${order.MENU_PRICE} 원</td><td colspan="1">수량: ${order.ORDER_COUNT} 개</td>
<c:set var="total" value="${total+(order.MENU_PRICE*order.ORDER_COUNT)}"/>
</c:forEach>

<tr class="grouptr${cnt}">
<td colspan="3" id="total">합계: <c:out value="${total}"/> 원</td>
</tr>
</table>

</body>
</html>