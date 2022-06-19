<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

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



<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<div id = "sidebar">
<h1> 로그인이 필요합니다. </h1>
<p>>로그인을 해주시기 바랍니다.</p>

<br>
<br>
<br>
<button class="btn btn-primary" onClick="location.href='${path}/member/login.do'"> LOGIN </button>

</div>
</body>
</html>