<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};


/*

$(()=> {	
	$(".btn-detail").click(function(){
		return "/shop/shopList.do";
		
	});	
});
*/

</script>

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
<button class="btn-detail" onClick="location.href='${path}/shop/shopList.do'">등록된 매장 정보</button>


</form>
</body>
</html>