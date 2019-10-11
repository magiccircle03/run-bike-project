<%@page import="com.teamrun.runbike.party.domain.PartyInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>같이 달리기 : 현재 정보</title>
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
.title{
	margin:20px 0;
}
.marginTop{
	margin-top: 20px;
	margin-bottom: 20px;
}
#map_div{
	bottom: 0px;
	position: relative;
}
@media ( max-width: 768px ){
	h3{font-size:1.2em;}
	.title{font-size:1.1em;margin:10px 0;}
	.marginTop{
	margin-top: 10px;
	margin-bottom: 10px;
	}
}

body{
	color : #333333;
}
.btnHeight{
	margin-top: 20px;
	height: 50px;
}
.mint{
	background-color: #21B2A6;
	color: #fefefe;
	border-color: #1F9E93;
	font-weight: bold;
}
.mint:hover{
	background-color: #1F9E93;
	color: #fefefe;
}
.ready{
	background-color: #21B2A6;
	color: #fefefe;
	font-weight: bold;
}

.master{
	display: none;
}
.dispalyNone{
	display: none;
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

.allEnd{
	font-weight: bold;
	background-color: #007BFF;
	color: #fefefe;
}
.ban{
	text-decoration: none;
	display : inline-block;
	padding-left: 5px;
}
.ban:hover{
	cursor: pointer;
}
.fa-times{
	color: #B84A5B;
}

.StartP{
	display : inline;
	color: red;
}
.red{
	color: #FD5314;
}
.blue{
	color: #007BFF;
}
.font-size-18{
	font-size: 1.1em;
}
.gray{
	color: #555555;
}
.black{
	background-color: #333333;
	color: #fefefe;
}
.black:hover{
	background-color: #555555;
	color: #fefefe;
	font-weight: bold;
}

#divArea{
	height: 500px;
}

#partyUserInfoIng{
	background-color : rgba(0,50,100,.5);
	color : #fefefe;
	position: relative;
	z-index:999;
	bottom:0px;
	top:-120px;  
}

.lightgray{
	color : #bcbcbc;
}

.width100{
	width: 100%;
}
.partyUserImg{
	width: 40px;
	height: 40px;
	
}
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

<div class="container">

	<!-- 숨겨진 u_idx -->
	<input id="u_idx" name="u_idx" type="hidden" class="form-control" value="${loginInfo.u_idx}">
	
	<!-- 같이하기 내비게이션 -->
	<ul class="nav nav-pills nav-justified">
	  <li class="nav-item">
	    <a class="nav-link" href="<c:url value='/party/${partyInfo.p_num}' />">방정보</a>
	  </li>
	  
	  <li class="nav-item">
	    <a id="curInfoA" class="nav-link active" href="<c:url value='./ing' />">현재정보</a>
	  </li>
	  
	  <li class="nav-item">
	    <a class="nav-link" href="<c:url value='./chat' />">채팅</a>
	  </li>
	</ul>
	
	<hr>

	<div>
	 	<!-- 파티 현재 정보 영역 시작-->
	    <div id="partyInfo">
	    	    <h3 id="partyTitle" class="marginTop"> [${partyInfo.p_num}] ${partyInfo.p_name} <span id="startStat" class="StartP"></span></h3>
	    	    <h4 class="title"><i class="fas fa-biking blue"></i>&nbsp; 우리가 달리고 있는 길 : ${partyInfo.p_start_info_short} ~ ${partyInfo.p_end_info_short}</h4>
	    	    <div id="divArea">
		    	    <div id="map_div">
		    	    </div>
		    	    <div id="partyUserInfoIng">
			  	 	<!-- 참가자 사진 / 이름 / 상태-->
					</div>
				</div>
	    </div> <!-- /partyInfo-->
	
		<hr> <!-- ================================================== -->
	     
	    <!-- 끝내기 -->
	   	<div id="endArea" style="display:none;">
	  	 	<button id="endBtn" class="btn width100 black btnHeight" onclick="getDistanceCE()">종료하기</button>
	  	</div>
	    	
	   	<!-- 방장만 보이게 영역 -->
		<div class="master">
		   	<button id="endBtnMaster" class="btn width100 btnHeight" onclick="endRidingMaster()" disabled="true">전체 라이딩 종료하기!</button>
		</div>
		<!-- /방장만 보이게 영역 -->
	</div>

