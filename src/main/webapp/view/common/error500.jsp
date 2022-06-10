<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<meta charset="UTF-8">
<style>

body, html {
    height:  100%;
    margin:  0px auto;
    padding: 0px auto;
}

#wrapper {
height:100%;
margin: 0px auto;
background-color: #F3F3F3;
text-align: center;
}

#mainframe {
height:100%;
width:750px;
display:inline-block;
margin: 0px auto;
background-color: white;
}

.blank {
height: 10%;
}

h2{
color:#727272;
padding-bottom:10%;
margin: 0px;
}

#xicon{
font-size:100px;
color: red;
}

</style>
<title>문제가 발생했습니다</title>
</head>
<body>

<div id="wrapper">
<div id="mainframe">
<div class="blank"></div>
<div class="blank"></div>
<i id="xicon" class="fas fa-times-circle"></i>
<div class="blank"></div>
<h2> 문제가 발생했습니다. </h2>

<button type="button" id="goback" class="btn btn-outline-danger" onclick="history.back()">뒤로가기</button>

</div>
</div>



</body>
</html>