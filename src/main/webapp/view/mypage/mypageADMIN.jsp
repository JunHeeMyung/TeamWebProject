<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">

#sidebar{
text-align: center;
height: 100%;
width: 100%;
padding: 0px auto;
margin: 0px auto;

}


#sidebar button {
display: inline-block;
width: 60%;
margin-left: 20%;
margin-right: 20%;
}

#slidemenu{

background-color: rgb(209,239,221);
border-radius: 15px;

}


</style>

<title>관리자 마이페이지</title>
</head>
<body>


<div id="sideAll">

<div id="sidebar">
<h1>관리자 페이지</h1>

<!-- <p> 관리자 접속 성공 </p> -->


<%-- 
<p>회원넘버 :${member.mem_seq} </p>
<p>회원닉네임 :${member.mem_nick} </p> --%>
<p>회원분류 :${member.mem_type} </p>





<br>
<div class="btoon">
<form action="${path}/admin/adminMember.do" method="post">
<button name="admenu" class="btn btn-success" type="submit">회원관리</button>
</form>
<%-- 
<br>
<form action="${path}/admin/adminShop.do" method="post">
<button type="submit">매장관리</button>
</form>
 --%>
<br>
<%-- <form action="${path}/admin/adminShop.do" method="post"> --%>
<!-- <button type="submit">통계</button> -->

<%-- 
<br>
<button name="admenu" class="btn btn-primary" onClick="location.href='${path}/shop/shopList.do'">등록된 매장 정보</button>
<br>
 --%> 
<br>
<button name="admenu" class="btn btn-success" onClick="location.href='${path}/admin/adminStatistics.do'"> 통 계 </button>
</div>
<!-- 
<div id="slideheader" class="offcanvas-header">
   <button type="button" id ="slideclosebtn" class="btn-close" data-bs-dismiss="offcanvas"></button>
</div>
 -->
</div>
</div>

<br>
<br>
</body>
</html>