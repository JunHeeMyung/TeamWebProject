<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">


#admenu {
	left: 130px;
	position: relative;

}

.navigation{
	position: fixed;
	top: 0px;
	right:0px;
	width: 400px;
	height: 1000px;
	border-radius: 10px;
	background: rgba(255, 138, 0);
	text-align: center;
}
.btoon{
	text-align: left;


}

</style>

<title>관리자 마이페이지</title>
</head>
<body>

<div class="navigation">
<h1>관리자 페이지</h1>

<!-- <p> 관리자 접속 성공 </p> -->


<%-- 
<p>회원넘버 :${member.mem_seq} </p>
<p>회원닉네임 :${member.mem_nick} </p> --%>
<p>회원분류 :${member.mem_type} </p>





<br>
<div class="btoon">
<form action="${path}/admin/adminMember.do" method="post">
<button name="admenu" class="btn btn-primary" type="submit">회원관리</button>
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

<br>
<button name="admenu" class="btn btn-primary" onClick="location.href='${path}/shop/shopList.do'">등록된 매장 정보</button>


<br>
<br>
<button name="admenu" class="btn btn-primary" onClick="location.href='${path}/admin/adminStatistics.do'"> 통 계 </button>
</div>


</div>

<br>
<br>
</body>
</html>