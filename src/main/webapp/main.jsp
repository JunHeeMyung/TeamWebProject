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
<link rel="stylesheet" href="${path}/main.css">
</head>

<body>
	<div id="wrapper">

		<div id="mainframe" class="shadow">
			<div id="topframe" class="shadow">
				<div id="searchwrapper"></div>
				<button id="getMyLocation"><i id="getMyLocationFont" class="fas fa-map-marker-alt"></i></button>
				<div id="searchdiv">
						<input id="searchbox" type="text" value="" placeholder="검색어를 입력하세요">
						<i id="searchbtn" class="fas fa-search"></i>

				</div>

				<div id="topslide" class="carousel slide" data-bs-ride="carousel">

					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#topslide" data-bs-slide-to="0"
							class="active"></button>
						<button type="button" data-bs-target="#topslide" data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#topslide" data-bs-slide-to="2"></button>
					</div>

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
	
<script src="${path}/main.js"></script>

</body>
</html>