</div><!-- 컨테이너 끝 -->

<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->

<script>

var xy=${partyInfo.p_XY};
var p_num = ${partyInfo.p_num};
var u_idx = $('#u_idx').val();// 아이디 값 세션에서 가져오기. 

$(document).ready(function() {
	initTmap(xy);
	chkIsStarted();
	showPartyUserList();
	showMasterArea();
	showEndArea();
	showCurrentPos();
});

/* 직선 거리를 계산하는 함수 */
function getDistanceCE() {
	navigator.geolocation.getCurrentPosition(function(pos) {
		var distanceCE;
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    //alert("내 현재 위치는 : " + latitude + ", "+ longitude);
	    lonlat = new Tmap.LonLat(longitude, latitude).transform("EPSG:4326", "EPSG:3857");//좌표 설정
		 //직선거리 계산
		$.ajax({
			method:"GET",
			url:"https://apis.openapi.sk.com/tmap/routes/distance?version=1&format=xml",//직선거리 계산 api 요청 url입니다.
			async:false, 
			data:{
				//시작 지점 위경도 좌표입니다.
				"startX" : lonlat.lon,
				"startY" : lonlat.lat,
				//끝 지점 위경도 좌표입니다. 
				"endX" : xy.endX,
				"endY" : xy.endY,
				//입력하는 좌표계 유형을 지정합니다.
				"reqCoordType" : "EPSG3857",
				//실행을 위한 키 입니다. 발급받으신 AppKey(appKey)를 입력하세요.
				"appKey" : "6d5877dc-c348-457f-a25d-46b11bcd07a9"
			},
			//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
			success:function(response){
				prtcl = response;
				
				var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
			    xmlDoc = $.parseXML( prtclString ),
			    $xml = $( xmlDoc ),
			    $intRate = $xml.find("distanceInfo");
				var distance = $intRate[0].getElementsByTagName("distance")[0].childNodes[0].nodeValue;
				
				endRidingOne(distance<=300); // 직선거리가 300m이내인지 여부를 넘겨준다
				
			},
			//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
}

/* 개인이 라이딩을 종료하는 함수 */
function endRidingOne(chk){
	// 현재 위치가 도착지 좌표 반경 300m 이내면, 완주여주 Y / 아니면 N //중도 포기하겠냐고 물어봄
	if(chk){
		updateEnd('Y'); // 완주여부 Y, end여부 Y로 업데이트
	}else{
		if (confirm('아직 도착지에 도착하지 않았습니다. 중도 포기하시겠습니까?')) {
			updateEnd('N'); // 완주여부 N, end여부 Y로 업데이트
		}
	}
	alert('라이딩을 종료하였습니다!');
	$('#endArea').css('display','none');
}

/* 라이딩종료 시, 완주 여부와 함께 컬럼 업데이트 */
function updateEnd(finishYN) {
 	$.ajax({
		url : '../../party/'+p_num+'/finishOne',
		type : 'POST',
		data : {
			u_idx : u_idx,
			finishYN : finishYN
		},
		success : function(data) {
			showPartyUserList();
		}
	}); 
}

/* 파티 전체 라이딩 종료 */
function endRidingMaster(){
	if(confirm('라이딩을 종료하고 파티를 해산할까요?')){
		// 종료시간과 사용가능한 방 여부 업데이트하기
		$.ajax({
	 		url : '../../party/room/'+p_num,
	  		type : 'PUT',
	  		data : JSON.stringify({
	  			p_num : p_num 
	 		}),
	 		contentType : 'application/json; charset=utf-8',
	 		success : function() {
	 			endRidingGreet();
	 		}
	 	}); 
	}
}

/* 종료인사와 보내주기 */
function endRidingGreet() {
	alert('종료합니다! 수고하셨습니다!');
	location.href="../../party";
}

/* 모든 사람이 라이딩을 끝내면 전체종료 버튼 활성화 */
function isAllEnd(){
	var cnt = -2;
	$.ajax({
	 		url : '../../party/room/'+p_num+'/notEndUsercount',
	 		type : 'GET',
			async : false,
	 		success : function(data) {
	 			cnt = parseInt(data);
	 		}
	 }); 
	 
	 if(cnt==0){
		 $('#endBtnMaster').attr('disabled', false);
		 $('#endBtnMaster').addClass('allEnd');
	 }
}

/* 진행중이면 진행중 표시해주는 함수 */
function chkIsStarted() {
	$.ajax({
		url : '../../party/room/' + p_num,
		type : 'GET',
		success : function(data) {
			if(data.p_start_time!=null){
				$('#beforeStartArea').addClass( 'dispalyNone' );
				$('#startStat').html(' [ 라이딩 진행중 ]');
			}else{
				$('#beforeStartArea').addClass( 'dispalyBlock' );
				$('#startStat').html(' [ 대기중 ]');
			}
		}
	});
} 

/* 참여중인 유저 수 구하는 함수 */
function getUserCount() {
	var cnt=-2;
	$.ajax({
		url : '../../party/room/'+p_num+'/usercount',
		type : 'GET',
		async : false,
		success : function(data) {
			cnt = data;
		}
	});
	return cnt;
}

/* 달리기중인 유저의 정보를 가져온다 */
function showPartyUserList() {
	$.ajax({
		url : '../../party/room/'+p_num+'/user',
		type : 'GET',
		success : function(data) {
			
			html1='';
			html1+='<table style="width:100%;">\n';
			for (var i = 0; i < data.length; i++) {
				var crown=''; 
				var bold='';
				var readyStr='';
				var delBtn='';
				
				if(data[i].pc_masterYN=='Y'){
					crown='<i class="fas fa-crown yellow"></i> ';
					
				}else{
 					if(isMaster()){
 						crown='<a href="#" onclick="changeMaster('+data[i].u_idx+')"><i class="fas fa-user-alt lightgray" style="padding-left:2px;padding-right:2px;"></i></a> '; 
 						delBtn='<a onclick="ban('+data[i].u_idx+')" class="ban"><i class="fas fa-times"></i></a>';
 					}else{
						crown='<i class="fas fa-user-alt lightgray" style="padding-left:2px;padding-right:2px;"></i> '; 
					}
				}
				
				// 자신은 굵은 글씨로 표시된다
				if(data[i].u_idx==u_idx){
					bold='bold';
				}
				
				if(data[i].pc_endYN=='Y'){
					if(data[i].pc_finishYN=='Y'){
						readyStr='<p class="">[★ 완주★] 라이딩 종료!</p>';
					}else{
						readyStr='<p class="">중도 포기</p>';
					}
				}else{
					readyStr='<p class="">열심히 달리는 중...</p>';
				}
				
				
				html1+='<tr>\n';
				html1+='<td class="width30"><img class="partyUserImg" src="${pageContext.request.contextPath}/uploadfile/userphoto/'+data[i].u_photo+'"></td>\n';
				html1+='<td class="width30 '+bold+'">' + crown + data[i].u_name + delBtn + '</td>\n';
				html1+='<td class="width30">'+readyStr+'</td>\n';
				html1+='</tr>\n';
				
			}
			html1+='</table>\n';
			$('#partyUserInfoIng').html(html1);
			
		}

	});
}

/* 내가 파티를 나간다 */
function exitPartyFn() {

	if(isMaster()){
		if(getUserCount()<2){
			if(confirm('인원이 1명일 때 나가면 방이 삭제됩니다. 방에서 나가시겠습니까?')){
				exitParty(u_idx);
				deleteParty();// 방삭제
			}
		}else{
			alert('방장은 나갈 수 없습니다! 나가고 싶다면, 방장을 위임해주세요');
		}
	}else{
		if(confirm('현재 참여한 방에서 나가시겠습니까?')){
			exitParty(u_idx); // 현재 로그인된 유저를 얌전히 보내준다
		}
	}
}
	
/* 해당 유저를 참여테이블에서 delete 하는 함수 */
function exitParty(idx) {

 	 $.ajax({
 		url : '../../party/room/'+p_num,
 		type : 'DELETE',
 		data : JSON.stringify({
 			u_idx : idx
		}),
		contentType : 'application/json; charset=utf-8',
 		success : function(data) {
 			location.href="../../party";
 		}
 	});
}

/* 방장 여부 체크 */
function isMaster() {
	var master = 0;
	var chk = false;
	 $.ajax({
	 		url : '../../party/room/'+p_num+'/master',
	 		type : 'GET',
			async : false,
	 		success : function(data) {
	 			master = parseInt(data);
	 			//alert(master);
	 			chk = (master==u_idx);
	 			//alert(chk);
	 		}
	 }); 
	
	return chk;
}

/* 방장이면 보이게 */
function showMasterArea() {
  	if (isMaster()) {
		$('.master').css('display','block');
	}
	else{
		$('.master').css('display','none');
	}  
}

/* 종료 여부에 따라 종료영역 보여주고 숨기기 */
function showEndArea() {

  	if (isEnd()) {
		$('#endArea').css('display','none');
	}
	else{
		$('#endArea').css('display','block');
	}  
	 
}

/* 현재 유저가 라이딩을 종료했는지 */
function isEnd() {
	var chk = false;
	 $.ajax({
	 		url : '../../party/room/isEnd',
	 		type : 'GET',
			async : false,
			data : {
				u_idx : u_idx,
				p_num : p_num
			},
	 		success : function(data) {
	 			//alert(data);
				if(data=='Y'){
					chk=true;
				}
	 		}
	 }); 
	return chk;
}

/* 방장을 위임하는 함수 */
function changeMaster(u_idx_t){ // 타겟 유저의 idx를 받는다
	if (confirm('방장을 위임하시겠습니까?')) {
	 	 $.ajax({
		 	url : '../../party/room/'+p_num+'/master',
	  		type : 'PUT',
	  		data : JSON.stringify({
	  			u_idx_t : u_idx_t 
	 		}),
	 		contentType : 'application/json; charset=utf-8',
	  		success : function(data) {
	  			alert(data); // 방장 위임 결과를 띄워줌
	  			showMasterArea();
	  		}
	  		
	  	});
	}
}

/* 회원정보 계속 업데이트( 현재 위치 및 유저정보 바로 반영) */
var refreshReady = setInterval(function() {
		showPartyUserList();
		showCurrentPos();
		isAllEnd();
}, 1000);

/* 강퇴 */
function ban(idx) {
	if (confirm('해당 유저를 내보낼까요?')) {
		exitParty(idx+"");
		alert('내보냈습니다!');
	}
}

/* 맵 초기화 */
function initTmap(xy) {
	
    // map 생성
    // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.								
    map = new Tmap.Map({
        div: 'map_div', // map을 표시해줄 div
        width: "100%", // map의 width 설정
        height: "500px", // map의 height 설정
    });

    navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    var lonlat = new Tmap.LonLat(longitude, latitude).transform("EPSG:4326", "EPSG:3857");//좌표 설정
	    map.setCenter(lonlat, 17); 
	});
    getRoute(xy);
    showCircle(xy);

}

/* 도착지 주변에 원을 뿌려준다 */
function showCircle(xy) {
	//원
	var vector_layer = new Tmap.Layer.Vector('Tmap Vector Layer'); // 백터 레이어 생성
	map.addLayers([vector_layer]); // 지도에 백터 레이어 추가
	
	var circle = new Tmap.Geometry.Circle(xy.endX, xy.endY, 300); // 원 생성
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

}

/* 현재위치 보여주는 함수 */
function showCurrentPos(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    
		markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
		map.addLayer(markerLayer);//map에 마커 레이어 추가
		   
		var lonlat = new Tmap.LonLat(longitude, latitude).transform("EPSG:4326", "EPSG:3857");//좌표 설정
		var size = new Tmap.Size(24, 38);//아이콘 크기 설정
		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점 설정
		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_i.png',size, offset);//마커 아이콘 설정
		
		marker = new Tmap.Marker(lonlat, icon);//마커 생성
		markerLayer.addMarker(marker);//레이어에 마커 추가
		
		map.setCenter(lonlat, 17); 
	});
}

/* 경로를 보여주느 함수 */
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

/* 뒤로가기 막는 함수 */
history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>