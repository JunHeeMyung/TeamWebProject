<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">




<title>관리자 마이페이지</title>
</head>
<body>
<h1> 관리자 마이페이지</h1>
<p> 관리자 접속 성공 </p>



<p>회원넘버 :${member.mem_seq} </p>
<p>회원닉네임 :${member.mem_nick} </p>
<p>회원분류 :${member.mem_type} </p>


<ul>
<li>개인정보</li>
<li>비번변경</li>
<li>즐겨찾기 목록</li>
<li>나의 리뷰</li>

<li>${member} </li>
</ul>
</body>
</html>