<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
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

<title>나의 코스 조회</title>

<style type="text/css">
.right {
	text-align: right;
}

.width {
	width: 60%;
}

.card-title {
	font-weight: bold;
	font-size: 22px;
}

.mintbtn {
	background-color: #21B2A6;
	color: #fefefe;
	width: 49%;
}

.card-style {
	box-shadow: 5px 5px 5px #dedede;
	padding: 20px;
	font-size: 16px;
	background-color: #efefef;
	color: #555555;
	margin: 15px 0;
	line-height: 35px;
}

.pages{
	width: 100px;
	margin: 0 auto;
}

.none-record-status{  
   padding: 50px 10px;
   margin: auto;
   ;
}

h3{
	font-weight: bold;
}
</style>

</head>

<body>

	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->
	<input type="text" id="u_idx" value="${loginInfo.u_idx}" style="display: none;"/>
	<div class="row mb-md-5" >
		<div class="list-group list-group-horizontal col-md-4 col-sm-12 mx-auto text-center" id="myList" role="tablist">
			<a class="list-group-item list-group-item-action" id="startRiding" data-toggle="list" href="#" role="tab">바로 시작</a> 
			<a class="list-group-item list-group-item-action" id="ridingGuide" data-toggle="list" id="ridingGuide" href="#" role="tab">라이딩 가이드</a> 
			<a class="list-group-item list-group-item-action active" id="myCourse" data-toggle="list" id="myCourse" href="#" role="tab">나의 코스</a>
		</div>
	</div>
	
	<!-- 컨테이너 시작 -->
	<div class="container">
			
			<h4 class="font-weight-bold pt-5 mb-4"><i class="fas fa-map-marked-alt"> 나의 코스</i></h4>
			<div class="page-info-text text-dark">나의 코스를 확인합니다.</div>
			<hr>
	
	    	<!--지도 표시-->
	   		<div id="map_div" style="width:500px;height:400px;"></div>
	
			<div id="myCourseListContainer">
	            <!-- myCourseList 시작 -->
	            <div id="myCourseList" class="row"></div>

			<div class="pages">
			    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
	            	<div id="pagingBox" class="btn-group mr-2" role="group" aria-label="First group">
	            	</div>
	           	</div>
			</div>
	            <br>
	            <input type="button" id="regModal" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#regMyCourseModal" onclick="chkMapExist()" value="나의 코스 등록">	
	            <!-- myCourseList 끝 -->				
			</div>
	   </div>

    <!-- 컨테이너 끝 -->
     <!-- 나의 코스 등록 시 모달 실행-->
    <!-- Modal 시작-->
    <div class="modal fade" id="regMyCourseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">      
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">나의 코스 등록하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="myCourse_name">코스 이름</label>
                        <input id="myCourse_name" name="p_name" type="text" placeholder="코스 이름" class="form-control" required="required">
                    </div>
					
					<div class="form-group">
                        <label for="map_Modal_div">출발지 / 목적지 설정</label>
                        <div>
                        	<i class="fas fa-flag"> 시작지점</i>
							<input type="text" id="startPoint" placeholder="출발지를 입력하세요">
							<button type="button" style="margin-top: -3px"  class="btn btn-primary btn-sm" onclick="searchPOIStart()"><i class="fas fa-search-location"> 검색</i></button>
						</div>
						<div>
							<i class="fas fa-flag-checkered"> 도착지점</i>
							<input type="text" id="endPoint" placeholder="도착지를 입력하세요"> 
							<button type="button" style="margin-top: -3px"  class="btn btn-primary btn-sm" onclick="searchPOIEnd()"><i class="fas fa-search-location"> 검색</i></button>
						</div>                      
                    </div>
                    
                    <div id="map_Modal_div"></div>
                    
                    <div class="form-group">
                        <label for="myCourse_descript">코스 설명</label>
                        <input id="myCourse_descript" name="p_content" type="text" placeholder="코스 설명" class="form-control" required="required">
                    </div>
                         
                </div>
				</form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" onclick="saveMyRoad()">코스 등록</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal 끝-->

    <!-- 나의 코스 수정 시 모달 실행-->
    <!-- Modal 시작-->
    <div class="modal fade" id="myCourseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">나의 코스 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="myCourse_editName">코스 이름</label>
                        <input id="myCourse_editName" name="p_name" type="text" placeholder="코스 이름" class="form-control" required="required">
                    </div>

                    <div class="form-group">
                        <label for="myCourse_editDescript">코스 설명</label>
                        <input id="myCourse_editDescript" name="p_content" type="text" placeholder="코스 설명" class="form-control" required="required">
                    </div>
                </div>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" onclick="changeMyCourse()">코스 수정</button>
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
	    
	    $('#regMyCourseModal').on('show.bs.modal', function(){
	    		initModalmap();
	    		/* modalMap.updateSize(); */
	    });
	    
        var path = 'http://15.164.162.21:8080/runbike';
        var u_idx = $('#u_idx').val();
        
      //전역변수
        var map;
      	var modalMap;
        var modalMarkersLayer, modalMarkerStartPointLayer, modalMarkerEndPointLayer, modalRouteLayer;
        var markerStartPointLayer, markerEndPointLayer, routeLayer;
        var tdata;
        var direct = new Object(); // startPoint와 endPoint 값을 저장하고 있는 경로 객체
        var tDistance; //거리
        var tTime //소요시간
        var tDistance; //거리
        var tTime //소요시간
        var startPointChk = 0;
        var endPointChk = 0;
        var chkMap = 0;
        var my_mc_idx;
        
        //페이지가 로딩이 된 후 호출하는 함수입니다.
        function initTmap() {
            //map 생성
            //Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
            map = new Tmap.Map({
                div: 'map_div',
                width: '100%',
                height: '400px',
                animation: false
            }); 
            
          //마커 레이어 생성합니다.
            markerStartPointLayer = new Tmap.Layer.Markers(); //시작포인트를 표시하는 레이어
            markerEndPointLayer = new Tmap.Layer.Markers(); // 끝포인트를 표시하는 레이어
            routeLayer = new Tmap.Layer.Vector("route"); // 루트를 표시하는 백터 레이어 생성

            //map에 마커 레이어들을 추가합니다.
            map.addLayer(markerStartPointLayer);
            map.addLayer(markerEndPointLayer);
        };

		function getTotalPage(){
			$.ajax({
				url: path + '/myCourse/totalPage/' + u_idx,
				type: 'GET',
				success: function(data){
					
					var totalPage = data;
					
					var html = '';				
					
					for(var i = 1; i <= data; i++){
						html += '<button type="button" class="btn btn-secondary" onclick="list('+ i +')">';
						html += i;
						html += '</button>';
					}
					
					$('#pagingBox').html(html);
				}				
			});
			
			
		}
		
        function list(currentPageNumber) {
        	    	
            $.ajax({
                url: path + '/myCourse/' + currentPageNumber,
                type: 'GET',
                success: function(data) {
	
                    var html = '';
                    
					if(data==""){
						html += '<div class="none-record-status">\n';
		                html += '<h3><i class="fas fa-exclamation-triangle"> 아직 등록된 나의 코스가 없습니다.</i></h3>';
		                html += '</div>';
					} else{
						
                    for (var i = 0; i < data.length; i++) {

                        var mc_idx = data[i].mc_idx;
                        var mc_startPoint_lon = data[i].mc_startPoint_lon;
                        var mc_startPoint_lat = data[i].mc_startPoint_lat;
                        var mc_endPoint_lon = data[i].mc_endPoint_lon;
                        var mc_endPoint_lat = data[i].mc_endPoint_lat;
                        var mc_name = data[i].mc_name;
                        var mc_descript = data[i].mc_descript;
                        var mc_distance = data[i].mc_distance;
                        var mc_time = data[i].mc_time;

                        var startPoint = reverseGeo(mc_startPoint_lon, mc_startPoint_lat);
                        var endPoint = reverseGeo(mc_endPoint_lon, mc_endPoint_lat);
                        html += '<div class="col-sm-6">\n';
                        html += '<a href="#" style="text-decoration:none" onclick="showRoute(' + mc_startPoint_lon + ',' + mc_startPoint_lat + ',' + mc_endPoint_lon + ',' + mc_endPoint_lat + ')">\n';
                        html += '<div class="card-style" id="card">\n';
                        html += '<div class="card-body">\n';
                        html += '<h5 class="card-title">\n';
                        html += mc_name;
                        html += '<div style="float: right;">'
                        html += '<i class="far fa-star">&nbsp;</i>'
                        html += '<i class="fas fa-share-alt-square"></i>';
                        html += '</div>'
                        html += '</h5>\n';
                        html += '<p class="card-text">\n';
                        html += '<i class="fas fa-flag"> 출발지 &nbsp;&nbsp;</i>'  + startPoint;
                        html += '<br>\n';
                        html += '<i class="fas fa-flag-checkered"> 목적지 &nbsp;&nbsp;</i>' + endPoint;
                        html += '<br>\n';
                        html += '<i class="fas fa-road"> 코스 길이 &nbsp;&nbsp;</i>' + mc_distance + 'km';
                        html += '<br>\n';
                        html += '<i class="fas fa-hourglass-half"> 예상 시간 &nbsp;&nbsp;</i>' + mc_time +'분'; 
                        html += '<br>\n';
                        html += '<i class="fas fa-comment-dots"> 코스 설명 &nbsp;&nbsp;</i>' + mc_descript;
                        html += '<br>\n';
                                                
                        html += '<button type = "button" onclick="save_mc_idx(' + mc_idx + ')" class = "btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#myCourseModal">수정</button>\n';
                        html += '<button type = "button" onclick="deleteMyCourse(' + mc_idx + ')" class = "btn btn-secondary btn-lg btn-block" >삭제</button><br>';
                        
                  
                        html += '</div>\n';
                        html += '</div>\n';
                        html += '</a>\n'
                        html += '</div>';
                    	}
					}
                    $('#myCourseList').html(html);
                }
            });
        }

        /*************************************카드를 누르면 지도에 마커와 루트 표시******************************************/
        function showRoute(mc_startPoint_lon, mc_startPoint_lat, mc_endPoint_lon, mc_endPoint_lat) {
            setStartPoint(mc_startPoint_lon, mc_startPoint_lat);
            setEndPoint(mc_endPoint_lon, mc_endPoint_lat);
            findRoad(mc_startPoint_lon, mc_startPoint_lat, mc_endPoint_lon, mc_endPoint_lat);
        }


        /*********************************************startPoint의 Marker를 변경************************************************/
        function setStartPoint(lon, lat) {

            //기존에 등록했던 startPointMarker 삭제
            markerStartPointLayer.clearMarkers();

            var startPoint = new Tmap.LonLat(lon, lat);

           

            map.addLayer(markerStartPointLayer); //map에 마커 레이어 추가

            var size = new Tmap.Size(24, 38); //아이콘 크기 설정
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
            var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset); //마커 아이콘 설정
            var marker_s = new Tmap.Marker(startPoint, icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
            markerStartPointLayer.addMarker(marker_s); //마커 레이어에 마커 추가

        }

        /*********************************************ndPoint의 Marker를 변경************************************************/
        function setEndPoint(lon, lat) {

            //기존에 등록했던 endPointMarker 삭제
            markerEndPointLayer.clearMarkers();

            var endPoint = new Tmap.LonLat(lon, lat);

           

            map.addLayer(markerEndPointLayer); //map에 마커 레이어 추가

            var size = new Tmap.Size(24, 38); //아이콘 크기 설정
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
            var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset); //마커 아이콘 설정
            var marker_e = new Tmap.Marker(endPoint, icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
            markerEndPointLayer.addMarker(marker_e); //마커 레이어에 마커 추가
        }

        /********************************************티맵 경로찾기***********************************************************/
        function findRoad(startPoint_lon, startPoint_lat, endPoint_lon, endPoint_lat) {

            routeLayer.setVisibility(true);
            
            var startX = startPoint_lon;
            var startY = startPoint_lat;
            var endX = endPoint_lon;
            var endY = endPoint_lat;

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
                    var innerHtml = "";
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

        /********************************************나의 코스를 수정************************************************/
        function save_mc_idx(mc_idx){
        	my_mc_idx = mc_idx;
        }
        
        function changeMyCourse() {

            var mc_idx = my_mc_idx;
            var myCourse_editName = $('#myCourse_editName').val();
            var myCourse_editDescript = $('#myCourse_editDescript').val();
            
            if(myCourse_editName==""){
            	alert('코스 이름을 입력해주세요!');
            }else{
                $.ajax({
                    url: path + '/myCourse',
                    type: 'PUT',
                    data: JSON.stringify({
                    	mc_idx: mc_idx,
                        mc_descript: myCourse_editDescript,
                        mc_name: myCourse_editName,
                    }),
                    contentType: 'application/json; charset=utf-8',
                    success: function(data) {

                        if (data == "success") {
                            alert('수정되었습니다.');
                            location.reload();
                        }
                    },
                    error: function(e) {
                        alert('error!');
                    }
                });
            }
        }

        /********************************************나의 코스를 삭제************************************************/
        function deleteMyCourse(mc_idx) {
            var result = confirm('삭제하시겠습니까?');

            if (result) {

                $.ajax({
                    url: path + '/myCourse/' + mc_idx,
                    type: 'DELETE',
                    success: function(data) {
                        if (data == "success") {
                            alert('삭제되었습니다.');
                        }
                    },
                    error: function(e) {
                        alert('error!');
                    }
                });
            } else {
                alert('취소되었습니다!');
            }
            location.reload();
        }
		
        /******************!!!!!!!!!!!!!모달 관련 스크립트!!!!!!!!!!!!!!!!!****************************/
        function chkMapExist(){
        	if(chkMap==1){
        		modalMap.destroy();
        	}
        }
        
        function initModalmap() {
        	
        	chkMap = 1;
        	
            //map 생성
            modalMap = new Tmap.Map({
                div: 'map_Modal_div',
                width: '430px',
                height: '400px',
                animation: false
            });
                     
            
            //마커 레이어 생성합니다.
            modalMarkersLayer = new Tmap.Layer.Markers(); //검색 시 위치들을 표시하는 레이어 
            modalMarkerStartPointLayer = new Tmap.Layer.Markers(); //시작포인트를 표시하는 레이어
            modalMarkerEndPointLayer = new Tmap.Layer.Markers(); // 끝포인트를 표시하는 레이어
            modalRouteLayer = new Tmap.Layer.Vector("route"); // 루트를 표시하는 백터 레이어 생성

            //map에 마커 레이어들을 추가합니다.
            modalMap.addLayer(modalMarkersLayer);
            modalMap.addLayer(modalMarkerStartPointLayer);
            modalMap.addLayer(modalMarkerEndPointLayer);
        }
        
        //검색 시에 마커를 찍는 함수입니다.
        function addMarker(options) {

            var size = new Tmap.Size(12, 19); //아이콘 크기입니다.
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점입니다.
            var icon = new Tmap.Icon("http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_s_simple.png", size, offset); //마커 아이콘입니다.
            var markers = new Tmap.Markers(options.lonlat, icon); //마커를 생성합니다.
            modalMarkersLayer.addMarker(markers); //레이어에 마커를 추가합니다.

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
                "<input type=\"button\" id=\"startBtn\" onclick=\"modalSetStartPoint(" + lon + "," + lat + ")\" value=\"출발\">" +
                "<input type=\"button\" id=\"endBtn\" onclick=\"ModalSetEndPoint(" + lon + "," + lat + ")\"value=\"도착\">" +
                "</span>" +
                "</div>" +
                "</div>";

            var popup = new Tmap.Popup("p1", options.lonlat, new Tmap.Size(120, 50), content, true);
            popup.setBorder("1px solid #8d8d8d"); //popup border 조절
            popup.autoSize = true; //popup 사이즈 자동 조절		                         
            modalMap.addPopup(popup); //map에 popup 추가
            popup.hide();

            markers.events.register("click", popup, onOverMarker);
            //마커를 클릭했을 때 발생하는 이벤트 함수입니다.
            function onOverMarker(evt) {
                this.show(); //마커를 클릭하였을 때 팝업이 보입니다.
                options.select = 1;

            }

            modalMap.events.register("mouseup", popup, onOutMarker);
            //지도를 클릭했을 때 발생하는 이벤트 함수입니다.
            function onOutMarker(evt) {
                this.hide(); //지도를 클릭하였을 때 팝업이 사라집니다.
                options.select = 0;
            }

        }

        //데이터 로드가 섬공적으로 완료 되었을 때 발생하는 함수입니다.
        function onCompleteTData(e) {

        	modalMarkersLayer.clearMarkers(); //시작지점 선택 마커들 전체 삭제합니다.
        	modalMarkersLayer.setVisibility(true); //시작지점의 레이어를 다시 보이게 한다. 

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
                        select: 0
                    };
                    addMarker(options); //위에서 만들어 놓은 마커를 등록하는 함수 실행합니다.
                });
            }
            modalMap.zoomToExtent(modalMarkersLayer.getDataExtent()); //map의 zoom을 마커 레이어의 해상도에 맞게 변경합니다.
        }



        /*********************************************StartPoint를 direct에 저장하고, startPoint의 Marker를 변경************************************************/
        function modalSetStartPoint(lon, lat) {

            //기존에 등록했던 startPointMarker 삭제
            modalMarkerStartPointLayer.clearMarkers();

            var startPoint = new Tmap.LonLat(lon, lat);

            //startPoint의 좌표를 direct 객체에 저장
            direct.startPoint = startPoint;


            //출발지 선택 버튼을 눌렀을 때, modalMarkerStartPointLayer 감추기
            modalMarkersLayer.setVisibility(false);

            ///출발지 선택 버튼을 눌렀을 때, modalMarkerStartPointLayer 등록
            modalMap.addLayer(modalMarkerStartPointLayer); //map에 마커 레이어 추가

            var size = new Tmap.Size(24, 38); //아이콘 크기 설정
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
            var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset); //마커 아이콘 설정
            var marker_s = new Tmap.Marker(startPoint, icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
            modalMarkerStartPointLayer.addMarker(marker_s); //마커 레이어에 마커 추가
	
            startPointChk = 1;
            
            if(endPointChk == 1 && startPointChk == 1){
         	   modalFindRoad();
            }     
        }

        /***********************************************************************StartPoint를 검색하는 함수!!!!!*********************************************************/
        function searchPOIStart() {

        	direct.startPoint = null;
        	
        	startPointChk = 0;
        	
            //기존 startPoint로 지정했던 마커를 삭제한다.
            modalMarkerStartPointLayer.clearMarkers();

            //기존 루트레이어는 안보이게 처리
            modalRouteLayer.setVisibility(false);

            var startPoint = $('#startPoint').val();

            if (startPoint == "") {
                alert("출발지를 입력해주세요.")
            } else {
                tdata = new Tmap.TData(); //REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.
                tdata.events.register("onComplete", tdata, onCompleteTData); //데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트입니다.
                var center = modalMap.getCenter(); //map의 중심 좌표 값을 받아 옵니다.
                //POI 검색 데이터를 콜백 함수를 통해 XML로 리턴
                tdata.getPOIDataFromSearch(encodeURIComponent(startPoint), {
                    centerLon: center.lon,
                    centerLat: center.lat,
                    reqCoordType: "EPSG3857",
                    resCoordType: "EPSG3857"
                }); //encodeURIComponent함수로 해당 파라메터 값을 처리합니다.
            }
        }

        /*********************************************StartPoint를 direct에 저장하고, startPoint의 Marker를 변경************************************************/
        function ModalSetEndPoint(lon, lat) {

            //기존에 등록했던 endPointMarker 삭제
            modalMarkerEndPointLayer.clearMarkers();

            var endPoint = new Tmap.LonLat(lon, lat);

            //endPoint의 좌표를 direct 객체에 저장
            direct.endPoint = endPoint;

            //
            //도착지 선택 버튼을 눌렀을 때, markersEndLayer 감추기
            modalMarkersLayer.setVisibility(false);

            modalMap.addLayer(modalMarkerEndPointLayer); //map에 마커 레이어 추가

            var size = new Tmap.Size(24, 38); //아이콘 크기 설정
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
            var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset); //마커 아이콘 설정
            var marker_e = new Tmap.Marker(endPoint, icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
            modalMarkerEndPointLayer.addMarker(marker_e); //마커 레이어에 마커 추가
            
           endPointChk = 1;
            
           if(endPointChk == 1 && startPointChk == 1){
        	   modalFindRoad();
           }           
        }

        /***********************************************************************EndPoint를 검색하는 함수!!!!!*********************************************************/
        function searchPOIEnd() {

			direct.endPoint = null;
        	
        	endPointChk = 0;
        	
            //기존 startPoint로 지정했던 마커를 삭제한다.
            modalMarkerEndPointLayer.clearMarkers();

            //기존 루트레이어는 안보이게 처리
            modalRouteLayer.setVisibility(false);

            var endPoint = $('#endPoint').val();

            if (endPoint == "") {
                alert("도착지를 입력해주세요.")
            } else {
                tdata = new Tmap.TData(); //REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.
                tdata.events.register("onComplete", tdata, onCompleteTData); //데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트입니다.
                var center = modalMap.getCenter(); //map의 중심 좌표 값을 받아 옵니다.
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
        function modalFindRoad() {

        	modalRouteLayer.setVisibility(true);

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

                	modalRouteLayer.removeAllFeatures();

                    prtcl = response;

                    // 결과 출력
                    var innerHtml = "";
                    var prtclString = new XMLSerializer().serializeToString(prtcl); //xml to String	
                    xmlDoc = $.parseXML(prtclString),
                        $xml = $(xmlDoc),
                        $intRate = $xml.find("Document");

                    tDistance = ($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue / 1000).toFixed(1); //총 거리(km)
                    tTime = ($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue / 60).toFixed(0); //총 시간(분)

                    console.log("거리: " + tDistance + ",시간: " + tTime);

                    prtcl = new Tmap.Format.KML({
                        extractStyles: true,
                        extractAttributes: true
                    }).read(prtcl); //데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.

                    //표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
                    //벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
                    modalRouteLayer.events.register("beforefeatureadded", modalRouteLayer, onBeforeFeatureAdded);

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

                    modalRouteLayer.addFeatures(prtcl); //레이어에 도형을 등록합니다.
                    modalMap.addLayer(modalRouteLayer); //맵에 레이어 추가

                    modalMap.zoomToExtent(modalRouteLayer.getDataExtent()); //map의 zoom을 routeLayer의 영역에 맞게 변경합니다.
                },
                //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
                error: function(request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }

        /********************************************나의 코스 좌표 및 이름, 설명 저장***********************************************************/

        function regMyCourse() {

            var path = 'http://15.164.162.21:8080/runbike';
			
            $.ajax({
                url: path + '/myCourse',
                type: 'POST',
                data: {
                    mc_distance: tDistance,
                    mc_time: tTime,
                    mc_startPoint_lon: direct.startPoint.lon,
                    mc_startPoint_lat: direct.startPoint.lat,
                    mc_endPoint_lon: direct.endPoint.lon,
                    mc_endPoint_lat: direct.endPoint.lat,
                    mc_descript: $('#myCourse_descript').val(),
                    mc_name: $('#myCourse_name').val()
                },
                success: function(data) {
                    if (data == "success") {
                        var myCourse = alert('나의 코스에 저장되었습니다.');
                        location.reload();
                    }
                }
            });
        }
        
      //나의 코스를 눌렀을 때 일어나는 함수
	    function saveMyRoad(){
			
    	  	if($('#myCourse_name').val()==""){
    	  		alert('코스이름을 지정해주세요!');
    	  	}
    	  	else if(startPointChk==0){
	    		alert('출발지를 지정해주세요!')
	    	}
    	  	else if(endPointChk==0){
	    		alert('도착지를 지정해주세요!');
    	  	}
	    	
	    	else{
	    		regMyCourse();
	    	}
	    }

        
        //Map 시작!!!!!!!!!!!
        $(document).ready(function() {
            initTmap();
            list(1);            
            getTotalPage();
            
	        //모달값 초기화
	        $('#regMyCourseModal').on('hidden.bs.modal', function (e) {
	           for(var i = 0; i < 2; i++){
	            	$(this).find('form')[0].reset();
	            }  
	        });
	        
	      //모달값 초기화
	        $('#myCourseModal').on('hidden.bs.modal', function (e) {
	            $(this).find('form')[0].reset();
	        });  
        });

    </script>
    
    <!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->
</body>

</html>
