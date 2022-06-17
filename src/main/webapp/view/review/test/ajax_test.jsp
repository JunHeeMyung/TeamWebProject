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
		//url:getContextPath()+"/review/SelectMem.do", 
		//url:getContextPath()+"/review/SelectMenu.do", 
		//url:getContextPath()+"/review/SelectDay.do", 
		url:getContextPath()+"/admin/adminShopCount.do", 
		//url:getContextPath()+"/review/SelectShop.do", 
		//data: {"mem_seq":99998} , 
		//data: {"menu_seq":2} , 
		//data: {"shop_seq":3} , 
		dataType:"json",
		success : data=>{
	        if ( typeof(data) == "undefined" ) {return;}
	        
	       	alert(data);

	       	
	       	
	       	
	       	/*
	       	jsonhere.innerHTML=JSON.stringify(data);
	        
	        var boxvalue = "";
	        
	        boxvalue+="<table>";
	      
	        
	        for(var shopdata of data){
	        	
	        	boxvalue+="<tr><td>";
	        	boxvalue+= JSON.stringify(shopdata.활성).replaceAll("\"", "");
				boxvalue+="</td><td>";
				boxvalue+= JSON.stringify(shopdata.비활성).replaceAll("\"", "");
				boxvalue+="</td></tr>";
		      	  
	        }
	        boxvalue+="</table>";
	        here.innerHTML=boxvalue;
		    */
		},
		error : ()=> {
			alert("에러발생 ajax_test");
		}
	});
});

</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="jsonhere"></div>
<div id="here"></div>

</body>
</html>