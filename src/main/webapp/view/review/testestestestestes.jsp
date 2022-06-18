<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- JQUERY-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- FONTAWESOME -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/raty/3.1.1/jquery.raty.min.js"></script> 


<script>

$(()=>{
	$('div#star1').raty({
		score: function(evt) {            
            return $("#starRating1").val();
        }
		,path : "${path}/view/review/img"
		,readOnly: true
	});
});

$(()=>{
	$('div#star2').raty({
		score: function(evt) {            
            return $("#starRating2").val();
        }
		,path : "${path}/view/review/img"
		,readOnly: true
	});
});

</script> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- <div id="test123"></div> -->
<div>
<div>


<div class="form-group" id="star1" >
 	<input type="hidden" id="starRating1" name="review_taste" value="5"/>
</div> 
<div class="form-group" id="star2" >
 	<input type="hidden" id="starRating2" name="review_taste" value="3"/>
</div> 
</div>
</div>

 
 
</body>
</html>