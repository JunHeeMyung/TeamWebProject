<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
table,td{
border: 1px solid black;
}

</style>

<script>
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(()=> {
	
	$.ajax({
		type:"GET",
		url:getContextPath()+"/data/mapdata.do", 
		/* data: {} , */ 
		dataType:"json",
		success : data=>{
	        if ( typeof(data) == "undefined" ) {return;}
	        
	        var boxvalue = "";
	        
	        boxvalue+="<table>";
	        for(var shopdata of data){
	        	
	        	boxvalue+="<tr><td>";
	        	boxvalue+= JSON.stringify(shopdata.SHOP_NAME).replaceAll("\"", "");
				boxvalue+="</td><td>";
				boxvalue+= JSON.stringify(shopdata.LOC_ADDR).replaceAll("\"", "");
				boxvalue+="</td></tr>";
		      	  
	        }
	        boxvalue+="</table>";
	        here.innerHTML=boxvalue;
		    
		},
		error : ()=> {
			alert("에러발생");
		}
	});
});

</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="here"></div>

</body>
</html>