<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style type="text/css">

#sidebar{
text-align: center;
height: 100%;
width: 100%;
padding: 0px auto;
margin: 0px auto;
background-color: white;
}


#sidebar button {
display: inline-block;
width: 60%;
margin-left: 20%;
margin-right: 20%;
}


</style>

<title>일반회원 마이페이지</title>
</head>
<body>
<div id="sidebar">
<h1> ${member.mem_nick}의 마이페이지</h1>



<%-- 
<p>회원넘버 :${member.mem_seq} </p>
<p>회원닉네임 :${member.mem_nick} </p>
<p>회원분류 :${member.mem_type} </p>
<p>회원상태 :${member.mem_status} </p>
 --%>
 


<br>
<form action="${path}/view/mypage/mypageFirst.jsp" method="post">
<button class="btn btn-primary" type="submit">회원정보</button>
</form> 

<br>
<br>
<form action="${path}/review/revieMemList.do" method="post">
<button class="btn btn-primary" type="submit">나의 리뷰 조회</button>
</form>
<br>

<br>
<form action="${path}/orderlist/myorderlist.do" method="get">
<button class="btn btn-primary" type="submit">주문 목록 조회</button>
</form>
</div>
</body>
</html>