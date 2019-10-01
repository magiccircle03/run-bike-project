<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--제이쿼리-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- Bootstrap CSS & JS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">

<!--Tmap API-->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9"></script>

<!--폰트어썸 아이콘  -->
<script src="https://kit.fontawesome.com/ff137eb685.js"
	crossorigin="anonymous"></script>

<title>스탬프 투어</title>
</head>
<body>
	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->

	
	<!-- 컨테이너 시작 -->
	<div class="container">
			
		<h4 class="font-weight-bold pt-5 mb-4"><i class="fas fa-map-marked-alt"> 스탬프 투어</i></h4>
		<div class="page-info-text text-dark">스탬프를 투어를 떠나자!</div>
		<hr>
			
		<div id="map_div"></div>
		
		<br>
		<div class="row">
			<c:forEach var="stamp" items="${stampList}" varStatus="status">	
				<div class="col">
					${stamp.s_name} <br>
					${stamp.s_point_lon} <br>
					${stamp.s_point_lat}
				</div>
			</c:forEach>
		</div>
		
		<button type="button" class="btn btn-primary btn-lg btn-block" >스탬프 얻기!</button>

	</div>
	
	<script>
	
	 var map, myPointLayer;
	 
	 function initTmap() {
         //map 생성
         //Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
         map = new Tmap.Map({
             div: 'map_div',
             width: '100%',
             height: '400px',
             animation: false
         });
         
         myPointLayer = new Tmap.Layer.Markers();        
         map.addLayer(myPointLayer);
	 }
	 
	 function getMyPoint() {

		 myPointLayer.clearMarkers();

         //*****************현재 나의 위치를 얻어오기***************************
         if (navigator.geolocation) {
        	 
             // GeoLocation을 이용해서 접속 위치를 얻어옵니다
             navigator.geolocation.getCurrentPosition(function(position) {
            	 
                 // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                 var lat = position.coords.latitude;
                 var lon = position.coords.longitude;
                 var PR_3857 = new Tmap.Projection("EPSG:3857"); // Google Mercator 좌표계인 EPSG:3857
                 var PR_4326 = new Tmap.Projection("EPSG:4326"); // WGS84 GEO 좌표계인 EPSG:4326        
                 var lonlat = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);

                 var size = new Tmap.Size(24, 38);
                 var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
                 var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png />', size, offset);
                 var marker = new Tmap.Marker(lonlat, icon);
                 myPointLayer.addMarker(marker);

                 map.setCenter(lonlat); // geolocation으로 얻어온 좌표로 지도의 중심을 설정합니다.

                 var myPoint = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);
                 
                 //*****나의 위치를 direct에 저장합니다.               
             });
         }
     }

	 
	 $(document).ready(function() {
         initTmap();
         getMyPoint();
	 });
	 
	</script>
	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->
</body>
</html>