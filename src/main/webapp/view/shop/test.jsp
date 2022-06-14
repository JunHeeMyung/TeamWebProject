<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	 $("#btn").click(()=>{ 
		
		$.ajax({
			url: getContextPath()+"/shop/shopList.do",
			type: "get",
			/* data: { }, */
			dataType: "html",
			success: data => {
				
				alert(sessionStorage.getItem("shoplist"));
			

			},
			error: () => {
				
			}
		});

	 }); 
	
})


</script>

</head>
<body>


<button id="btn">누르세요</button>

<div id="here"></div>



</body>
</html>