<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이 달리기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- tmap api -->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">
<script src="<c:url value='/assets/js/layout.js'/>"></script>
<script src="https://kit.fontawesome.com/8653072c68.js"></script>
<style type="text/css">

.right{
	text-align: right;
}
.width{
	width: 960px;
} 
.card-title{
	font-weight: bold;
	font-size: 22px;
}

.mint{
	background-color: #21B2A6;
	color: #fefefe;
}
.mintbtn{
	background-color: #21B2A6;
	color: #fefefe;
	width: 49%;
}

.mintbtn:hover{
	background-color: #1F9E93;
	color: #ffffff;
}

.card-style{
	box-shadow: 5px 5px 5px #dedede;
	padding: 20px;
	font-size: 16px;
	background-color: #efefef;
	color : #555555;
	margin: 15px 0;
	line-height: 35px;
}
.h2title{
	font-weight: bold;
}
h3{
	color : #555555;
	font-weight: bold;
}

.selectBtn {
    font-size: 14px;
}

.poptxt {
    padding: 10px;
}
.btn:hover{
	cursor: pointer;
}
.borderline{
	border: 1px solid #ddd;
}
.width100{
	width: 100%;
}
.margin20{
	margin:20px 0;
}
.ing{
    color:#00A2E8;
    display:inline-block;
 }
</style>
</head>
<body onload="initTmap();initTmap2();">

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

<div class="container">

	<!-- 숨겨진 u_idx -->
	<input id="u_idx" name="u_idx" type="hidden" class="form-control" value="${loginInfo.u_idx}">

	<div id="top-nav">
    	    <div class="row">
	    	    <div class="col-md-6">
		    	    <h3>현재 개설된 파티</h3>
					<p>다른 회원과 함께 달려보세요</p> 
				</div>
	    	    <div class="col-md-6" style="text-align: right">
	    	    	<a class="btn" data-toggle="modal" data-target="#createPartyModal">방 만들기</a>
	    	    </div>
    	    </div>
	</div>


	<div id="partyListContainer">
		<div id="partyList" class="row">

		</div><!-- partyList 끝 -->
		
		<p id="pageArea"></p>
		
	</div>

	<!-- 모달시작 -->
	<div class="modal fade" id="createPartyModal" tabindex="-1" role="dialog" aria-labelledby="createPartyTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	      <h4 class="modal-title" id="createPartyTitle">방만들기</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      
		  <form id="createForm">
	      <div class="modal-body">
	          <div class="form-group">
			    <label for="p_name">방 제목</label>
			    <input id="p_name" name="p_name" type="text" placeholder="방 제목" class="form-control" required="required">
			  </div>
			  
			 <div class="form-group">
			    <label for="p_content">방 소개</label>
			    <input id="p_content" name="p_content" type="text" placeholder="방 소개" class="form-control" required="required">
			  </div>
			  
			  <div class="form-group">
			  	<label>목표 경로</label><br>
	   			<input id="p_start_info" name="p_start_info" type="text" placeholder="시작지" class="form-control" style="display: inline-block; width:40%" required><button type="button" onclick="searchPoi('S')" class="btn" style="width:9%">검색</button>
   				<input id="p_end_info" name="p_end_info" type="text" placeholder="도착지" class="form-control" style="display: inline-block; width:40%" required><button type="button" onclick="searchPoi('E')" class="btn" style="width:9%">검색</button>
			  	<button type="button" class="btn mint width100 margin20" onclick="getRoute()">경로 선택</button>
				<div id="map_div">
			    </div>
			    <p id="result"></p>
			    
			    <input id="p_riding_km" type="number" style="display: none;" readonly="readonly">
			    <input id="p_riding_time" type="number" style="display: none;" readonly="readonly">
			  	<textarea id="p_XY" name="p_XY" class="form-control" style="display: none;" readonly="readonly"></textarea>
			  	
			  </div>

			  <!-- 여기에 지도 띄우기 -->
			  
			  
			  
			  <div class="form-group">
			    <label for="p_time">출발 예정 시간</label>
			    <input id="p_time" name="p_time" type="datetime-local" class="form-control" required="required">
			  </div>
			  
			  <div class="form-group">
			    <label for="p_capacity">최대 인원</label>
			    <input id="p_capacity" name="p_capacity" type="number" class="form-control" required="required">
			  </div>
			  
			  <div class="form-group">
			    <label for="p_password">비밀번호</label>
			    <input id="p_password" name="p_password" type="text" placeholder="비밀번호(최대16자)" class="form-control">
			  </div>
			  


	      </div>
	      <div class="modal-footer">
	        <input type="submit" class="btn" value="방 만들기">
	      </div>
	      
 	     </form> 
	    </div>
	  </div>
	</div>
	<!-- 모달끝 -->
	
	
	
	<!-- 상세보기 모달시작 -->
	<div class="modal fade" id="partyDetailModal" tabindex="-1" role="dialog" aria-labelledby="partyDetailTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	      <h4 class="modal-title" id="partyDetailTitle">목표경로</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>

	      <div class="modal-body">
			  <div class="form-group">
			<!--   	<label>목표 경로</label> -->
			  	<br>
				<div id="map_div2">
			    </div>
			    <p id="result2"></p>
			  </div>
	      </div>
	      
	    </div>
	  </div>
	</div>
	<!-- 모달끝 -->
	
	
