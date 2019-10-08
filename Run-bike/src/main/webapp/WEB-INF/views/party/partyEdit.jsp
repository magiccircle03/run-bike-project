<%@page import="com.teamrun.runbike.party.domain.PartyInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 지도, 모델 -->
<title>같이 달리기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- tmap api -->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">
<script src="<c:url value='/assets/js/layout.js'/>"></script>

<script src="https://kit.fontawesome.com/8653072c68.js"></script>

<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">  
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>


<style type="text/css">
body{
	color : #333333;
}
.tabWidth{
	width:33%;
	text-align: center;
}

.width30{
	width: 30%;
}
h5{
	font-weight: bold;
}
.yellow{
	color: #FBAB00;
}
.gray{
	color: #aaaaaa;
}
.bold{
	font-weight: bold;
}

.marginTop{
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

<div class="container">

<ul class="nav nav-pills nav-justified">
  <li class="nav-item tabWidth">
    <a class="nav-link active" data-toggle="tab" href="#partyInfoTab">방정보</a>
  </li>
  <li class="nav-item tabWidth">
    <a class="nav-link" data-toggle="tab" href="#curInfoTab">현재정보</a>
  </li>
  <li class="nav-item tabWidth">
    <a class="nav-link" data-toggle="tab" href="#chatTab">채팅</a>
  </li>
</ul>

<div class="tab-content">
  
  <div class="tab-pane fade show active" id="partyInfoTab">
  
    <div id="partyInfo">
    		<h3>방 정보 수정하기</h3>
    		<div class="form-group">
     			<input id="p_num" name="p_num" type="hidden" class="form-control" value="${partyInfo.p_num}">
    	  		<input id="p_name" name="p_name" type="text" onclick="select()" value="${partyInfo.p_name}" class="form-control marginTop" required="required">
    	    </div>
    	    <div id="map_div"></div>
    	    
    	    <div class="form-group">
    	    	<i class="fab fa-font-awesome-flag"></i> <input id="p_start_info" name="p_start_info" type="text" onclick="select()" value="${partyInfo.p_start_info}" class="form-control" style="display: inline-block; width:35%" required><button onclick="searchPoi('S')" class="btn" style="width:7%">검색</button>
   				<i class="fas fa-flag-checkered"></i> <input id="p_end_info" name="p_end_info" type="text" onclick="select()" value="${partyInfo.p_end_info}" class="form-control" style="display: inline-block; width:35%" required><button onclick="searchPoi('E')" class="btn" style="width:7%">검색</button>
			  	<button class="btn" onclick="getRouteNew()">경로 선택</button>
			    <p id="result"></p>
			    
			    <input id="p_riding_km" type="number" style="display: none;" readonly="readonly">
			    <input id="p_riding_time" type="number" style="display: none;" readonly="readonly">
			  	<textarea id="p_XY" name="p_XY" class="form-control" style="display: none;" readonly="readonly" value="${partyInfo.p_XY}"></textarea>
			  	
    	    </div>
    	
    	    <div class="form-group">
    	  		<input id="p_content" name="p_content" type="text" onclick="select()" value="${partyInfo.p_content}" class="form-control marginTop" required="required">
    	    </div>
    	    
 				<div class="form-group">
			    <label for="p_time">출발 예정 시간</label>
			    <input id="p_time" name="p_time" type="datetime-local" value="${partyInfo.p_time}" class="form-control" required="required">
			  </div>
			  
			  <div class="form-group">
			    <label for="p_capacity">최대 인원</label>
			    <input id="p_capacity" name="p_capacity" type="number" value="${partyInfo.p_capacity}" class="form-control" required="required">
			  </div>
			  
			  <div class="form-group">
			    <label for="p_password">비밀번호</label>
			    <input id="p_password" name="p_password" type="text" value="${partyInfo.p_password}" class="form-control">
			  </div>
			  
	    	<br>
	    
			<button class="btn" onclick="editParty()">수정하기</button>

    </div>

  </div><!-- /partyInfoTab -->
 
</div>

</div><!-- 컨테이너 끝 -->
<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->
<script>

var p_num = ${partyInfo.p_num}; // 방 번호
var p_capacity_old = ${partyInfo.p_capacity}; // 원래 방이 가지고있던 수용인원
var xy_old = ${partyInfo.p_XY}; // 원래 지도정보

/* 지도에 사용될 변수들 */
var markerLayer = null;
var markerStartLayer = null;
var markerEndLayer = null;
var routeLayer = null;
var xy_new = new Object();

/* 기본으로 현재시각을 셋팅한다 */
var timezoneOffset = new Date().getTimezoneOffset() * 60000;
var timezoneDate = new Date(Date.now() - timezoneOffset); // 타임존을 반영한 현재 시각
$('#p_time').val(timezoneDate.toISOString().slice(0, 16));

$(document).ready(function() {
	initTmap(xy_old);
});

/* 파티 정보를 수정하는 함수 */
function editParty(){
	
	if($('#p_capacity').val() < p_capacity_old){
		alert('인원수는 늘리기만 가능합니다');
	}else{
		$.ajax({
			url : '../../party/'+p_num+'/edit',
			type : 'POST',
			data : JSON.stringify({
				p_num : $('#p_num').val(),
				p_name : $('#p_name').val(),
				p_content : $('#p_content').val(),
				p_start_info : $('#p_start_info').val(),
				p_end_info : $('#p_end_info').val(),
				p_XY : $('#p_XY').val(),
				p_time : $('#p_time').val(),
				p_capacity : $('#p_capacity').val(),
				p_password : $('#p_password').val(),
				p_riding_km : $('#p_riding_km').val(),
				p_riding_time : $('#p_riding_time').val(),
			}),
			contentType : 'application/json; charset=utf-8', //전달해줄 때 타입
			success : function() {
				alert('수정되었습니다!');
				location.href='../../party';
			}
		});
	}
	
}

/* 선택시 수정하기 편하게 블록 잡아준다 */
function select() {
	$(this).select();
}

/* 맵 초기화 */
function initTmap(xy_old) {
	
    // map 생성
    // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.								
    map = new Tmap.Map({
        div: 'map_div', // map을 표시해줄 div
        width: "100%", // map의 width 설정
        height: "450px", // map의 height 설정
    });
    map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점을 설정합니다.						
	
    getRoute(xy_old);
}

/* 새로운 경로를 뿌려준다 */
function getRouteNew() {
	getRoute(xy_new);
}

/* 출발지, 도착지 검색 */
function searchPoi(se) {
    
    if (routeLayer != null) {
        map.removeLayer(routeLayer);
        map.removeAllPopup();
        routeLayer=null;
    }

    // POI 통합 검색 API 요청
    var query;
    if (se == 'S') {
        query = $('#p_start_info').val();
    } else if (se == 'E') {
        query = $('#p_end_info').val();
    }
   
    $.ajax({
        method: "GET",
        url: "https://apis.openapi.sk.com/tmap/pois?version=1&format=xml&callback=result", // POI 통합검색 api 요청 url입니다.
        async: false,
        data: {
            "searchKeyword": query, //검색 키워드
            "resCoordType": "EPSG3857", //응답 좌표계 유형
            "appKey": "6d5877dc-c348-457f-a25d-46b11bcd07a9", // 실행을 위한 키입니다. 발급받으신 AppKey(appKey)를 입력하세요.
            "count": 10 //페이지당 출력되는 개수를 지정
        },
        //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
        success: function(response) {
            prtcl = response;

            // 기존 마커, 팝업 제거
            if (markerLayer != null) {
                markerLayer.clearMarkers();
                map.removeAllPopup();
            }

            // POI 마커 표시
            markerLayer = new Tmap.Layer.Markers(); //마커 레이어 생성
            map.addLayer(markerLayer); //map에 마커 레이어 추가
            var size = new Tmap.Size(24, 38); //아이콘 크기 설정
            var offset = new Tmap.Pixel(-(size.w / 2), -(size.h)); //아이콘 중심점 설정
            var maker;
            var popup;
            var prtclString = new XMLSerializer().serializeToString(prtcl); //xml to String	
            xmlDoc = $.parseXML(prtclString),
                $xml = $(xmlDoc),
                $intRate = $xml.find("poi");
            var innerHtml = "";
            $intRate.each(function(index, element) {
                var name = element.getElementsByTagName("name")[0].childNodes[0].nodeValue;
                var id = element.getElementsByTagName("id")[0].childNodes[0].nodeValue;
         
                var lon = element.getElementsByTagName("noorLon")[0].childNodes[0].nodeValue;
                var lat = element.getElementsByTagName("noorLat")[0].childNodes[0].nodeValue;

                var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_' + index + '.png', size, offset); //마커 아이콘 설정
                var lonlat = new Tmap.LonLat(lon, lat); //좌표설정 
                marker = new Tmap.Marker(lonlat, icon); //마커생성
                markerLayer.addMarker(marker); //마커레이어에 마커 추가

                //마커 이벤트등록
                marker.events.register("click", popup, onOverMarker);
                //마커에 마우스가 오버되었을 때 발생하는 이벤트 함수입니다.
                function onOverMarker(evt) {
                    //this.show(); //마커에 마우스가 오버되었을 때 팝업이 보입니다. 
                    map.removeAllPopup();
                    poiDetail(id, se);
                }

            });


            map.zoomToExtent(markerLayer.getDataExtent()); //마커레이어의 영역에 맞게 map을 zoom합니다.
        },
        //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
        error: function(request, status, error) {
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

/* 출발지, 도착지 마커 선택 시 팝업 띄워주는 함수 */
function poiDetail(poiId, se) {
    $.ajax({
        method: "GET",
        //POI 상세정보 api 요청 url입니다.
        //resCoordType:응답 좌표계 유형
        //appKey:실행을 위한 키입니다. 발급받으신 AppKey(appKey)를 입력하세요.
        url: "	https://apis.openapi.sk.com/tmap/pois/" + poiId + "?version=1&resCoordType=EPSG3857&format=xml&callback=result&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9",
        async: false,
        //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
        success: function(response) {
            prtcl = response;

            var prtclString = new XMLSerializer().serializeToString(prtcl); //xml to String	
            xmlDoc = $.parseXML(prtclString),
                $xml = $(xmlDoc),
                $intRate = $xml.find("poiDetailInfo");
            var lon = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
            var lat = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
            var name = $intRate[0].getElementsByTagName("name")[0].childNodes[0].nodeValue;
            var address = $intRate[0].getElementsByTagName("address")[0].childNodes[0].nodeValue;
            var nameNaddress = name + "(" + address + ")";
            var selectBtn = '';
            
            if (se == 'S') {
                selectBtn = "<button class='btn selectBtn' onclick='selectStart(" + lon + "," + lat + ",\"" + nameNaddress + "\")'>출발지로 선택</button>";
            } else if (se == 'E') {
                selectBtn = "<button class='btn selectBtn' onclick='selectEnd(" + lon + "," + lat + ",\"" + nameNaddress + "\")'>도착지로 선택</button>";
            }

            var content = "<div style=' position: relative; border-bottom: 1px solid #dcdcdc; line-height: 18px; padding: 0 35px 2px 0;'>" +
                "<div style='font-size: 14px; line-height: 15px;'>" +
                "<p class='poptxt'>" + name + "\n" + "( " + address + " )</p>" +
                selectBtn +
                "</div>" +
                "</div>"; 
                
            var popup = new Tmap.Popup("lablePopup", new Tmap.LonLat(lon, lat), new Tmap.Size(100, 20), content, true); //popup 생성
            popup.autoSize = true; //Contents 내용에 맞게 Popup창의 크기를 재조정할지 여부를 결정
            map.addPopup(popup); //map에 popup추가
        },
        //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
        error: function(request, status, error) {
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

/* 시작지 선택 */
function selectStart(lon, lat, nameNaddress) {
	
    // 기존 마커, 팝업 제거
    if (markerLayer != null) {
        markerLayer.clearMarkers();
        map.removeAllPopup();
    }

    if (markerStartLayer != null) {
        markerStartLayer.clearMarkers();
        map.removeAllPopup();
    }


    // 시작
    markerStartLayer = new Tmap.Layer.Markers("start"); //마커 레이어 생성
    map.addLayer(markerStartLayer); //map에 마커 레이어 추가

    var size = new Tmap.Size(24, 38); //아이콘 크기 설정
    var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
    var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset); //마커 아이콘 설정
    var marker_s = new Tmap.Marker(new Tmap.LonLat(lon, lat), icon);
    markerStartLayer.addMarker(marker_s); //마커 레이어에 마커 추가
    
    xy_new.startName = nameNaddress;
    xy_new.startX = lon;
    xy_new.startY = lat;
    
    $('#p_start_info').val(nameNaddress);
    
}

/* 도착지 선택 */
function selectEnd(lon, lat, nameNaddress) {

    // 기존 마커, 팝업 제거
    if (markerLayer != null) {
        markerLayer.clearMarkers();
        map.removeAllPopup();
    }

    if (markerEndLayer != null) {
        markerEndLayer.clearMarkers();
        map.removeAllPopup();
    }

    // 도착
    markerEndLayer = new Tmap.Layer.Markers("end"); //마커 레이어 생성
    map.addLayer(markerEndLayer); //map에 마커 레이어 추가

    var size = new Tmap.Size(24, 38); //아이콘 크기 설정
    var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
    var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset); //마커 아이콘 설정
    var marker_e = new Tmap.Marker(new Tmap.LonLat(lon, lat), icon);
    markerEndLayer.addMarker(marker_e); //마커 레이어에 마커 추가
    
    xy_new.endName = nameNaddress;
    xy_new.endX = lon;
    xy_new.endY = lat;
    
    $('#p_end_info').val(nameNaddress);
}

/* 경로를 뿌려주는 함수 */
function getRoute(xy) {
    var data = JSON.stringify(xy);
    $('#p_XY').val(data);
    // 시작 마커 표시
    markerStartLayer = new Tmap.Layer.Markers("start"); //마커 레이어 생성
    map.addLayer(markerStartLayer); //map에 마커 레이어 추가

    var size = new Tmap.Size(24, 38); //아이콘 크기 설정
    var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
    var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset); //마커 아이콘 설정
    var marker_s = new Tmap.Marker(new Tmap.LonLat(xy.startX, xy.startY), icon);
    markerStartLayer.addMarker(marker_s); //마커 레이어에 마커 추가
    
    // 도착 마커 표시
    markerEndLayer = new Tmap.Layer.Markers("end"); //마커 레이어 생성
    map.addLayer(markerEndLayer); //map에 마커 레이어 추가

    var size = new Tmap.Size(24, 38); //아이콘 크기 설정
    var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
    var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset); //마커 아이콘 설정
    var marker_e = new Tmap.Marker(new Tmap.LonLat(xy.endX, xy.endY), icon);
    markerEndLayer.addMarker(marker_e); //마커 레이어에 마커 추가
    
    
    var headers = {};
    headers["appKey"] = "6d5877dc-c348-457f-a25d-46b11bcd07a9"; //실행을 위한 키 입니다. 발급받으신 AppKey(appKey)를 입력하세요.

    $.ajax({
        method: "POST",
        headers: headers,
        url: "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=xml", //보행자 경로안내 api 요청 url입니다.
        async: false,
        data: {
            //출발지 위경도 좌표입니다.
            startX: xy.startX,
            startY: xy.startY,
            //목적지 위경도 좌표입니다.
            endX: xy.endX,
            endY: xy.endY,
            reqCoordType: "EPSG3857",
            resCoordType: "EPSG3857",
            //각도입니다.
            //출발지 명칭입니다.
            startName: "출발지",
            //목적지 명칭입니다.
            endName: "도착지"
        },
        //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
        success: function(response) {
            
            prtcl = response;

            // 결과 출력
            var innerHtml = "";
            var prtclString = new XMLSerializer().serializeToString(prtcl); //xml to String	
            xmlDoc = $.parseXML(prtclString),
                $xml = $(xmlDoc),
                $intRate = $xml.find("Document");

            var distanceM = $intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue;
            var distanceKm = ($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue / 1000).toFixed(1);
            var ridingTimeMin = ((distanceKm/16)*60).toFixed(1);
            var tDistance = "총 거리 : " + distanceKm + "km,";
            var tTime = " 예상 시간 : 약 " + ridingTimeMin + "분";

            $("#result").text(tDistance + tTime);
            $("#p_riding_km").val(distanceKm);
            $("#p_riding_time").val(ridingTimeMin);
            

            prtcl = new Tmap.Format.KML({
                extractStyles: true,
                extractAttributes: true
            }).read(prtcl); //데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
            routeLayer = new Tmap.Layer.Vector("route"); // 백터 레이어 생성
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

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>