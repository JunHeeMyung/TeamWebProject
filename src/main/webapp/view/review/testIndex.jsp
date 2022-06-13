<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZUMUNIYO</title>
</head>
<body>

Testindex.jsp
<%
String test123 = "잘나오나";
session.setAttribute("testSession",test123);
%>

<ul>
<li><a href="${path}/shop/shopList.do">모든 매장 조회</a></li>
<li><a href="${path}/review/reviewAllList.do">모든 리뷰 조회</a></li>
<li><a href="${path}/review/reviewInsert.do">리뷰 입력</a></li>
<li><a href="${path}/review/reviewDelete.do">리뷰 삭제</a></li>
<li><a href="${path}/review/reviewShopManager.do">매장주인 리뷰관리</a></li>

<li><a href="${path}/review/test.do">테스트용</a></li>
<br>
<br>
<br>

<li><a href="${path}/mypage/mypageFist.do">mypage 테스트용</a></li>

</ul>
</body>
</html>