</div><!-- 컨테이너 끝 -->


<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->

    <script type="text/javascript">
        var markerLayer = null;
        var markerStartLayer = null;
        var markerEndLayer = null;
        var routeLayer = null;
        

        var markerStartLayer2 = null;
        var markerEndLayer2 = null;
        var routeLayer2 = null;
        
        var xy = new Object();
        
        function initTmap() {
            // map 생성
            // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.								
            map = new Tmap.Map({
                div: 'map_div', // map을 표시해줄 div
                //width: "100%", // map의 width 설정
                width: "766px", // 일단은 고정
                height: "400px", // map의 height 설정
            });
            map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점을 설정합니다.						

        }

        function searchPoi(se) {
            
            if (routeLayer != null) {
                map.removeLayer(routeLayer);
                map.removeAllPopup();
                routeLayer=null;
            }

            // 2. POI 통합 검색 API 요청
            var query;
            if (se == 'S') {
                query = $('#p_start_info').val();
            } else if (se == 'E') {
                query = $('#p_end_info').val();
            }
            /*var p_start_info=$('#p_start_info').val();
            var p_end_info=$('#p_end_info').val();*/


            /*if(!p_start_info){
                p_start_info='서울시';
            }*/

            //alert(p_start_info);
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

                    // 2. 기존 마커, 팝업 제거
                    if (markerLayer != null) {
                        markerLayer.clearMarkers();
                        map.removeAllPopup();
                    }

                    // 3. POI 마커 표시
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
                        /*	   	var content ="<div style=' position: relative; border-bottom: 1px solid #dcdcdc; line-height: 18px; padding: 0 35px 2px 0;'>"+
                        					    "<div style='font-size: 12px; line-height: 15px;'>"+name+
                                    
                        					    "</div>"+
                                    
                        					 "</div>";
                        	   	innerHtml+="<div>"+
                        	   					"<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_"+index+".png' style='vertical-align:middle;' />"+
                        	   					"<span>"+name+"<button type='button' name='sendBtn' onClick='poiDetail("+id+");'>상세보기</button></span>"+
                        	   				"</div>";*/
                        var lon = element.getElementsByTagName("noorLon")[0].childNodes[0].nodeValue;
                        var lat = element.getElementsByTagName("noorLat")[0].childNodes[0].nodeValue;

                        var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_' + index + '.png', size, offset); //마커 아이콘 설정
                        var lonlat = new Tmap.LonLat(lon, lat); //좌표설정 
                        marker = new Tmap.Marker(lonlat, icon); //마커생성
                        markerLayer.addMarker(marker); //마커레이어에 마커 추가

                        /*			popup = new Tmap.Popup("p1", lonlat, new Tmap.Size(120, 50), content, false);//마우스 오버 팝업
                        			popup.autoSize = true;//Contents 내용에 맞게 Popup창의 크기를 재조정할지 여부를 결정
                        		    map.addPopup(popup);//map에 popup추가
                        		    popup.hide();//마커에 마우스가 오버되기 전까진 popup을 숨김*/
                        //마커 이벤트등록
                        marker.events.register("click", popup, onOverMarker);
                        //마커에 마우스가 오버되었을 때 발생하는 이벤트 함수입니다.
                        function onOverMarker(evt) {
                            //this.show(); //마커에 마우스가 오버되었을 때 팝업이 보입니다. 
                            map.removeAllPopup();
                            poiDetail(id, se);
                        }
                        /*		    //마커 이벤트등록
                        		    marker.events.register("mouseout", popup, onOutMarker);
                        		    //마커에 마우스가 아웃되었을 때 발생하는 함수입니다.
                        		    function onOutMarker(evt) {
                        		      this.hide(); //마커에 마우스가 없을땐 팝업이 숨겨집니다.
                        		    }*/
                    });

                    //$("#searchResult").html(innerHtml);
                    map.zoomToExtent(markerLayer.getDataExtent()); //마커레이어의 영역에 맞게 map을 zoom합니다.
                },
                //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
                error: function(request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }


        // POI 상세 정보 API
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

