<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자회원 마이페이지</title>
</head>
<body>
<h1> 사업자회원 마이페이지</h1>
<p> 사업자회원 접속 성공 </p>



<p>회원넘버 :${member.mem_seq} </p>
<p>회원닉네임 :${member.mem_nick} </p>
<p>회원분류 :${member.mem_type} </p>


<ul>
<li>${member} </li>
</ul>


<br>

 <form action="${path}" method="post">
<button type="submit">회원정보</button>
</form> 

<br>
<form action="${path}/review/reviewShopList.do" method="post" name="mem_seq" val="${member.mem_seq}">
<button type="submit">매장 리뷰 조회</button>
</form>
<br>


<button id="here"></div>


</body>
</html>