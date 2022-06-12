<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-menu,.btn-menu:hover {
text-align: center;
margin: 0px;
padding: 0px;
border: 1px solid black;
background-color: black;
color:white;
height: 30px;
}
.menutuple{

margin: 0px;
padding: 0px;
border: 1px solid black;
background-color: white;
color:black;
height: 30px;
text-align: center;
display: flex;
flex-direction: column;
}
.menunamebox{
display: flex;
flex-direction: column;
text-align: center;
}

</style>
</head>
<body>


<div class="container mt-3 menunamebox">

<div>
<c:set var="last" value=""/>
<c:forEach var="menu" items="${menuDTOs}" varStatus="status">  
<c:if test="${menu.menu_category ne last}">
</div>
<c:set var="last" value="${menu.menu_category}"/>
<button type="button" class="btn btn-menu" data-bs-toggle="collapse" data-bs-target="#menu${last}">${menu.menu_category}</button>
<div id="menu${last}" class="collapse">
</c:if>
<span class="menutuple">${menu.menu_name}</span>
</c:forEach>
</div>

<div/>

</body>
</html>