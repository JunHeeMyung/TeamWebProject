<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(()=>{
	
/* 	$.ajax({
		url: getContextPath()+"/menu/menuListAll.do",
		type: "get",
		data: { "shop_seq": 3 },
		dataType: "json",
		success: data => {
			for(var menu of data){
				here.innerHTML += "<br>"+JSON.stringify(menu);
			}
		},
		error: () => {
			alert("요청실패");
		}
	}) */
	
	const urlParams = new URL(location.href).searchParams;
	const shop_seq = urlParams.get('shop_seq');
	
	$.ajax({
		url: getContextPath()+"/menu/menuListAll.do",
		type: "post",
		data: { "shop_seq": shop_seq },
		dataType: "html",
		success: data => {

			$("#here").html(data);
		},
		error: () => {
			$("#here").html("알수없음");
		}
	})
}
)


</script>
</head>
<body>





<div id="here"></div>





</body>
</html>