/*                         var content = "<div style=' position: relative; border-bottom: 1px solid #dcdcdc; line-height: 18px; padding: 0 35px 2px 0;'>" +
                            "<div style='font-size: 14px; line-height: 15px;'>" +
                            "<p class='poptxt'>" + name + "\n" + "( " + address + " )</p>" +
                            "<button class='btn selectBtn' onclick='selectStart(" + lon + "," + lat + ",\"" + nameNaddress + "\")'>출발지로 선택</button>" +
                            "<button class='btn selectBtn' onclick='selectEnd(" + lon + "," + lat + ",\"" + nameNaddress + "\")'>도착지로 선택</button>" +
                            "</div>" +
                            "</div>"; */
                        
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

        function selectStart(lon, lat, nameNaddress) {
            //alert(lon + ',' + lat + ',' + nameNaddress);

            // 2. 기존 마커, 팝업 제거

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
            //var marker_s = new Tmap.Marker(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
            var marker_s = new Tmap.Marker(new Tmap.LonLat(lon, lat), icon);
            markerStartLayer.addMarker(marker_s); //마커 레이어에 마커 추가
            
            xy.startName = nameNaddress;
            xy.startX = lon;
            xy.startY = lat;
            
 /*           $('#startX').val(lon);
            $('#startY').val(lat);*/
            $('#p_start_info').val(nameNaddress);
            
        }

        function selectEnd(lon, lat, nameNaddress) {
//            alert(lon + ',' + lat + ',' + nameNaddress);

            // 2. 기존 마커, 팝업 제거
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
            
            xy.endName = nameNaddress;
            xy.endX = lon;
            xy.endY = lat;
            
/*            $('#endX').val(lon);
            $('#endY').val(lat);*/
            $('#p_end_info').val(nameNaddress);
        }


        function getRoute() {
            var headers = {};
            headers["appKey"] = "6d5877dc-c348-457f-a25d-46b11bcd07a9"; //실행을 위한 키 입니다. 발급받으신 AppKey(appKey)를 입력하세요.
            
            var data = JSON.stringify(xy);
            $('#p_XY').val(data);
            
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
                    
                    //alert('루트 불러오기 성공');
                    
                },
                //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
                error: function(request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    //alert('루트 불러오기 실패');
                    
                }
            });
        }
        

    </script>
<script>

var timezoneOffset = new Date().getTimezoneOffset() * 60000;
var timezoneDate = new Date(Date.now() - timezoneOffset); // 타임존을 반영한 현재 시각
 
//document.getElementById('p_time').value= new Date().toISOString().slice(0, 16);
$('#createPartyModal #p_time').val(timezoneDate.toISOString().slice(0, 16));

$(document).ready(function() {
	list();
});

var u_idx = $('#u_idx').val();

$('#createForm').submit(function() {
	
	var chk = false;
	if ($('#createPartyModal #p_XY').val().length<1) {
		alert('경로를 선택해주세요');
	}else if ($('#createPartyModal #p_capacity').val() == null || $('#createPartyModal #p_capacity').val()<2){
		alert('최대 인원은 2명부터 가능합니다!');
	}else{
		chk = true;
	}
	
	if(chk == true){
	 	$.ajax({
	 		url : 'party',
			type : 'POST',
			data : JSON.stringify({
				p_name : $('#createPartyModal #p_name').val(),
				p_content : $('#createPartyModal #p_content').val(),
				p_start_info : $('#createPartyModal #p_start_info').val(),
				p_end_info : $('#createPartyModal #p_end_info').val(),
				p_XY : $('#createPartyModal #p_XY').val(),
				p_time : $('#createPartyModal #p_time').val(),
				p_capacity : $('#createPartyModal #p_capacity').val(),
				p_password : $('#createPartyModal #p_password').val(),
				p_riding_km : $('#createPartyModal #p_riding_km').val(),
				p_riding_time : $('#createPartyModal #p_riding_time').val(),
				u_idx : u_idx
			}),
			contentType : 'application/json; charset=utf-8', //전달해줄 때 타입
			success : function() {
				location.href='party';
			}
		}); 
	}
	return false;
});

