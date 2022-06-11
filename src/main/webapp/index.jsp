<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZUMUNIYO</title>
</head>
<body>
index.jsp
<ul>
<li><a href="shop/shopList">모든 매장 조회</a></li>
</ul>
<ul>
<li><a href="review/reviewAllList">모든 리뷰 조회</a></li>
</ul>


<c:if test="${member!=null}">
${member.mem_nick}님 <a href="/member/logout.do"> 로그아웃</a>
</c:if>
<c:if test="${member==null}">
손님 안녕하세요 <a href="/member/login.do"> 로그인</a>
</c:if> 



</body>
</html>