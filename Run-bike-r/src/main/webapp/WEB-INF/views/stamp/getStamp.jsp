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

<style type="text/css">

#stampButtonArea{
	text-align: center;
}

#getStampButton{
	margin : 30px 0;
}
</style>

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
					<div id="stampButtonArea">
						<button type="button" class="btn btn-outline-primary" onclick="getStampMarker(${stamp.s_point_lon}, ${stamp.s_point_lat}, ${stamp.s_num})">${stamp.s_name}</button>					
					</div>
				</div>	
			</c:forEach>
			
			
		</div>
		
		<div id="getStampButton">
			<button type="button" class="btn btn-primary btn-lg btn-block" onclick="getStamp()" >스탬프 얻기!</button>
		</div>
	</div>
	
	<script>
	
	 var map, myPointLayer, markerLayer, vector_layer;
	 var myLocation = new Object();
	 var stampLocation = new Object();
	 var path = 'http://localhost:8080/runbike';
	 
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
         markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
         vector_layer = new Tmap.Layer.Vector('Tmap Vector Layer'); // 백터 레이어 생성
   
         map.addLayer(myPointLayer);
         map.addLayer(markerLayer);//map에 마커 레이어 추가
     	 map.addLayers([vector_layer]); // 지도에 백터 레이어 추가
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
                 var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_i.png  />', size, offset);
                 var marker = new Tmap.Marker(lonlat, icon);
                 myPointLayer.addMarker(marker);

                 map.setCenter(lonlat); // geolocation으로 얻어온 좌표로 지도의 중심을 설정합니다.
               
                 //myLocation 객체에 값 저장
                 myLocation.lon = lon;
                 myLocation.lat = lat;                            
             });           
         }
     }

	 function getStampMarker(lon, lat, s_num) {
		 
		 stampLocation.lon = lon;
		 stampLocation.lat = lat;
		 stampLocation.s_num = s_num;
		 markerLayer.clearMarkers();

		 var lonlat = new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857");//좌표 설정	 
		 var size = new Tmap.Size(24, 38);//아이콘 크기 설정
		 var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점 설정
		 var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_g.png',size, offset);//마커 아이콘 설정
			
		 marker = new Tmap.Marker(lonlat, icon);//마커 생성
		 markerLayer.addMarker(marker);//레이어에 마커 추가
		 
		 drawCircle(lon, lat);//원 그리기
		 
		 //가운데 지점 구하기		 
		 var myLon = myLocation.lon;
		 var myLat = myLocation.lat;
		 var midLon = (myLon + lon) / 2;
    	 var midLat = (myLat + lat) / 2;
		 var midLonlat = new Tmap.LonLat(midLon, midLat).transform("EPSG:4326", "EPSG:3857");//좌표 설정	
		 
		 var distance = Math.sqrt(Math.pow((myLon-lon),2) + Math.pow((myLat-lat),2));
		 
		 if(distance < 0.05){ //5키로 미만이면
			 map.setCenter(midLonlat, 14);
		 } else if(distance < 0.1) {
			 map.setCenter(midLonlat, 12);
		 }		 
		 
		 $("#getStampButton").css("display", "block");
	 }
	 
	 function drawCircle(lon, lat){
		
		//클릭할 떄마다 도형 떨구기
		vector_layer.removeAllFeatures();
		
		//원
		var coord = new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857");
		var circle = new Tmap.Geometry.Circle(coord.lon, coord.lat, 1300); // 원 생성
				
		// 지도상에 그려질 스타일을 설정합니다
		var style_red = {
			fillColor:"#FF0000",
			fillOpacity:0.2,
			strokeColor: "#FF0000",
			strokeWidth: 3,
			strokeDashstyle: "solid",
			pointRadius: 60
		};
		var circleFeature = new Tmap.Feature.Vector(circle, null, style_red); // 원 백터 생성
		vector_layer.addFeatures([circleFeature]); // 원 백터 를 백터 레이어에 추가
		
		//선
		var pointList = []; //포인트를 저장할 배열
		pointList.push(new Tmap.Geometry.Point(126.874257, 37.582697).transform("EPSG:4326", "EPSG:3857"));
		pointList.push(new Tmap.Geometry.Point(126.873989, 37.57443).transform("EPSG:4326", "EPSG:3857"));
		pointList.push(new Tmap.Geometry.Point(126.890468, 37.571954).transform("EPSG:4326", "EPSG:3857"));
				
		var lineString = new Tmap.Geometry.LineString(pointList); // 라인 스트링 생성
		var style_bold = {strokeWidth: 1}; // 선 굵기 지정
		var mLineFeature = new Tmap.Feature.Vector(lineString, null, style_bold); // 백터 생성
		 
		var vectorLayer = new Tmap.Layer.Vector("vectorLayerID"); // 백터 레이어 생성
		map.addLayer(vectorLayer); // 지도에 백터 레이어 추가
			 
		vectorLayer.addFeatures([mLineFeature]); // 백터를 백터 레이어에 추가
	 }
	 
	 function getStamp(){
		 
		 var s_num = stampLocation.s_num;
		 var stampLon = stampLocation.lon;
		 var stampLat = stampLocation.lat;
		 var myLon = myLocation.lon;
		 var myLat = myLocation.lat;
		 
		 if(stampLon == null || stampLat == null){
			 alert('얻고자하는 stamp를 먼저 눌러주세요');
		 }
		 
    	 var distance = Math.sqrt(Math.pow((stampLon-myLon),2) + Math.pow((stampLat-myLat),2));
    	 
    	 if(distance <= 0.011){
    		 alert('반경 안에 위치해있습니다');
            
    		 $.ajax({
                 url: path + '/stamp',
                 type: 'POST',
                 data: {
                     s_num: s_num
                 },
                 success: function(data) {
                     if (data == "success") {
                         alert('뱃지 얻기 성공!');
                     }
                 }
             });
    	 } else{
    		 alert('반경 안에 위치하지 않았습니다.');
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