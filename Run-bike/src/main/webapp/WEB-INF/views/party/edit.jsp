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

<!-- 숨겨진 u_idx -->
<input id="u_idx" name="u_idx" type="text" class="form-control" value="2">
<hr>

<!-- 탭 클릭시마다 새로고침되게 하기 -->
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
    		<div class="form-group ">
    	  		<input id="p_name" name="p_name" type="text" value="${partyInfo.p_name}" class="form-control marginTop" required="required">
    	    </div>
    	    <div id="map_div"> </div>
    	    <i class="fab fa-font-awesome-flag"></i> ${partyInfo.p_start_info} / <i class="fas fa-flag-checkered"></i> ${partyInfo.p_end_info}  
    	    <br>
	    	${partyInfo.p_content}
	    	<br>
	    	출발 예정 시각 : ${partyInfo.p_time_f}
	    	<br>
	    	총 거리 : ${partyInfo.p_riding_km} km , 예상 소요 시간 : ${partyInfo.p_riding_time} 분
    </div>

  </div><!-- /partyInfoTab -->
 
  
</div>

</div><!-- 컨테이너 끝 -->
<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->
<script>

var xy=${partyInfo.p_XY};

$(document).ready(function() {
	initTmap(xy);
});

var p_num = ${partyInfo.p_num};
var u_idx = $('#u_idx').val();// 아이디 값 세션에서 가져오기. 


var path='http://localhost:8080/runbike';


function initTmap(xy) {
	
    // map 생성
    // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.								
    map = new Tmap.Map({
        div: 'map_div', // map을 표시해줄 div
        width: "100%", // map의 width 설정
        height: "450px", // map의 height 설정
    });
    map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점을 설정합니다.						
	
    getRoute(xy);
}


function getRoute(xy) {
	
    // 시작 마커 표시
    markerStartLayer = new Tmap.Layer.Markers("start"); //마커 레이어 생성
    map.addLayer(markerStartLayer); //map에 마커 레이어 추가

    var size = new Tmap.Size(24, 38); //아이콘 크기 설정
    var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
    var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset); //마커 아이콘 설정
    //var marker_s = new Tmap.Marker(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
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