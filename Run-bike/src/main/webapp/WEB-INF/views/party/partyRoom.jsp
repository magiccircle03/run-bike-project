<%@page import="com.teamrun.runbike.party.domain.PartyInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>같이 달리기 : 방 정보</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- tmap api -->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">

<script src="https://kit.fontawesome.com/8653072c68.js"></script>

<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">  
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<style type="text/css">
.container{
	font-family: 'NanumSquare', sans-serif;
}
.title{
	margin:20px 0;
}
.marginTop{
	margin-top: 20px;
	margin-bottom: 20px;
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
.dispalyBlock{
	display: block;
}

h5{
	font-weight: bold;
}
.yellow{
	color: #FBAB00;
}
.lightgray{

	background-color: #efefef;
}
.bold{
	font-weight: bold;
}

.allReady{
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
.h2{
	font-size: 1.5em;

}
.readyChk{
	width: 100%;
}
.partyUserImg{
	width: 40px;
	height: 40px;
}
.width100{
	width: 100%;
}
.middle{
	vertical-align: middle;
}
.cardmargin{
	margin-top: 10px;
}
.btnHeight{
	margin-top: 20px;
	height: 50px;
}
.right{
	text-align: right;
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
<input id="u_name" name="u_name" type="hidden" class="form-control" value="${loginInfo.u_name}">

<!-- 같이하기 내비게이션 -->
<ul class="nav nav-pills nav-justified">
  <li class="nav-item">
    <a class="nav-link active" href="<c:url value='/party/${partyInfo.p_num}' />">방정보</a>
  </li>
  <li class="nav-item">
    <a id="curInfoA" class="nav-link" href="<c:url value='/party/${partyInfo.p_num}/ing' />">현재정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value='/party/${partyInfo.p_num}/chat' />">채팅</a>
  </li>
</ul>

<hr>

<div>

 	<!-- 방의 정보 -->
    <div id="partyInfo" class="font-size-18">
    	    <h3 id="partyTitle" class="marginTop"> [${partyInfo.p_num}] ${partyInfo.p_name} <span id="startStat" class="StartP"></span></h3>
    	    <h4 class="title"><i class="fas fa-fire red"></i>&nbsp; 우리의 목표 경로</h4>
    	    <div id="map_div"></div><!-- 지도 -->
    	    <div class="row">
	    	    <div class="col-md-6"><i class="fab fa-font-awesome-flag gray"></i> 출발지 : ${partyInfo.p_start_info}</div>
	    	    <div class="col-md-6"><i class="fas fa-flag-checkered gray"></i> 도착지 : ${partyInfo.p_end_info}</div>
    	    </div>
    	    <br>
    	    <div class="row"><div class="col-md-12">출발 예정 시각 : ${partyInfo.p_time_f}</div></div>
	    	<div class="row"><div class="col-md-12">예상 소요 시간 : ${partyInfo.p_riding_time} 분</div></div>
	    	<div class="row"><div class="col-md-12">총 거리 : ${partyInfo.p_riding_km} km</div></div>
	    	<div class="row"><div class="col-md-12">${partyInfo.p_content}</div></div>
    </div>
    
    <!-- 시작 전에만 보이는 영역 -->
    <div id="beforeStartArea">
    
    	<br>
	    <input id="readyChk" class="readyChk" type="checkbox" data-toggle="toggle" data-on="준비완료!" data-off="준비하기" data-onstyle="primary mint" data-width="100%" data-height="50px">
		<br>
		<!-- 방장만 보이는 시작버튼 -->
		<button id="startBtn" type="button" class="btn width100 master btnHeight" onclick="startRiding()" disabled="true">시작하기</button>
		<br>
		
	    <hr><!-- ========================================= -->
	    
	    <h5><i class="fas fa-child"></i> 함께 달릴 동료들 (<p id="capa" style="display: inline"></p> / ${partyInfo.p_capacity} )</h5>
	    <br>
	    
	    <!-- 참가자 정보 영역  -->
	    <div id="partyUserInfo1" class="row">
	    	<!-- 참가자 사진 / 이름 / 준비여부-->
		</div>
		
		<hr><!-- ========================================= -->
		
		<!-- 방장만 보이는 영역 -->
		<div id="partyInfoMaster" class="master right">
		    <button class="btn" onclick="editParty()">방 정보 수정</button> 
		    <button class="btn" onclick="deletePartyBtn()">방 삭제</button> 
		</div>
		<!-- /방장만 보이는 영역 -->
		
    </div><!-- /시작 전에만 보이는 영역 -->

    <button class="btn width100 lightgray" onclick="exitPartyFn()">나가기</button> 

</div>

</div><!-- 컨테이너 끝 -->

<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->

<!-- 소켓 -->
<!-- <script src="http://localhost:3000/socket.io/socket.io.js"></script> -->
<!-- <script src="https://13.125.253.7:3000/socket.io/socket.io.js"></script> -->
<script src="https://socket.runbike.cf/socket.io/socket.io.js"></script>

<script>

var xy=${partyInfo.p_XY}; // 목표 시작지, 도착지 좌표가 있는 json객체
var p_num = ${partyInfo.p_num}; // 방 번호
var u_idx = $('#u_idx').val();// 유저 번호
var user_name = $('#u_name').val(); // 유저 이름
/*  var socket = io('http://localhost:3000/room');   */
/* var socket = io('https://13.125.253.7:3000/room'); */
var socket = io('https://socket.runbike.cf/room');

$(document).ready(function() {
	var isStarted;
	initTmap(xy); // 맵을 초기화한다
	isStarted = chkIsStarted(); // 해당 방이 진행중인 방인지 체크한다
	showPartyUserList(); // 파티에 속한 유저 정보를 보여준다
	showMasterArea(); // 방장이면 방장 영역을 보여준다
	setReady('N'); // 어디 나갔다오면 처음엔 준비 안된 걸로
	showCurrentPos();// 내 현재위치
	
	// 라이딩 진행중이 아닐 땐, 현재정보 페이지로 가는 걸 막는다
	$("#curInfoA").on("click",function(event){
		if(!isStarted){
			event.preventDefault();
			alert('라이딩이 시작되면 볼 수 있습니다!');
		}
     });	
	
	//==========
	/* 접속 되었을 때 실행 */
	socket.on('connect', function() {
		navigator.geolocation.getCurrentPosition(function(pos) {
		    var latitude = pos.coords.latitude;
		    var longitude = pos.coords.longitude;	
		    
		    /* 서버에 새로운 유저가 왔다고 알림 (join) */
			socket.emit('join', {'name':user_name,'room_num':p_num,'u_idx':u_idx, 'latitude':latitude, 'longitude':longitude});
		});
	});
	
});

/* 유저 상태에 update가 있을 시 실행*/
socket.on('update', function(data) {
	showPartyUserList();
});

/* 라이딩이 진행중인지 체크한다 */
function chkIsStarted() {
	var chk;
	$.ajax({
		url : '../party/room/' + p_num,
		type : 'GET',
		async : false,
		success : function(data) {
			chk=(data.p_start_time!=null);
			
			if(chk){
				$('#beforeStartArea').addClass( 'dispalyNone' );
				$('#startStat').html(' [ 라이딩 진행중 ]');
			}else{
				$('#beforeStartArea').addClass( 'dispalyBlock' );
				$('#startStat').html(' [ 대기중 ]');
			}
		}
	});
	return chk;
} 

/* 방 정보 수정 버튼을 클릭하면 수정 페이지로 이동한다 */
function editParty() {
	if (confirm('방 정보를 수정할까요?')) {
		location.href = '../party/'+p_num+'/edit';
	}
}

/* 현재 방에 참여한 유저 수를 가져온다 */
function getUserCount() {
	var cnt=-2;
	$.ajax({
		url : '../party/room/'+p_num+'/usercount',
		type : 'GET',
		async : false,
		success : function(data) {
			cnt = data;
		}
	});
	return cnt;
}

/* 준비 버튼을 누르면, 준비 상태가 변하도록 한다 */
$('#readyChk').change(function() {
	
    if($("#readyChk").is(":checked")){
        setReady('Y'); // 레디
    }else{
        setReady('N'); // 레디 취소
    }
    isAllReady();
    socket.emit('ready',{'u_idx':u_idx, 'name':user_name,'room_num':p_num});
});

/* 서버로부터 ready 받은 경우 */
socket.on('ready_up', function(data) {
//	alert(data.u_idx+' 준비상태변경');
	isAllReady();
	showPartyUserList();
});

/* readyYN 컬럼 업데이트 함수 */
function setReady(readyYN) {	
 	$.ajax({
		url : '../party/ready',
		type : 'POST',
		data : {
			p_num : p_num,
			u_idx : u_idx,
			readyYN : readyYN
		},
		success : function(data) {
			showPartyUserList();
		}
	}); 
}

/* 파티에 속한 유저의 정보를 보여준다 */
function showPartyUserList() {
	$.ajax({
		url : '../party/room/'+p_num+'/user',
		type : 'GET',
		success : function(data) {
			html='';
			for (var i = 0; i < data.length; i++) {
				var crown=''; 
				var bold='';
				var readyStr='';
				var delBtn='';
				
				if(data[i].pc_masterYN=='Y'){
						crown='<i class="fas fa-crown yellow"></i> ';

					}else{
	 					if(isMaster()){
	 						crown='<a href="#" onclick="changeMaster('+data[i].u_idx+')"><i class="fas fa-user-alt gray" style="padding-left:2px;padding-right:2px;"></i></a> '; 
	 						delBtn='<a onclick="ban('+data[i].u_idx+')" class="ban"><i class="fas fa-times"></i></a>';
	 					}else{
							crown='<i class="fas fa-user-alt gray" style="padding-left:2px;padding-right:2px;"></i> '; 
						}
					}
					
					// 자신은 굵은 글씨로 표시된다
					if(data[i].u_idx==u_idx){
						bold='bold';
					}
					
					// 준비 여부 표시
					if(data[i].pc_readyYN=='Y'){
						readyStr='<p class="ready middle">준비 완료!</p>';
					}else{
						readyStr='<p class="gray middle">방 둘러보는 중...</p>';
					}
					
					
					html+='<div class="col-sm-6">\n';
					html+='<div class="card cardmargin">\n';
					html+='<div class="row no-gutters">\n';
					html+='<div class="col-2">\n';
					html+='<img src="${pageContext.request.contextPath}/uploadfile/userphoto/'+data[i].u_photo+'" alt="" class="card-img" />\n';
					html+='</div>\n';
					html+='<div class="col-5">\n';
					html+='<div class="card-body">\n';
					html+='<p class="card-text middle '+bold+'">\n';
					html+= crown + data[i].u_name + delBtn;
					html+='</p>\n';
					html+='</div>\n';
					html+='</div>\n';
					html+='<div class="col-5">\n';
					html+='<div class="card-body middle">\n';
					html+='<p class="card-text middle">\n';
					html+= readyStr;
					html+='</p>\n';
					html+='</div>\n';
					html+='</div>\n';
					html+='</div>\n';
					html+='</div>\n';
					html+='</div>';//col-sm-6
			
			}
			
			$('#partyUserInfo1').html(html);
			$('#capa').html(" "+getUserCount());
			
		}

	});
}

/* 내가 파티를 나간다 */
function exitPartyFn() {
	
	if(isMaster()){
		if(getUserCount()<2){
			if(confirm('인원이 1명일 때 나가면 방이 삭제됩니다. 방에서 나가시겠습니까?')){
				exitParty(u_idx);
				// 방삭제
				deleteParty();
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
	

/* 매개변수로 전해진 유저를 참여테이블에서 delete 하는 함수 */
function exitParty(idx) {
	// alert(p_num+","+u_idx);
 	 $.ajax({
 		url : '../party/room/'+p_num,
 		type : 'DELETE',
 		data : JSON.stringify({
 			u_idx : idx
		}),
		contentType : 'application/json; charset=utf-8',
 		success : function(data) {
 			//alert(data);
 			location.href="../party";
 		}
 	});
}

/* 방장이면 보이게 하는 함수 */
function showMasterArea() {

  	if (isMaster()) {
		$('.master').css('display','block');
	}
	else{
		$('.master').css('display','none');
	}  
	 
}

/* 방장인지 체크하는 함수 */
function isMaster() {
	var master = 0;
	var chk = false;
	 $.ajax({
	 		url : '../party/room/'+p_num+'/master',
	 		type : 'GET',
			async : false,
	 		success : function(data) {
	 			master = parseInt(data);
	 			chk = (master==u_idx);
	 		}
	 }); 
	return chk;
}

/* 방장을 위임하는 함수 */
function changeMaster(u_idx_t){ // 타겟 유저의 idx를 받는다
	if (confirm('방장을 위임하시겠습니까?')) {
	 	 $.ajax({
		 	url : '../party/room/'+p_num+'/master',
	  		type : 'PUT',
	  		data : JSON.stringify({
	  			u_idx_t : u_idx_t 
	 		}),
	 		contentType : 'application/json; charset=utf-8',
	  		success : function(data) {
	  			alert(data); // 방장 위임 결과를 띄워줌
	  			showMasterArea();
	  			showPartyUserList();
	  		}
	  	});
	}
}

/* 파티 삭제 버튼을 눌렀을 때 */
function deletePartyBtn(){
	if (confirm('방을 삭제하시면 복구할 수 없습니다. \n방을 폭파하시겠습니까?')) {
		deleteParty();
	}
}

/* 파티 삭제 함수 */
function deleteParty(){
	 $.ajax({
		url : '../party/'+p_num,
		type : 'DELETE',
 		contentType : 'application/json; charset=utf-8',
		success : function() {
			location.href="../party";
		}
	 });
}

/* 모두가 준비했는지 체크하는 함수 */
function isAllReady() {
	// 준비 N인 사람이 있으면 -> N / 준비 N인 사람 수가 0이면 -> Y 반환
	var cnt = -2;
	 $.ajax({
	 		url : '../party/room/'+p_num+'/notReadyUsercount',
	 		type : 'GET',
			async : false,
	 		success : function(data) {
	 			cnt = parseInt(data);
	 		}
	 }); 
	
	 if(cnt==0){
		 // 시작버튼 활성화
		 $('#startBtn').attr('disabled', false);
		 $('#startBtn').addClass('allReady');
	 }else{
		 // 시작버튼 비활성화
		 $('#startBtn').attr('disabled', true);
		 $('#startBtn').removeClass('allReady');
	 }
}

/* 라이딩을 시작하는 함수 */
function startRiding() {
	if(getUserCount()>1){
		 $.ajax({
		 		url : '../party/'+p_num+'/start',
		  		type : 'get',
		 		success : function() {
				    /* 시작 */
					socket.emit('start', {'room_num':p_num});
		 			/* location.href="./"+p_num+"/ing"; */
		 		}
		 }); 
	}else{
		alert('2명 이상일때 시작 가능합니다!');
	}	
}

/* 시작되었을 때 실행 */
socket.on('start_up', function() {
	/* 진행중 페이지로 감 */
	location.href="./"+p_num+"/ing";
});

/* 회원 강퇴 */
function ban(idx) {
	if (confirm('해당 유저를 내보낼까요?')) {
		exitParty(idx+"");
		alert('내보냈습니다!');
		showPartyUserList();
	}
}

/* 맵 초기화 */
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

/* 디비에서 가져온 목표 경로 뿌려주기 */
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


/* 내 현재위치 보여주는 함수 */
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
	});
}

/* 뒤로가기 버튼 비활성화 (나가기를 해야 로비로 갈 수 있게) */
history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>