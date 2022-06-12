<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul>
<li>개인정보</li>
<li>비번변경</li>
<li>즐겨찾기 목록</li>
<li>나의 리뷰</li>

<li>${testSession} </li>
</ul>


<p>${member.mem_seq} </p>
<p>${member.mem_nick} </p>
<p>${member.mem_type} </p>

</body>
</html>