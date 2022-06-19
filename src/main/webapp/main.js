
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};


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
		   	ps.categorySearch('FD6', placesSearchCB, {
		   		//검색조건
		   		useMapCenter:true,
		   		useMapBounds:true,
		   		page:45
		   	}); 

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
			   	ps.categorySearch('FD6', placesSearchCB, {
			   		//검색조건
			   		useMapCenter:true,
			   		useMapBounds:true,
			   		page:45
			   	}); 
		   	    
		   	});

			kakao.maps.event.addListener(map, 'zoom_changed', function() {  
		   		
		   		var latlng = map.getCenter(); 

			   	setlocationName(latlng.getLat(),latlng.getLng());
		   	    
		   		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			   	var ps = new kakao.maps.services.Places(map); 
			   	ps.categorySearch('FD6', placesSearchCB, {useMapBounds:true}); 
		   	    
		   	});
		   
			

			$("#searchbtn").click(()=>{
				
				var keyword = $("#searchbox").val();
				
				var ps = new kakao.maps.services.Places(); 
				ps.keywordSearch(keyword, placesSearchCB); 

				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {
				    	
				    	var moveLatLon = new kakao.maps.LatLng(data[0].y, data[0].x);
				    	
				    	map.setCenter(moveLatLon);
				    }else{
				    }
				}	
				
			})
			
			

			$.ajax({
				type:"GET",
				url:getContextPath()+"/data/mapdata.do", 
				/* data: {} , */ 
				dataType:"json",
				success : data=>{
			        if ( typeof(data) == "undefined" ) {return;}
			        
			        for(var shopdata of data){
			        	
			        	    var latval = JSON.stringify(shopdata.LOC_LAT).replaceAll("\"", ""); 
			        		var lonval = JSON.stringify(shopdata.LOC_LON).replaceAll("\"", "");
			        		var nameval = JSON.stringify(shopdata.SHOP_NAME).replaceAll("\"", "");
			        		var shopseqval = JSON.stringify(shopdata.SHOP_SEQ).replaceAll("\"", "");
			
				        	var imageSrc = getContextPath()+"/images/icon.png"; // 마커이미지의 주소입니다    
				            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
				            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				              
					        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					            markerPosition = new kakao.maps.LatLng(latval, lonval); // 마커가 표시될 위치입니다
	
					        // 마커를 생성합니다
					        var marker = new kakao.maps.Marker({
					            position: markerPosition, 
					            image: markerImage, // 마커이미지 설정
					            zIndex:500
					        });
					            
					        var path = getContextPath();
					            
					        var content = '<div class="markerbox">' +
					        '  <a href="'+path+'/shop/shopDetail.zmny?shop_seq='+shopseqval+'">' +
					        '    '+nameval +
					        '  </a>' +
					        '</div>';

						    // 커스텀 오버레이가 표시될 위치입니다 
						    var position = new kakao.maps.LatLng(latval, lonval);  
	
						    // 커스텀 오버레이를 생성합니다
						    var customOverlay = new kakao.maps.CustomOverlay({
						        map: map,
						        position: position,
						        content: content,
						        yAnchor: 1 ,
						        zIndex:999
						    });
						    
						    marker.setMap(map);
			        	
			        } 
				    
				},
				error : ()=> {
					alert("에러발생");
				}
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

$("#searchbox").keydown(function(key) {
		if( key.keyCode == 13 ){
			$("#searchbtn").trigger("click");
		}
});