/* var prtcl2;
var markerStartLayer2; */


function viewDetail(sx,sy,ex,ey) {
	//alert('뷰디테일4');

	getRoute2(sx,sy,ex,ey);
}

function initTmap2() {
    // map 생성
    // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.								
    map2 = new Tmap.Map({
        div: 'map_div2', // map을 표시해줄 div
        //width: "100%", // map의 width 설정
        width: "766px", // 일단은 고정
        height: "400px", // map의 height 설정
    });
    map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점을 설정합니다.						

}


function getRoute2(sx,sy,ex,ey) {
	

    // 2. 기존 마커, 팝업 제거
    if (markerStartLayer2 != null) {
    	markerStartLayer2.clearMarkers();
    }
    if (markerEndLayer2 != null) {
    	markerEndLayer2.clearMarkers();
    }    
    if (routeLayer2 != null) {
        map2.removeLayer(routeLayer2);
        routeLayer2=null;
    }
	
    // 시작 마커 표시
    markerStartLayer2 = new Tmap.Layer.Markers("start"); //마커 레이어 생성
    map2.addLayer(markerStartLayer2); //map에 마커 레이어 추가

    var size = new Tmap.Size(24, 38); //아이콘 크기 설정
    var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
    var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset); //마커 아이콘 설정
    //var marker_s = new Tmap.Marker(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
    var marker_s2 = new Tmap.Marker(new Tmap.LonLat(sx, sy), icon);
    markerStartLayer2.addMarker(marker_s2); //마커 레이어에 마커 추가
    
    // 도착 마커 표시
    markerEndLayer2 = new Tmap.Layer.Markers("end"); //마커 레이어 생성
    map2.addLayer(markerEndLayer2); //map에 마커 레이어 추가

    var size = new Tmap.Size(24, 38); //아이콘 크기 설정
    var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
    var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset); //마커 아이콘 설정
    var marker_e2 = new Tmap.Marker(new Tmap.LonLat(ex, ey), icon);
    markerEndLayer2.addMarker(marker_e2); //마커 레이어에 마커 추가
    
    
    var headers = {};
    headers["appKey"] = "6d5877dc-c348-457f-a25d-46b11bcd07a9"; //실행을 위한 키 입니다. 발급받으신 AppKey(appKey)를 입력하세요.

    $.ajax({
        method: "POST",
        headers: headers,
        url: "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=xml", //보행자 경로안내 api 요청 url입니다.
        async: false,
        data: {
            //출발지 위경도 좌표입니다.
            startX: sx,
            startY: sy,
            //목적지 위경도 좌표입니다.
            endX: ex,
            endY: ey,
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
            
            prtcl2 = response;
           

            // 결과 출력
            var innerHtml = "";
            var prtclString2 = new XMLSerializer().serializeToString(prtcl2); //xml to String	
            xmlDoc = $.parseXML(prtclString2),
                $xml = $(xmlDoc),
                $intRate = $xml.find("Document");

            var distanceM = $intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue;
            var distanceKm = ($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue / 1000).toFixed(1);
            var ridingTimeMin = ((distanceKm/16)*60).toFixed(1);
            var tDistance = "<h5>총 거리 : " + distanceKm + "km,";
            var tTime = " 예상 시간 : 약 " + ridingTimeMin + "분</h5>";

            $("#result2").html(tDistance + tTime);

            prtcl2 = new Tmap.Format.KML({
                extractStyles: true,
                extractAttributes: true
            }).read(prtcl2); //데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
            routeLayer2 = new Tmap.Layer.Vector("route"); // 백터 레이어 생성
            //표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
            //벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
            routeLayer2.events.register("beforefeatureadded", routeLayer2, onBeforeFeatureAdded);

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

            routeLayer2.addFeatures(prtcl2); //레이어에 도형을 등록합니다.
            map2.addLayer(routeLayer2); //맵에 레이어 추가

            map2.zoomToExtent(routeLayer2.getDataExtent()); //map의 zoom을 routeLayer의 영역에 맞게 변경합니다.

            
        },
        //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
        error: function(request, status, error) {
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function list() {

	$.ajax({
		url : 'party/list',
		type : 'GET',
		async : false,
		success : function(data) {
			//alert(JSON.stringify(data));

			var html = '';
			for (var i = 0; i < data.length; i++) {
				var lock='';
				var ingYN='';
				var jsonObj = JSON.parse(data[i].p_XY);

				var startX = jsonObj['startX'];
				var startY = jsonObj['startY'];
				var endX = jsonObj['endX'];
				var endY = jsonObj['endY'];
				
				if(data[i].p_password.length>0){
					lock = '<i class="fas fa-lock"></i>';
				}
				if(data[i].p_start_time!=null){
					ingYN = ' <p class="ing"> [ 진행중 ]</p>';
				}
				html += '<div class="col-sm-6">\n';
				html += '<div class="card card-style">\n';
				html += '<div class="card-body">\n';
				html += '<h5 class="card-title">\n';
				html += '['+data[i].p_num+'] '+data[i].p_name + ' ( '+getUserCount(data[i].p_num)+' / '+data[i].p_capacity+' ) '+lock+ingYN+'\n'
				html += '</h5>\n';
				html += '<p class="card-text">\n';
				html += '<i class="fas fa-map-marked-alt"></i> 출발지 : '+data[i].p_start_info+'<br>\n';
				html += '<i class="fas fa-flag-checkered"></i> 목적지 : '+data[i].p_end_info+' <br>\n';
				html += '<i class="far fa-clock"></i> 모일 시간 : '+data[i].p_time_f+'<br>\n';
				html += '</p>\n';
				html += '<p class="card-text">'+data[i].p_content+'</p>\n';
				
				
				html += '<a href="#" class="btn mintbtn" data-toggle="modal" data-target="#partyDetailModal" onclick="viewDetail('+startX+','+startY+','+endX+','+endY+')"><i class="fas fa-info-circle"></i> 방 정보 보기</a>\n';
	
				// 오브젝트타입으론 넘어가지 않아 고생함
				//html += '<a href="#" class="btn mintbtn" data-toggle="modal" data-target="#partyDetailModal" onclick="viewDetail(\''+data[i].p_XY+'\')"><i class="fas fa-info-circle"></i> 방 정보 보기</a>\n';
				//html += '<a href="#" class="btn mintbtn" data-toggle="modal" data-target="#partyDetailModal" onclick="viewDetail('+jsonXY+')"><i class="fas fa-info-circle"></i> 방 정보 보기</a>\n';
				//html += '<a href="#" class="btn mintbtn" data-toggle="modal" data-target="#partyDetailModal" onclick="viewDetail('+stringXY+')"><i class="fas fa-info-circle"></i> 방 정보 보기</a>\n';
				//html += '<a href="#" class="btn mintbtn" data-toggle="modal" data-target="#partyDetailModal" onclick="viewDetail(\''+stringXY+'\')"><i class="fas fa-info-circle"></i> 방 정보 보기</a>\n';
				
				html += '<a href="#" onclick="joinchk('+data[i].p_num+','+getUserCount(data[i].p_num)+','+data[i].p_capacity+','+data[i].p_password+')" class="btn mintbtn"><i class="fas fa-child"></i> 참여하기!!</a>\n';
				html += '</div>\n';
				html += '</div>\n';
				html += '</div>';
			}

			$('#partyList').html(html);
		}

	});
}


function getUserCount(p_num) {
	var cnt=-2;
	$.ajax({
		url : 'party/room/'+p_num+'/usercount',
		type : 'GET',
		async : false,
		success : function(data) {
			cnt = data;
		}
	});
	return cnt;
}

function joinchk(p_num, cur_capacity, p_capacity, p_password) {
	var chkPass = false;
	var chkCapa = false;
	
	if (cur_capacity<p_capacity){
		chkCapa = true;
		
		if (typeof p_password == "undefined" || p_password == null || p_password == ""){
			chkPass = true;
		}else {
			var input_pw = prompt('암호가 있는 방입니다. 비밀번호를 입력해주세요!');
			if(p_password == input_pw){
				chkPass = true;
			}else if(typeof input_pw == "undefined" || input_pw == null || input_pw == "") {
				alert('취소하였습니다.');
			}else{
				alert('비밀번호가 틀렸습니다');
			}
		}
		
	}else {
		alert('인원이 모두 찼습니다!');
	}
	
	
	if (chkPass&&chkCapa){
		join(p_num);
	}
	
}

function join(p_num) {
  	 $.ajax({
		url : './party/room/'+p_num,
		type : 'POST',
		data : {
			u_idx : u_idx
		},
		success : function(data) {
			location.href='party';
		}
	});  
}

</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>