<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="${page}/view/common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=878435cb63e52c1306f3d3ab856fc153&libraries=services"></script>
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

#getMyLocation{

z-index:200;
position:absolute;
left:50%;
top:50%;
transform: translate(-500%, 0px);
width: 50px;
height: 50px;
border: 6px solid rgba(255, 138, 0);
background-color: rgba(255, 138, 0);;
border-radius: 25px;
padding-left:-400px;

}

#getMyLocation{
color: white;
font-weight: bold;
font-size: 25px;

}


</style>


</head>



<body>
	<div id="wrapper">

		<div id="mainframe" class="shadow">
			<div id="topframe" class="shadow">
				<div id="searchwrapper"></div>
				<button id="getMyLocation"><i id="getMyLocationFont" class="fas fa-map-marker-alt"></i></button>
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
			<div id="resultdiv"></div>
			<div id="map" style="width:100%;height:100%;"></div>
			
			
			
		</div>
	</div>

<script>




function getLocation(){
	
	/* 지도 세팅 */
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(35.23103408483914,129.0822385815375), level: 3
	};
	var map = new kakao.maps.Map(container, options);
	
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(pos => {

			/* 위도 경도 받기 */
			var latitude = pos.coords.latitude, longitude = pos.coords.longitude;
			var geocoder = new kakao.maps.services.Geocoder();
			
			/* 지도 위치 변경 */
			var location = new kakao.maps.LatLng(latitude, longitude);
			map.setCenter(location);
		   	
			function setlocationName(inputlat,inputlon){
				
				var coord = new kakao.maps.LatLng(inputlat, inputlon);
			   	var callback = function(result, status) {
			   	    if (status === kakao.maps.services.Status.OK) {
			   	    	$("#searchbox").val(result[0].address.address_name);
			   	    }
			   	};
			   	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
				
			}
			
	   		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		   	var ps = new kakao.maps.services.Places(map); 
		   	ps.categorySearch('FD6', placesSearchCB, {useMapBounds:true}); 

		   	function placesSearchCB (data, status, pagination) {
		   	    if (status === kakao.maps.services.Status.OK) {
		   	        for (var i=0; i<data.length; i++) {
		   	            displayMarker(data[i]);    
		   	        }       
		   	    }
		   	}

		   	function displayMarker(place) {
		   	    // 마커를 생성하고 지도에 표시합니다
		   	    var marker = new kakao.maps.Marker({
		   	        map: map,
		   	        position: new kakao.maps.LatLng(place.y, place.x) 
		   	    });

		   	    // 마커에 클릭이벤트를 등록합니다
		   	    kakao.maps.event.addListener(marker, 'click', function() {
		   	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		   	        infowindow.setContent('<div style="padding:5px;font-size:20px;">' + place.place_name + '</div>');
		   	        infowindow.open(map, marker);
		   	    });
		   	}		
			
		   	/*위도 경도에 대한 위치명 받기*/
		   setlocationName(latitude,longitude);
		   	
		   	/* 지도 변경시 동작 */
		   	
		   	kakao.maps.event.addListener(map, 'dragend', function() {  
		   		
		   		var latlng = map.getCenter(); 

			   	setlocationName(latlng.getLat(),latlng.getLng());
		   	    
		   		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			   	var ps = new kakao.maps.services.Places(map); 
			   	ps.categorySearch('FD6', placesSearchCB, {useMapBounds:true}); 
		   	    
		   	});

			kakao.maps.event.addListener(map, 'zoom_changed', function() {  
		   		
		   		var latlng = map.getCenter(); 

			   	setlocationName(latlng.getLat(),latlng.getLng());
		   	    
		   		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			   	var ps = new kakao.maps.services.Places(map); 
			   	ps.categorySearch('FD6', placesSearchCB, {useMapBounds:true}); 
		   	    
		   	});
		   

			
			
			
			
			
			
			
			
			
		})
	} else {
		alert("지원하지않는 브라우져입니다");
	}
}

getLocation();

$("#getMyLocation").click(()=>{
	$("#searchbox").val("");
	getLocation();
	
	
})

</script>	

</body>
</html>