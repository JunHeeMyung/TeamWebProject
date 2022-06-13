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





<br>
<form action="${path}/admin/adminMember.do" method="post">
<button type="submit">회원관리</button>
</form>

<br>
<form action="${path}/admin/adminShop.do" method="post">
<button type="submit">매장관리</button>
</form>


</body>
</html>