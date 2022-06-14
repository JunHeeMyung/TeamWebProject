<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<table>
<tr>
	<td>shop_seq</td>
	<td>shop_name</td>
	<td>loc_addr</td>
	<td>shop_addr_detail</td>
	<td>mem_seq</td>
	<td>category_code</td>
	<td>shop_img</td>
	<td>shop_notice</td>
	<td>shop_status</td>
	<td></td>
</tr>
<c:forEach items="${shopLists}" var="shoplist">
<tr>
	<td>${shoplist.shop_seq}</td>
	<td>${shoplist.shop_name}</td>
	<td>${shoplist.loc_addr}</td>
	<td>${shoplist.shop_addr_detail}</td>
	<td>${shoplist.mem_seq}</td>
	<td>${shoplist.category_code}</td>
	<td>${shoplist.shop_img}</td>
	<td>${shoplist.shop_notice}</td>
	<td>${shoplist.shop_status}</td>
	<td></td>	
</tr>
</c:forEach>
</table>

</body>
</html>