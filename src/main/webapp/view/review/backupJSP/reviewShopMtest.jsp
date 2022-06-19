<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(()=> {	
	$.ajax({
		type:"GET",
		url:getContextPath()+"/review/SelectShopReview.do", 
		/* data: {} , */ 
		dataType:"json",
		success : data=>{
	        if ( typeof(data) == "undefined" ) {return;}
	       // let str = JSON.stringify(data); // <> parse()
			//alert(str); 
	        
	        jsonhere.innerHTML=JSON.stringify(data);
	       
	        var boxvalue = "";
	        
	        boxvalue+="<table>";
	        for(var reviewData of data){
	        	
	        	boxvalue+="<tr><td>";
	        	boxvalue+= JSON.stringify(reviewData.mem_seq).replaceAll("\"", "");
				boxvalue+="</td><td>";
				boxvalue+= JSON.stringify(reviewData.menu_seq).replaceAll("\"", "");
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




<!-- 
"/review/Update.do"
 -->


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="jsonhere"></div>
<div id="here"></div>

</body>
</html>