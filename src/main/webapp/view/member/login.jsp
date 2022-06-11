<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<!-- <link rel="stylesheet" href="/view/member/login.css"> -->
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>로그인</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="/view/member/login.js"></script> -->
<style>

body, html {
    height:  100%;
    margin:  0px auto;
    padding: 0px auto;
}

div {
	padding: 0px;
	margin: 0px;
}

#wrapper {
height:100%;
margin: 0px auto;
background-color: #F3F3F3;
text-align: center;

}

#mainframe {
height:100%;
width:600px;
display:inline-block;
margin: 0px auto;
background-color: F3F3F3;
}

#mainbox{
margin:0px;
padding:0px;	
margin-top:110px;
width:100%;
height:500px;
background-color: rgba(255, 255, 255);

}

@keyframes moving{
	from{
		background-position: 100% 100%;
	}
	to{
		background-position: center center;
	}
}

#leftbox{
margin:0px;
padding:0px;	
height:100%;
background-color: rgba(23, 12, 41);
width:38%;
float: left;
background-image: url("/view/member/img/login01.jpg");
background-position: center center;
background-size: 128%;
filter: grayscale(70%);
animation:moving 10s linear;
}

#loginbox{
margin:0px;
padding:50px;	
height:100%;
width:62%;
background-color:rgba(255, 255, 255);
float: left;
}

.updown {
	margin:0px;
	padding:0px;
   	border-left: 1px solid rgba(23, 12, 41);
    width: 1px;
    height: 15px;
    display: inline-block;
}

#login{
	display: inline-block;
	width: 100%	
}

#loginmenu{
	font-size: 15px;
}

a,a:link,a:visited {

 text-decoration: none;
 color: rgba(23, 12, 41);
  
}
a:hover {
 text-decoration:underline;
}

.loginicon{
	display:inline-block;
	width: 100px;
	height: 100px;
	cursor: pointer;
}

</style>


</head>
<body>

	<div id="wrapper">
		<div id="mainframe">
			<div id="mainbox" class="stepbox shadow mb-4">
				<div id="leftbox"></div>
				<div id="loginbox">
					<div class="form-floating mb-3 mt-3">
						<input type="text" class="form-control mt-4" id="mem_id"
							placeholder="Enter email" name="mem_id"> <label
							for="mem_id">아이디</label>
					</div>

					<div class="form-floating mt-3 mb-3">
						<input type="text" class="form-control" id="mem_pw"
							placeholder="Enter password" name="mem_pw"> <label
							for="mem_id">비밀번호</label>
					</div>
					<button type="button" id="login" class="btn btn-secondary mt-2">로그인</button>

					<div id="loginmenu" class="mt-4"> 
					아이디 찾기 <div class="updown"></div>
					비밀번호 찾기 <div class="updown"></div>
					<a href="/member/register.do">회원 가입</a>
					</div>
					
					<div id="subloginbox">
					<img src="/view/member/img/naverlogin.png" class="loginicon mt-4">
					<img src="/view/member/img/kakaologin.png" class="loginicon mt-4">
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>