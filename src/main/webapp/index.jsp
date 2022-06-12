<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="${page}/view/common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>ZUMUNIYO</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<style>
body, html {
	height:100%;
	width:100%;
	padding: 0px auto;
	margin: 0px auto;
}

div {
	padding: 0px;
	margin: 0px;
}

#wrapper {
	height: 100%;
	margin: 0px auto;
	background-color: #F3F3F3;
	text-align: center;
}

@media (min-width: 800px){


#mainframe {
	width: 800px;
	height: 100vh; 
	display : inline-block;
	margin: 0px auto;
	background-color: white;
	padding-top: 250px;
}

#searchwrapper{
z-index:100;
position:absolute;
display:inline-block;
height: 250px;
width: 800px;
background-color: black;
left:50%;
transform: translate(-50%, 0);
opacity : 0.5;
pointer-events: none;
}


}

@media (max-width: 800px){

#mainframe {
	width: 100%;
	height: 100vh; 
	display : inline-block;
	margin: 0px auto;
	background-color: white;
	padding-top: 250px;
}

#searchwrapper{
z-index:100;
position:absolute;
display:inline-block;
height: 250px;
width: 100%;
background-color: black;
left:50%;
transform: translate(-50%, 0);
opacity : 0.5;
pointer-events: none;
}

}










#topframe {
	position: absolute;
	left: 0px;
	top: 0px;
	height: 250px;
	width: 100%;
	display: inline-block;
	margin: 0px auto;
	background-color: rgba(23, 12, 41);
	text-align: center;
}

#topslide{
display:inline-block;
width: 100%;
height: 100%;
background-color: black;
}

.topimg {
height: 250px;
width:100%;
object-fit: cover;
filter:grayscale(50%);
}


#searchdiv{
z-index:200;
position:absolute;
left:50%;
top:50%;
transform: translate(-50%, 0px);
width: 380px;
height: 50px;
border: 6px solid rgba(255, 138, 0);
background-color: #F3F3F3;
border-radius: 25px;
padding-left:25px;
padding-right:10px;
}

#searchbox ,#searchbox:hover{
background-color:#F3F3F3;
border: none;
width: 280px;
height: 30px;
text-align: center;
font-weight: bold;
font-size: 25px;
color: rgba(255, 138, 0);
}
#searchbox::placeholder {
  color: rgba(187, 166, 143);
}


#searchbtn{

color: rgba(255, 138, 0);
margin-top: 4px;
height: 38px;
font-size: 30px;
cursor: pointer;
}







</style>

<script>
	
</script>


</head>



<body>
	<div id="wrapper">

		<div id="mainframe" class="shadow">
			<div id="topframe" class="shadow">
				<div id="searchwrapper"></div>
				<div id="searchdiv">
					<form>
						<input id="searchbox" type="text" value="" placeholder="검색어를 입력하세요">
						<i id="searchbtn" class="fas fa-search"></i>

					</form>
				</div>

				<!-- Carousel -->
				<div id="topslide" class="carousel slide" data-bs-ride="carousel">

					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#topslide" data-bs-slide-to="0"
							class="active"></button>
						<button type="button" data-bs-target="#topslide" data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#topslide" data-bs-slide-to="2"></button>
					</div>

					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${path}/images/sample1.jpg" class="d-block topimg">
						</div>
						<div class="carousel-item">
							<img src="${path}/images/sample2.jpg" class="d-block topimg">
						</div>
						<div class="carousel-item">
							<img src="${path}/images/sample3.jpg" class="d-block topimg">
						</div>
					</div>

					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#topslide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#topslide" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>

			</div>

			
			여기에 메뉴 목록 대충 들어감
			
			
			
			
			
			
			
		</div>
	</div>








</body>
</html>