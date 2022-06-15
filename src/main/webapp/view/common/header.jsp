<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>주무니요</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<style>

body::-webkit-scrollbar {
width: 10px;
}
body::-webkit-scrollbar-thumb{
background: rgba(255, 138, 0);
border-radius: 10px;
}
body::-webkit-scrollbar-track {
background: transparent;
}

#headerbox{
position: fixed;
left: 0px;
top: 0px;
margin : 0px;
padding : 0px;
height: 40px;
width:100%;
background: rgba(255, 138, 0);
z-index:999;

}

#headerlogo{
float:left;
padding-left:20px;
font-size: 28px;
font-weight:bold;
color: white;
cursor: pointer;
}

#headermenu{
float:right;
padding-right:20px;
font-size: 28px;
font-weight:bold;
color: white;
}

a, a:link, a:visited,a:hover {
	text-decoration: none;
}

#loginoutfont a,#loginoutfont a:link,#loginoutfont a:visited,#loginoutfont a:hover
{
color: white;
font-size: 20px;
}

#rightmenubtn{
cursor: pointer;
}

#slidemenu{

width: 100%;
height: 100%;
margin: 0px;
padding: 0px;

}

#slideheader{
display: inline-block;
text-align: right;
}


</style>

<script>

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(()=>{
	
	$.ajax({
		url: getContextPath()+"/mypage/mypage",
		type: "get",
		dataType: "html",
		success: data => {
			$("#slidemenu").html(data);
		},
		error: () => {
			alert("개인메뉴로드실패");
		}
	})
	
})

</script>
</head>
<div id="headerbox">

<div id = "headerlogo" onclick="location.href='${path}/';">ZUMUNIYO</div>
<div id = "headermenu">

<span id="loginoutfont">
<c:if test="${member!=null}">
${member.mem_nick} 님, <a href="${path}/member/logout.do">LOGOUT</a>
</c:if>
<c:if test="${member==null}">
<a href="${path}/member/login.do">LOGIN</a>
</c:if>
</span>
<i class="fas fa-bars" id="rightmenubtn" data-bs-toggle="offcanvas" data-bs-target="#rightmenu"></i>

</div>


</div>



<div class="offcanvas offcanvas-end" id="rightmenu">
  <div id="slideheader" class="offcanvas-header">
   <button type="button" id ="slideclosebtn" class="btn-close" data-bs-dismiss="offcanvas"></button>
  </div>
  
  <div id="slidemenu">

  </div>
   
  <div class="offcanvas-body">

  </div>
</div>



  







<body>

</body>
</html>