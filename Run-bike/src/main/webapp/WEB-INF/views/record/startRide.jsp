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

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">

<!--Tmap API-->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9"></script>

<!--폰트어썸 아이콘  -->
<script src="https://kit.fontawesome.com/ff137eb685.js" crossorigin="anonymous"></script>

<!--폰트  -->
<link href="https://fonts.googleapis.com/css?family=Anton|Exo&display=swap" rel="stylesheet">

<title>바로 시작하기</title>

<style type="text/css">

#clock{
	margin: 10px;
	text-align: center;
	font-style: italic;
	font-weight: bold;
	font-family: 'Anton', sans-serif;
}

#myRecord{
	margin: 10px;
	text-align: center;
	font-style: italic;
	font-weight: bold;
	font-family: 'Anton', sans-serif;
}

p{
color: gray;
font-family: 'Exo', sans-serif;
}

.contents{
	font-size: 40px;
}
</style>


</head>

<body>

	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->

	<!-- 하위 탭  -->
	<div class="row mb-md-5">
		<div class="list-group list-group-horizontal col-md-4 col-sm-12 mx-auto text-center" id="myList" role="tablist">
			<a class="list-group-item list-group-item-action active" id="startRiding" data-toggle="list" href="#" role="tab">바로 시작</a> 
			<a class="list-group-item list-group-item-action" id="ridingGuide" data-toggle="list" id="ridingGuide" href="#" role="tab">라이딩 가이드</a> 
			<a class="list-group-item list-group-item-action" id="myCourse" data-toggle="list" id="myCourse" href="#" role="tab">나의 코스</a>
		</div>
	</div>
	<!-- 하위 탭 끝  -->

	<div class="container">
	
		<h4 class="font-weight-bold pt-5 mb-4"><i class="fas fa-biking"> 라이딩 시작하기</i></h4>
		<div class="page-info-text text-dark">함께 라이딩을 시작해 볼까요?</div>
		<hr>

		<div style="margin-bottom: 20px;">
			<div style="margin-bottom: 4px">
			<i class="fas fa-flag"> 시작지점</i>
			<input type="text" id="startPoint" style="word-spacing: -2px; width: 300px; margin-left: 10px" readonly> 
			</div>
			
			<div>
			<i class="fas fa-flag-checkered"> 도착지점</i>
			<input type="text" id="endPoint" style="width: 300px; margin-left: 10px" placeholder="예)명동역"> 
			<button type="button" id="searchEndPoint" style="margin-top: -3px"  class="btn btn-primary btn-sm" onclick="searchPOIEnd()"><i class="fas fa-search-location"> 검색</i></button>
			</div>
		</div>
		
		
		<div class="custom-control custom-switch">
			<input type="checkbox" class="custom-control-input" id="customSwitch1"> 
			<label class="custom-control-label" for="customSwitch1">따릉이 이용하기</label>
		</div>
		
		<!-- 지도를 표시할 div-->
		<div id="map_div"></div>
		<br>
		
		<!-- 타임워치  -->
		<div id="clock" class="contents">
        </div>
        
		<!-- 해당 운동에 대한 레코드 기록 보여주기  -->
		<div id="myRecord" style="display: none">
		<div class="row">			
			<div class="col">
				<h4>Distance</h4>
				<div class="contents" id=todayDistance></div>
					<p>meter</p>
				</div>
				
				<div class="col">
				<h4>Time</h4>
					<div class="contents" id=todayTime></div>
					<p>minute</p>
				</div>			
			</div>
		</div>
		<br>
		<div id="btnArea">
			<div id="startBtnArea">
				
				<input type="button" class="btn btn-primary btn-lg btn-block" onclick="startRide()" value="시작하기">
			</div>
			<div id="endBtnArea" style="display: none">
				<input type="button" class="btn btn-primary btn-lg btn-block" onclick="endRide()" value="종료하기">
			</div>
			
			<div id="regMyCourseBtn" style="display: none">
				<!-- a trigger modal -->
				<input type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#myCourseModal" value="나의 코스 등록">			
			</div>
	</div>

	<!-- 나의 코스 등록 시 모달 실행-->
	<!-- Modal 시작-->
	<div class="modal fade" id="myCourseModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">나의 코스 등록하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form>
				<div class="modal-body">
					<div class="form-group">
						<label for="myCourse_name">코스 이름</label> 
						<input id="myCourse_name" name="p_name" type="text" placeholder="코스 이름" class="form-control" required="required">
					</div>

					<div class="form-group">
						<label for="myCourse_descript">코스 설명</label> 
						<input id="myCourse_descript" name="p_content" type="text" placeholder="코스 설명" class="form-control" required="required">
					</div>
				</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="regMyCourse()">코스 등록</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->

	<script>
	
	    $('#startRiding').on('click', function(){
	    	location.href="startRide"
	    });
	    
	    $('#ridingGuide').on('click', function(){
	    	location.href="ridingGuide"
	    });
	    
	    $('#myCourse').on('click', function(){
	    	location.href="myCourseList"
	    });
		
	   //시작 버튼 눌렀을 떄 일어나는 함수
	    function startRide(){
	
	    	if(endPointChk==0){
	    		alert('도착지를 지정해주세요!')
	    	}else{
	    		startTime();
	    		movingLocation();
	    		$('#startBtnArea').css("display", "none");
		    	$('#endBtnArea').css("display", "block");
		    	
		    	$("#searchEndPoint").attr("disabled",true);
		    	$("#customSwitch1").attr("disabled",true);
		    	$("#endPoint").attr("disabled",true);
	    	}   	
	    }
	    
        var map, marker, markerStartPointLayer, markerEndPointLayer, markersLayer, routeLayer, seoulBikeLayer;
        var startLonLat; //시작지점
        var endLonLat; //끝지점
        var direct = new Object(); // startPoint와 endPoint 값을 저장하고 있는 경로 객체
		var endPointChk = 0; //목적지가 정상적으로 찾아졌는지를 확인하는 함수
		var path = '<c:url value="/record" />';
		
        // 1. 지도 띄우기
        function initTmap() {
            // map 생성
            // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
            map = new Tmap.Map({
                div: 'map_div', // map을 표시해줄 div
                width: '100%', // map의 width 설정
                height: '400px' // map의 height 설정
            });
            markerStartPointLayer = new Tmap.Layer.Markers();
            markerEndPointLayer = new Tmap.Layer.Markers();
            markersLayer = new Tmap.Layer.Markers();
            DrawLine.vectorLayer2 = new Tmap.Layer.Vector('TmapVectorLayer');
            seoulBikeLayer = new Tmap.Layer.Markers();
            routeLayer = new Tmap.Layer.Vector("route"); // 루트를 표시하는 백터 레이어 생성
           
            
            map.addLayer(markerStartPointLayer);
            map.addLayer(markerEndPointLayer);
            map.addLayers([DrawLine.vectorLayer2]); // 지도에 백터 레이어 추가
            map.addLayer(markersLayer);      
            map.addLayer(seoulBikeLayer);
            
            DrawLine.initData(); // 포인트 데이터 초기화  
            getStartPoint();
        }

        //*******************************************현재 나의 위치를 찾고, 그 위치를 startPoint로 등록******************************************************
        function getStartPoint() {

            markerStartPointLayer.clearMarkers();

            //*****************현재 나의 위치를 얻어오기***************************
            if ("geolocation" in navigator) {
                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function(position) {

                    startLonLat = position.coords;

                    // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    var lat = position.coords.latitude;
                    var lon = position.coords.longitude;
                    var PR_3857 = new Tmap.Projection("EPSG:3857"); // Google Mercator 좌표계인 EPSG:3857
                    var PR_4326 = new Tmap.Projection("EPSG:4326"); // WGS84 GEO 좌표계인 EPSG:4326        
                    var lonlat = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);

                    var size = new Tmap.Size(24, 38);
                    var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
                    var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_i.png />', size, offset);
                    var marker = new Tmap.Marker(lonlat, icon);
                    markerStartPointLayer.addMarker(marker);

                    map.setCenter(lonlat); // geolocation으로 얻어온 좌표로 지도의 중심을 설정합니다.

                    var startPoint = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);
                    direct.startPoint = startPoint;

                    $('#startPoint').val("나의 위치:  " + reverseGeo(lonlat.lon, lonlat.lat));

                }, function(error) {
                	alert(error);
                });
            } else {
            	alert('GPS를 지원하지 않습니다.');
            }
        }

        //검색 시에 마커를 찍는 함수입니다.
        function addMarker(options) {

            var size = new Tmap.Size(12, 19); //아이콘 크기입니다.
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점입니다.
            var icon = new Tmap.Icon("http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_s_simple.png", size, offset); //마커 아이콘입니다.
            var markers = new Tmap.Markers(options.lonlat, icon); //마커를 생성합니다.
            markersLayer.addMarker(markers); //레이어에 마커를 추가합니다.

            var lon = options.lonlat.lon;
            var lat = options.lonlat.lat;

            /****************마커 위에 뜨는 팝업 내용**********************/
            var content = "<div style='border-bottom: 1px solid #dcdcdc; line-height: 18px; padding: 0 35px 2px 0;'>" +
                "<div style='font-size: 12px;'>" +
                "<span style='display: inline-block; vertical-align: middle; margin-right: 5px;'>" + options.name + "</span>" +
                "</div>" +
                "</div>" +
                "<div style='position: relative; padding-top: 5px; display:inline-block'>" +
                "<div style='display:inline-block; margin-left:5px; vertical-align: top;'>" +
                "<span style='font-size: 12px; margin-left:2px;'>" +
                "<input type=\"button\" id=\"endBtn\" onclick=\"setEndPoint(" + lon + "," + lat + ")\"value=\"도착지로 지정\">" +
                "</span>" +
                "</div>" +
                "</div>";

            var popup = new Tmap.Popup("p1", options.lonlat, new Tmap.Size(120, 50), content, true);
            popup.setBorder("1px solid #8d8d8d"); //popup border 조절
            popup.autoSize = true; //popup 사이즈 자동 조절		                         
            map.addPopup(popup); //map에 popup 추가
            popup.hide();

            markers.events.register("click", popup, onOverMarker);
            markers.events.register("touchstart", popup, onOverMarker);
            //마커를 클릭했을 때 발생하는 이벤트 함수입니다.
            function onOverMarker(evt) {
                this.show(); //마커를 클릭하였을 때 팝업이 보입니다.
                options.select = 1;

            }

            map.events.register("mouseup", popup, onOutMarker);
            map.events.register("touchstart", popup, onOutMarker);
            //지도를 클릭했을 때 발생하는 이벤트 함수입니다.
            function onOutMarker(evt) {
                this.hide(); //지도를 클릭하였을 때 팝업이 사라집니다.
                options.select = 0;
            }

        }

        //데이터 로드가 섬공적으로 완료 되었을 때 발생하는 함수입니다.
        function onCompleteTData(e) {

            markersLayer.clearMarkers();
            markersLayer.setVisibility(true);

            //return 받은 xml에서 'searchPoiInfo pois poi'가 존재하는지 확인합니다.
            if (jQuery(this.responseXML).find("searchPoiInfo pois poi").text() != '') {
                //each문을 실행하여 마커를 추가합니다.
                jQuery(this.responseXML).find("searchPoiInfo pois poi").each(function() {
                    var name = jQuery(this).find("name").text(); //name의 값을 추출 합니다.
                    var lon = jQuery(this).find("frontLon").text(); //lon 값을 추출 합니다.
                    var lat = jQuery(this).find("frontLat").text(); //lat 값을 추출 합니다.
                    var options = {
                        name: name, //마커의 라벨 옵션 설정
                        lonlat: new Tmap.LonLat(lon, lat), //마커의 좌표 옵션 지정
                    };
                    addMarker(options); //위에서 만들어 놓은 마커를 등록하는 함수 실행합니다.
                });
            }
            map.zoomToExtent(markersLayer.getDataExtent()); //map의 zoom을 마커 레이어의 해상도에 맞게 변경합니다.
        }

        /*********************************************endPoint를 direct에 저장하고, endPoint의 Marker를 변경************************************************/
        function setEndPoint(lon, lat) {

            //기존에 등록했던 endPointMarker 삭제
            markerEndPointLayer.clearMarkers();

            var endPoint = new Tmap.LonLat(lon, lat);

            //endPoint의 좌표를 direct 객체에 저장
            direct.endPoint = endPoint;

            //
            //도착지 선택 버튼을 눌렀을 때, markersEndLayer 감추기
            markersLayer.setVisibility(false);

            map.addLayer(markerEndPointLayer); //map에 마커 레이어 추가

            var size = new Tmap.Size(24, 38); //아이콘 크기 설정
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
            var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_g.png />', size, offset); //마커 아이콘 설정
            var marker_e = new Tmap.Marker(endPoint, icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
            markerEndPointLayer.addMarker(marker_e); //마커 레이어에 마커 추가
            
            endPointChk = 1;
            
            findRoad();
        }

        /***********************************************************************EndPoint를 검색하는 함수!!!!!*********************************************************/
        function searchPOIEnd() {

        	$("#customSwitch1").attr("checked", false);
			
            //기존 endPoint로 지정했던 마커를 삭제한다.
            markerEndPointLayer.clearMarkers();
            //검색했던 따릉이의 마커들은 삭제
			seoulBikeLayer.clearMarkers();
            //기존 루트레이어는 안보이게 처리
            routeLayer.setVisibility(false);

            var endPoint = $('#endPoint').val();

            if (endPoint == "") {
                alert("도착지를 입력하세요!");
            } else {
                tdata = new Tmap.TData(); //REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.
                tdata.events.register("onComplete", tdata, onCompleteTData); //데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트입니다.
                var center = map.getCenter(); //map의 중심 좌표 값을 받아 옵니다.
                //POI 검색 데이터를 콜백 함수를 통해 XML로 리턴
                tdata.getPOIDataFromSearch(encodeURIComponent(endPoint), {
                    centerLon: center.lon,
                    centerLat: center.lat,
                    reqCoordType: "EPSG3857",
                    resCoordType: "EPSG3857"
                }); //encodeURIComponent함수로 해당 파라메터 값을 처리합니다. 
            }
        }

        /********************************************티맵 경로찾기***********************************************************/
        function findRoad() {

            routeLayer.setVisibility(true);
            
            var startX = direct.startPoint.lon;
            var startY = direct.startPoint.lat;
            var endX = direct.endPoint.lon;
            var endY = direct.endPoint.lat;  
            
            //********************direct에 저장된 좌표값을 경로찾기 ajax에 맞는 좌표값으로 변경************************
            var pr_3857 = new Tmap.Projection("EPSG:3857");
            var pr_4326 = new Tmap.Projection("EPSG:4326");

            var startPointLonLat = new Tmap.LonLat(startX, startY).transform(pr_3857, pr_4326);
            var endPointLonLat = new Tmap.LonLat(endX, endY).transform(pr_3857, pr_4326);

            var headers = {};
            headers["appKey"] = "6d5877dc-c348-457f-a25d-46b11bcd07a9"; //실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
            $.ajax({
                method: "POST",
                headers: headers,
                url: "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=xml", //보행자 경로안내 api 요청 url입니다.
                async: false,
                data: {
                    //출발지 위경도 좌표입니다.
                    startX: startPointLonLat.lon.toString(),
                    startY: startPointLonLat.lat.toString(),
                    //목적지 위경도 좌표입니다.
                    endX: endPointLonLat.lon.toString(),
                    endY: endPointLonLat.lat.toString(),

                    //출발지, 경유지, 목적지 좌표계 유형을 지정합니다.
                    reqCoordType: "WGS84GEO",
                    resCoordType: "EPSG3857",
                    //각도입니다.
                    //출발지 명칭입니다.
                    startName: "출발지",
                    //목적지 명칭입니다.
                    endName: "도착지"
                },
                //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
                success: function(response) {
                	
                    routeLayer.removeAllFeatures();

                    prtcl = response;

                    // 결과 출력
                    var prtclString = new XMLSerializer().serializeToString(prtcl); //xml to String	
                    xmlDoc = $.parseXML(prtclString),
                        $xml = $(xmlDoc),
                        $intRate = $xml.find("Document");

                    prtcl = new Tmap.Format.KML({
                        extractStyles: true,
                        extractAttributes: true
                    }).read(prtcl); //데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.

                    //표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
                    //벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
                    routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);

                    function onBeforeFeatureAdded(e) {
                        var style = {};
                        switch (e.feature.attributes.styleUrl) {
                            case "#pointStyle":
                                style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
                                style.graphicHeight = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
                                style.graphicOpacity = 1; //외부 이미지 파일의 투명도 (0-1)입니다.
                                style.graphicWidth = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
                                break;
                            default:
                                style.strokeColor = "#ff0000"; //stroke에 적용될 16진수 color
                                style.strokeOpacity = "1"; //stroke의 투명도(0~1)
                                style.strokeWidth = "5"; //stroke의 넓이(pixel 단위)
                        };
                        e.feature.style = style;
                    }

                    routeLayer.addFeatures(prtcl); //레이어에 도형을 등록합니다.
                    map.addLayer(routeLayer); //맵에 레이어 추가

                    map.zoomToExtent(routeLayer.getDataExtent()); //map의 zoom을 routeLayer의 영역에 맞게 변경합니다.
                },
                //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
                error: function(request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }

        /********************************************위도와 경도를 주소값으로 변경************************************************/
        function reverseGeo(lon, lat) {

            var result;

            //좌표계 변환
            var lonlat = new Tmap.LonLat(lon, lat);
            lonlat = lonlat.transform(new Tmap.Projection("EPSG:3857"), new Tmap.Projection("EPSG:4326"));

            $.ajax({
                method: "GET",
                url: "https://apis.openapi.sk.com/tmap/geo/reversegeocoding?version=1&format=json&callback=result", // ReverseGeocoding api 요청 url입니다.
                async: false,
                data: {
                    "coordType": "WGS84GEO", //지구 위의 위치를 나타내는 좌표 타입
                    "lon": lonlat.lon,
                    "lat": lonlat.lat,
                    "appKey": "6d5877dc-c348-457f-a25d-46b11bcd07a9", //실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
                },
                //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
                success: function(response) {
                    prtcl = response;

                    // 3. json에서 주소 파싱
                    var arrResult = prtcl.addressInfo;

                    //법정동 마지막 문자 
                    var lastLegal = arrResult.legalDong.charAt(arrResult.legalDong.length - 1);

                    // 새주소
                    newRoadAddr = arrResult.city_do + ' ' + arrResult.gu_gun + ' ';

                    if (arrResult.eup_myun == '' && (lastLegal == "읍" || lastLegal == "면")) { //읍면
                        newRoadAddr += arrResult.legalDong;
                    } else {
                        newRoadAddr += arrResult.eup_myun;
                    }
                    newRoadAddr += ' ' + arrResult.roadName + ' ' + arrResult.buildingIndex;

                    // 새주소 법정동& 건물명 체크
                    if (arrResult.legalDong != '' && (lastLegal != "읍" && lastLegal != "면")) { //법정동과 읍면이 같은 경우

                        if (arrResult.buildingName != '') { //빌딩명 존재하는 경우
                            newRoadAddr += (' (' + arrResult.legalDong + ', ' + arrResult.buildingName + ') ');
                        } else {
                            newRoadAddr += (' (' + arrResult.legalDong + ')');
                        }
                    } else if (arrResult.buildingName != '') { //빌딩명만 존재하는 경우
                        newRoadAddr += (' (' + arrResult.buildingName + ') ');
                    }


                    result = newRoadAddr;

                },
                //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
                error: function(request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });

            return result;
        }
      	
        function changeCss(){
        	$('#clock').css("display", "none");
        	$('#myRecord').css("display", "block");
        	$('#todayDistance').html(DrawLine.totDistance.toFixed(2));
        	$('#todayTime').html(exTime);
        	$('#endBtnArea').css("display", "none");
        	$('#regMyCourseBtn').css("display", "block");
   
        	$("#searchEndPoint").removeAttr("disabled");
        	$("#endPoint").removeAttr("disabled"); 
        }
        
        //데이터 저장하기!!!
        function saveData() {     	        
            $.ajax({
                url: path,
                type: 'POST',
                data: {
                    r_riding_time: exTime,
                    r_riding_km: DrawLine.totDistance.toFixed(2),
                    r_startPoint_lon: direct.startPoint.lon,
                    r_startPoint_lat: direct.startPoint.lat,
                    r_endPoint_lon: direct.endPoint.lon,
                    r_endPoint_lat: direct.endPoint.lat
                },
                success: function(data) {                 
                }
            });
        }
        
        function regMyCourse() {

            if($('#myCourse_name').val()==""){
            	alert('코스 이름을 입력해주세요!');
            
            }else{
            	$.ajax({
                    url: '<c:url value="/myCourse" />',
                    type: 'POST',
                    data: {
                        mc_distance: DrawLine.totDistance.toFixed(2),
                        mc_time: exTime,
                        mc_startPoint_lon: direct.startPoint.lon,
                        mc_startPoint_lat: direct.startPoint.lat,
                        mc_endPoint_lon: direct.endPoint.lon,
                        mc_endPoint_lat: direct.endPoint.lat,
                        mc_descript:  $('#myCourse_descript').val(),
                        mc_name: $('#myCourse_name').val()
                    },
                    success: function(data) {
                        if (data == "success") {
                            var myCourse = alert('나의 코스에 저장되었습니다.');
                            //모달 닫기
                            $('#myCourseModal').modal("hide");
                            
                        }
                    }
                });	  
            }          
        }

        /**************************************따릉이 이용하기************************************************/       
        
        function chkSeoulBike(){
        	$("#customSwitch1").change(function(){
   
                if($("#customSwitch1").is(":checked")){
                	
                	//따릉이 이용하기를 누르면, 
                	routeLayer.setVisibility(false);
                	markerEndPointLayer.clearMarkers(); //endPointMarker 해제
                	markersLayer.clearMarkers(); // endPoint 검색한 Markers 해제
                	
                	direct.endPoint = null; //도착지 지정했던 값 null로 변경
                	endPointChk=0; //도착지 지정했는지 체크했던 값 변경
                	
                	
                	var startNum = 1;
                	var endNum = 1000; 
                	var startNum2 = 1001;
                	var endNum2 = 2000;

                		$.ajax({
                            url: "http://openapi.seoul.go.kr:8088/574c4c6e5173757038395565797a4f/json/bikeList/"+startNum+"/"+endNum+"/\"",
                            type: 'GET',
                            success: function(data) {
                            	var connectStatues = data.rentBikeStatus.RESULT.CODE;
                            	var rowData = data.rentBikeStatus.row;
                            	var lon;
    							var lat;
    							var stationName;
    							var parkingBikeTotCnt;
                            	for(var i = 0; i < rowData.length; i++){
                            		
                                    lon = rowData[i].stationLongitude;
                            		lat = rowData[i].stationLatitude;
                            		stationName = rowData[i].stationName;
                            		parkingBikeTotCnt = rowData[i].parkingBikeTotCnt
                            		   		       
                                    seoulBikeAroundMe(lon, lat, stationName, parkingBikeTotCnt);
                                    
                            	} 
                            	console.log("첫번째 따릉이 정보 정상호출: " +connectStatues);
                            }
                    	});
                		
                		$.ajax({
                            url: "http://openapi.seoul.go.kr:8088/574c4c6e5173757038395565797a4f/json/bikeList/"+startNum2+"/"+endNum2+"/\"",
                            type: 'GET',
                            success: function(data) {
                                                   	
                            	var connectStatues = data.rentBikeStatus.RESULT.CODE;
                            	var rowData = data.rentBikeStatus.row;
                            	var lon;
    							var lat;
                            	for(var i = 0; i < rowData.length; i++){
                            		
                            		lon = rowData[i].stationLongitude;
                            		lat = rowData[i].stationLatitude;
                            		                            		
                            		seoulBikeAroundMe(lon, lat);                                    
                            	} 
                            	console.log("두번째 따릉이 정보 정상호출: " + connectStatues);
                            }
                    	});
 	
                }else{
                	seoulBikeLayer.clearMarkers(); //체크 해제 시, 따릉이 표시 Markers 해제
                }       
        	});
        }
        
        /**********************************내 주변 반경 5km 내에 따릉이가 있는지 구하는 서비스*******************************************/
        function seoulBikeAroundMe(lon, lat, stationName, parkingBikeTotCnt){

        	var pr_3857 = new Tmap.Projection("EPSG:3857");
            var pr_4326 = new Tmap.Projection("EPSG:4326");
             
        	var startX = direct.startPoint.lon;
            var startY = direct.startPoint.lat;

            var startPoint = new Tmap.LonLat(startX, startY).transform(pr_3857, pr_4326);
            
            var startLon = startPoint.lon;
            var startLat = startPoint.lat;
        	            
            var distance = Math.sqrt(Math.pow((startLon-lon),2) + Math.pow((startLat-lat),2));
           
            if(distance <= 0.01){ //거리가 약 반경 1km 내의 따릉이만 표시
            	
            	var pr_3857 = new Tmap.Projection("EPSG:3857");
                var pr_4326 = new Tmap.Projection("EPSG:4326");

                var bikePointLonLat = new Tmap.LonLat(lon, lat).transform(pr_4326, pr_3857);
                
                var size = new Tmap.Size(12, 19); //아이콘 크기입니다.
                var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점입니다.
                var icon = new Tmap.Icon("http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_s_simple.png", size, offset); //마커 아이콘입니다.
                var markers = new Tmap.Markers(bikePointLonLat, icon); //마커를 생성합니다.
                
                seoulBikeLayer.addMarker(markers); //레이어에 마커를 추가합니다.
                
                /****************마커 위에 뜨는 팝업 내용**********************/
                var content = "<div style=' position: relative; border-bottom: 1px solid #dcdcdc; line-height: 18px; padding: 0 35px 2px 0;'>"+
			   				  "<div style='font-size: 12px; line-height: 15px;'>"+
		         			   stationName+
		    				  "</div>"+
		                      "</div>"+
		                      "<div style='position: relative; padding-top: 5px; display:inline-block'>"+ 	                 
		   					  "<div style='display:inline-block; margin-left:5px; vertical-align: top;'>"+           
		    				  "<span style='font-size: 12px; color:#888; margin-left:2px; margin-bottom:2px; display:block;'>운행가능한 따릉이 수: "+ parkingBikeTotCnt +"</span>"+
		    	              "<span style='font-size: 12px; margin-left:2px;'><a href='https://www.bikeseoul.com/main.do\' target='blank'>따릉이 홈페이지로 이동</a></span>"+
		                      "</div>"+
		                      "</div>";
                	
                var popup = new Tmap.Popup("p1", bikePointLonLat, new Tmap.Size(120, 50), content, true);
                popup.setBorder("1px solid #8d8d8d"); //popup border 조절
                popup.autoSize = true; //popup 사이즈 자동 조절		                         
                map.addPopup(popup); //map에 popup 추가
                popup.hide();

                markers.events.register("click", popup, onOverMarker);
                markers.events.register("touchstart", popup, onOverMarker);
                //마커를 클릭했을 때 발생하는 이벤트 함수입니다.
                function onOverMarker(evt) {
                    this.show(); //마커를 클릭하였을 때 팝업이 보입니다.
                }

                map.events.register("mouseup", popup, onOutMarker);
                map.events.register("touchstart", popup, onOutMarker);
                //지도를 클릭했을 때 발생하는 이벤트 함수입니다.
                function onOutMarker(evt) {
                    this.hide(); //지도를 클릭하였을 때 팝업이 사라집니다.
                }
                
                map.zoomToExtent(seoulBikeLayer.getDataExtent());
            }
        }
          
        /*Map 시작하기!!!!!!!!!!!!!!!!!!!1*/
        $(document).ready(function() {
            initTmap();
            chkSeoulBike();
            
          //모달값 초기화
            $('#myCourseModal').on('hidden.bs.modal', function (e) {
            	$(this).find('form')[0].reset();
           });
        });
	/*******************************타임워치********************************************/
	 	var h = 0;
        var m = 0;
        var s = 0;
		var timetime;
        var exTime;
        
        function calcTime() {

            s = parseInt(s);
            m = parseInt(m);
            h = parseInt(h);
            
            s += 1;

            if (s == 60) {
                m += 1;
                s = 1;
            }
            if (m == 60) {
                h += 1;
                m = 1;
            }                  
        }

        
        function addZeros(num, digit) { // 자릿수 맞춰주기
            var zero = '';
            num = num.toString();
            if (num.length < digit) {
                for (i = 0; i < digit - num.length; i++) {
                    zero += '0';
                }
            }
            return zero + num;
        }
        
        function startTime(){
            calcTime();
            var hour = addZeros(h, 2);
            var minute = addZeros(m, 2);
            var second = addZeros(s, 2);           
            timetime = setTimeout("startTime()", 1000);  
            $('#clock').html(hour + ' : ' + minute + ' : ' + second);            
        }

        function stop(){
        	clearTimeout(timetime);
        	exTime = ((h*360) + (m*60) + s) / 60;
        	exTime = exTime.toFixed(2);
        }
        
/***********************************************************나의 위치*********************************************************/
 		
 		//각종 변수들
        var DrawLine = DrawLine || {}; // NameSpace

        DrawLine.CNT_BUFF = 10; // 매끄러운 매칭을 위한 버퍼 포인트 개수
        DrawLine.SPLIT_VALUE = 20; // Road API 로 한번에 요청할 포인트 개수. 최대 100개 까지 가능  ex)샘플코드에서는 SPLIT_VALUE 를 10으로 가정했을 때 요청 포인트 개수가 총 25개라면 API 가 3번 호출됨
        DrawLine.REQ_LIMIT_PER_SEC = 1; // API 초당 요청 제한건수

        DrawLine.vectorLayer2 = null; // 이동한도로찾기 API 사용후 벡터 레이어
        DrawLine.arrPoint = null; // 포인트 배열 (resource)

        DrawLine.totDistance = 0; // 매칭된 거리 (단위: m)
        DrawLine.totPointCount = 0; // 매칭된 좌표의 개수 (단위: count)
        DrawLine.arrMatchedId = []; // 매칭된 링크 아이디 (중복제거)

        DrawLine.currentIndex = 0;
        DrawLine.startSourceIndex = 0; // 버퍼 포인트(이전 포인트의 일부를 포함하여 요청)를 제외한 실제 포인트 시작 인덱스

        DrawLine.cntReqApi = 0; // API 요청횟수
        DrawLine.lastMatchedLocation = null; // 이전 마지막 포인트를 저장( 이후 포인트와 연결하기 위함 )
 		
        var lon;
        var lat;
        var repeat;
        
 		//나의 위치를 구해주는 함수
 		function myLocation() {
            if (navigator.geolocation) {
                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function(position) {

                    // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    var lat = position.coords.latitude;
                    var lon = position.coords.longitude;
                  
                    DrawLine.arrPoint.push(lon);
                    DrawLine.arrPoint.push(lat);
                    
                    console.log(lon + "," + lat);               
                });
            }
        }
	
		//나의 위치를 계속 해서 기록 하는 함수
        function movingLocation() {
			
        	myLocation();
        	
            repeat = setInterval(myLocation, 10000);
        }
		
		//위치 기록 종료
        function stopMyLocation(){
			
            clearInterval(repeat);
        }
        
        /* 내가 이동한 좌표 그리기 함수 */
        function drowMyRoad(){
			setTimeout(function() { // 지도를 띄우고 API 를 호출하기 위해 딜레이 줌
               DrawLine.splitPoint(); // 포인트 데이터 나눠서 요청하기 ( LoadApi 한번에 요청 가능한 개수 100개 제한 )
            }, 1000);
        	
        	DrawLine.setMapBound(); // 포인트에 따른 지도 바운드 설정
        }
         
        /**
         * 포인트 개수 나누기 ( LoadApi request limit 100 )
         */
        DrawLine.splitPoint = function() {
            var cntAllPoint = DrawLine.arrPoint.length; // 포인트 배열 갯수 구하기
            var pointString = ""; // LoadApi 에 요청할 포인트 스트링
            var arrMatchedPoint = {}; // response 결과
            var i, j, k, cntPointString = 0;

            for (i = DrawLine.currentIndex; i < cntAllPoint; i += 2) {
                // 포인트 스트링 만들기
                // 경도와 위도 사이는 ‘,’ 좌표와 좌표 사이는 ‘|’ 로 구분 지어 요청 합니다.
                if (pointString != "") {
                    pointString += '|';
                }
                pointString += DrawLine.arrPoint[i] + ',' + DrawLine.arrPoint[i + 1]; // ex) 127.925710,37.557086|127.954464,37.556542
                cntPointString++; // 포인트 스트링 개수 카운트

                var coord = new Tmap.LonLat(DrawLine.arrPoint[i], DrawLine.arrPoint[i + 1]).transform("EPSG:4326", "EPSG:3857");

                if (cntPointString == DrawLine.SPLIT_VALUE || (i + 2) >= cntAllPoint) {
                    // 포인트 개수가 제한 수에 도달했다면 || 반복문의 마지막 항목 이라면 할 작업 

                    // 0. LoadApi 요청
                    DrawLine.reqLoadApi(pointString, function(response) {
                        DrawLine.cntReqApi++; // API 요청횟수 카운트

                        // LoadApi Response 받은 후 작업
                        var matchedId = ""; // 매칭된 아이디
                        var objNextMatchedLocation = {}; // 바로 직전에 매칭된 좌표
                        var objSourceLocation = {}; // 요청한 좌표
                        var lastSourceIndex = -1; // 요청 포인트 인덱스 번호
                        var arrPointForLine = []; // 선으로 그려질 포인트
                        var arrPointForMarker = []; // 마커로 그려질 포인트
                        var arrPointForCalDistance = []; // 거리 계산을 위한 포인트

                        // 결과 값이 존재한다면 실행할 작업
                        if (response && response.resultData.matchedPoints) {
                            arrMatchedPoint = response.resultData.matchedPoints; // 매칭된 정보 데이터(matchedPoints)를 arrMatchedPoint 배열에 담는다.
                            for (j = 0; j < arrMatchedPoint.length; j++) {
                                objMatchedLocation = arrMatchedPoint[j].matchedLocation;
                                objSourceLocation = arrMatchedPoint[j].sourceLocation;

                                // 1. 매칭 아이디 추가 (중복제거)
                                //----------------------------------------------------------------
                                matchedId = arrMatchedPoint[j].linkId + "_" + arrMatchedPoint[j].idxName;
                                for (k = 0; k < DrawLine.arrMatchedId.length; k++) {
                                    if (DrawLine.arrMatchedId[k] == matchedId) {
                                        break;
                                    }
                                }
                                if (k >= DrawLine.arrMatchedId.length) {
                                    // 중복된 아이디가 존재하지 않는다면 할 작업
                                    DrawLine.arrMatchedId.push(matchedId); // 매칭된 아이디 목록에 추가
                                }
                                //----------------------------------------------------------------

                                if (arrMatchedPoint[j].sourceIndex >= 0) {
                                    // sourceIndex 가 존재한다면 마지막 sourceIndex 갱신
                                    lastSourceIndex = arrMatchedPoint[j].sourceIndex;
                                }

                                // 2. 라인으로 그려질 소스 포인트 리스트 만들기
                                if (objSourceLocation) {
                                    arrPointForMarker.push(new Tmap.Geometry.Point(objSourceLocation.longitude, objSourceLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                }

                                // 3-1. 라인으로 그려질 매칭 포인트 리스트 만들기
                                // 한번에 모든 좌표를 요청하면 문제가 없겠지만 100개 이상의 좌표를 여러번 나눠서 요청해야할 경우 요청과 요청 사이의 매칭된 링크가 어긋날 수 있다.
                                // 이를 보정하기 위해 이전 요청 좌표의 일부(버퍼)를 함깨 요청하고 매 요청의 곂치는 부분의 결과를 (버퍼사이즈/2 만큼)덜 그림으로써 좀더 매끄러운 결과를 얻을 수 있다.
                                if (arrPointForLine.length == 0 && DrawLine.lastMatchedLocation) {
                                    // 이전 요청의 마지막 매칭좌표가 존재한다면 현재 매칭 좌표라인의 맨 앞에 추가 ( 이전 요청 라인과 이어지게 하기 위함 )
                                    arrPointForLine.push(new Tmap.Geometry.Point(DrawLine.lastMatchedLocation.longitude, DrawLine.lastMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                    arrPointForCalDistance.push(DrawLine.lastMatchedLocation); // 거리 계산을 위해 저장
                                    DrawLine.lastMatchedLocation = null;
                                }
                                if (cntAllPoint / 2 <= DrawLine.SPLIT_VALUE) {
                                    // 1) 처음이자 마지막 요청이라면(전체 요청 좌표개수가 분할요청 기준보다 적다면) => 매칭된 좌표를 모두 라인으로 그림
                                    if (objMatchedLocation) {
                                        arrPointForLine.push(new Tmap.Geometry.Point(objMatchedLocation.longitude, objMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                        arrPointForCalDistance.push(objMatchedLocation); // 거리 계산을 위해 저장
                                    }
                                } else if (DrawLine.cntReqApi == 1) {
                                    // 2) 처음 요청이면서 이후에 요청이 있을 예정이라면 => 뒤쪽좌표 중 버퍼의 절반 만큼 그리지 않음
                                    if (objMatchedLocation && lastSourceIndex < (cntPointString - (DrawLine.CNT_BUFF / 2))) {
                                        arrPointForLine.push(new Tmap.Geometry.Point(objMatchedLocation.longitude, objMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                        DrawLine.lastMatchedLocation = objMatchedLocation; // 이후 API 요청결과와 라인을 이어가기 위해 마지막 포인트 저장
                                        arrPointForCalDistance.push(objMatchedLocation); // 거리 계산을 위해 저장
                                    }
                                } else if (DrawLine.cntReqApi > 1 && (i + 2) >= cntAllPoint) {
                                    // 3) 처음이 아니면서 마지막 API 요청이라면 => 앞쪽좌표 중 버퍼의 절반 만큼 그리지 않음
                                    if (objMatchedLocation && lastSourceIndex >= (DrawLine.CNT_BUFF / 2)) {
                                        arrPointForLine.push(new Tmap.Geometry.Point(objMatchedLocation.longitude, objMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                        DrawLine.lastMatchedLocation = objMatchedLocation; // 이후 API 요청결과와 라인을 이어가기 위해 마지막 포인트 저장
                                        arrPointForCalDistance.push(objMatchedLocation); // 거리 계산을 위해 저장
                                    }
                                } else if (DrawLine.cntReqApi > 1) {
                                    // 4) 처음이 아니면서 이후에 API 요청이 있을 예정이라면 => 앞쪽좌표 중 버퍼의 절반, 뒤쪽좌표 중 버퍼의 절반 만큼 그리지 않음
                                    if (objMatchedLocation && lastSourceIndex >= (DrawLine.CNT_BUFF / 2) && lastSourceIndex < (cntPointString - (DrawLine.CNT_BUFF / 2))) {
                                        arrPointForLine.push(new Tmap.Geometry.Point(objMatchedLocation.longitude, objMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                        DrawLine.lastMatchedLocation = objMatchedLocation; // 이후 API 요청결과와 라인을 이어가기 위해 마지막 포인트 저장
                                        arrPointForCalDistance.push(objMatchedLocation); // 거리 계산을 위해 저장
                                    }
                                }
                            }

                            // 3-2. 매칭 포인트 리스트로 라인 그리기
                            // 요청한 좌표와 매칭되는 좌표를 사용해 라인을 그려줍니다.(파랑색)
                            // 마커를 추가합니다.
                            var lat = DrawLine.arrPoint[DrawLine.arrPoint.length-1];
                    		var lon = DrawLine.arrPoint[DrawLine.arrPoint.length-2];

                    		var PR_3857 = new Tmap.Projection("EPSG:3857"); // Google Mercator 좌표계인 EPSG:3857
                    		var PR_4326 = new Tmap.Projection("EPSG:4326"); // WGS84 GEO 좌표계인 EPSG:4326        
                    		var lonlat = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);

                    		var size = new Tmap.Size(24, 38);
                    		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
                    		var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_e.png />', size, offset);
                    		var marker = new Tmap.Marker(lonlat, icon);
                    		
                    		markerEndPointLayer.addMarker(marker);
                            DrawLine.drawLine(arrPointForLine);

                            // 4. 매칭된 좌표의 거리 구하기
                            for (k = 0; k < (arrPointForCalDistance.length - 1); k++) {
                                DrawLine.totDistance += DrawLine.calDistance(arrPointForCalDistance[k].longitude, arrPointForCalDistance[k].latitude, arrPointForCalDistance[k + 1].longitude, arrPointForCalDistance[k + 1].latitude);
                            }
                            
                            // 거리 계산용 포인트 리스트 초기화
                            arrPointForCalDistance = [];
                        }
                    });

                    if ((i + 2) < cntAllPoint) {
                        // 마지막 항목이 아니라면 버퍼 포인트 추가
                        pointString = ""; // LoadAPI 의 파라미터 초기화
                        cntPointString = 0; // 포인트 스트링 개수 초기화(LoadAPI 에 포인트 분할 요청을 위한 카운트)
                        i -= (DrawLine.CNT_BUFF * 2); // 매끄러운 링크 매칭을 위해 이전 일부 포인트를 포함한 매칭을 한다. (매칭 버퍼)
                        DrawLine.startSourceIndex = DrawLine.CNT_BUFF; // 매칭 버퍼 포인트를 제외하고 매칭 좌표 수를 카운트 하기 위한 변수
                        
                    }
                    DrawLine.currentIndex = i;
                    console.log("총 거리 : " + DrawLine.totDistance.toFixed(2) + "m");
                	changeCss();
                	saveData();  
                }             
            }
        }

        /**
         * 라인 그리기
         */
        DrawLine.drawLine = function(pointList) {

            // 지도상에 그려질 스타일을 설정합니다.
            var lineStyle = {
                strokeWidth: 6,
                strokeColor: "#0000FF"
            };

            lineString = new Tmap.Geometry.LineString(pointList); // 라인 스트링 생성
            lineFeature = new Tmap.Feature.Vector(lineString, null, lineStyle); // 백터 생성
            DrawLine.vectorLayer2.addFeatures([lineFeature]); // 백터를 백터 레이어에 추가
            

        }


        /**
         * 로드 매칭 API 요청
         */
        DrawLine.reqLoadApi = function(pointString, callback) {
            var url = 'https://apis.openapi.sk.com/tmap/road/matchToRoads?version=1&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9'; // 이동한 도로 찾기 api 요청 url입니다.

            $.ajax({
                type: 'POST',
                contentType: "application/x-www-form-urlencoded",
                url: url,
                data: {
                    "responseType": "1", // 1:전체 데이터 요청, 2:요청좌표 및 매치된 좌표를 제외한 데이터 요청
                    "coords": pointString // 좌표계는 WGS84GEO, 매핑에 사용될 좌표 목록입니다.  경도와 위도 사이는 "," 좌표와 좌표 사이에는 "|"로 구분지어 요청합니다. 
                },
                async: false,
                success: function(data) {
                    callback(data);
                }
            });
        }

        /**
         * 좌표가 한눈에 들어오는 바운드 찾기
         */
        DrawLine.setMapBound = function() {
            var bounds = new Tmap.Bounds(); // bounds 인스턴스를 생성합니다.
            var i;

            for (i = 0; i < DrawLine.arrPoint.length; i += 2) { // 포인트 배열 (resource)의 길이만큼 반복
                // 좌표변환 후 bounds 확장
                bounds.extend(new Tmap.LonLat(DrawLine.arrPoint[i], DrawLine.arrPoint[i + 1]).transform("EPSG:4326", "EPSG:3857"));
            }
            map.zoomToExtent(bounds); // 매칭후 좌표가 한눈에 들어올 수 있는 지도 중심과 줌레벨 설정
        }

        /**
         * 위경도로 거리 구하기
         */
        DrawLine.calDistance = function(lon1, lat1, lon2, lat2) {
            var theta, dist;

            if (lon1 == lon2 && lat1 == lat2)
                return 0;

            theta = lon1 - lon2;
            dist = Math.sin(DrawLine.deg2rad(lat1)) * Math.sin(DrawLine.deg2rad(lat2)) + Math.cos(DrawLine.deg2rad(lat1)) *
                Math.cos(DrawLine.deg2rad(lat2)) * Math.cos(DrawLine.deg2rad(theta));
            dist = Math.acos(dist);
            dist = DrawLine.rad2deg(dist);

            dist = dist * 60 * 1.1515;
            dist = dist * 1.609344; // 단위 mile 에서 km 변환
            dist = dist * 1000.0; // 단위  km 에서 m 로 변환

            return Number(Number(dist).toFixed(2));
        }

        /**
         * 주어진 도(degree) 값을 라디언으로 변환
         */
        DrawLine.deg2rad = function(deg) {
            return (deg * Math.PI / 180);
        }

        /**
         * 주어진 라디언(radian) 값을 도(degree) 값으로 변환
         */
        DrawLine.rad2deg = function(rad) {
            return (rad * 180 / Math.PI);
        }
        
        /**
         * 포인트 배열 초기화
         */
        DrawLine.initData = function() {
            DrawLine.arrPoint = [];          
        }

        function endRide(){
        var endLat = DrawLine.arrPoint[DrawLine.arrPoint.length-1];
     	var endLon = DrawLine.arrPoint[DrawLine.arrPoint.length-2];
   		var myLon = direct.endPoint.lon;
   		var myLat = direct.endPoint.lat;
   		 
       	 var distance = Math.sqrt(Math.pow((endLon-myLon),2) + Math.pow((endLat-myLat),2));
    		 var realDistance = distance.toFixed(3);

   		 console.log(":::::거리는 " + realDistance);
   		 
       	 if(realDistance < 0.00001){
       		var askEnd = confirm('목표지점에 도달하지 못했습니다. 종료하시겠습니까?');

       		if(askEnd == true){
       			stop(); // 타이머 종료
                stopMyLocation(); //내 위치 받기 종료
                drowMyRoad(); //내가 이동한 위치 그리기   	
       		}
       		
       	 } else{
       		 alert('라이딩 종료!');
       		 //라이딩 종료
             stop(); // 타이머 종료
             stopMyLocation(); //내 위치 받기 종료
             drowMyRoad(); //내가 이동한 위치 그리기   	
             
       	 }
       	 
   	 }
    </script>
    
    <!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->
</body>
</html>
