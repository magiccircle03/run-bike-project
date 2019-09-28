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
.tabWidth{
	width:33%;
	text-align: center;
}
.master{
	display: none;
}
.dispalyNone{
	display: none;
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

.allReady{
	font-weight: bold;
	background-color: #FD5314;
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
.marginTop{
	margin-top: 20px;
	margin-bottom: 20px;
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
	font-size: 18px;
}
.gray{
	color: #555555;
}
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

<div class="container">

<!-- 숨겨진 u_idx -->
<!-- <hr> -->
<input id="u_idx" name="u_idx" type="hidden" class="form-control" value="${loginInfo.u_idx}">
<button class="btn" onclick="exitPartyFn()">나가기</button> 
<button class="btn" onclick="getCurrentPos()">현재위치</button> 

<!-- 같이하기 내비게이션 -->
<ul class="nav nav-pills nav-justified">
  <li class="nav-item tabWidth">
    <a class="nav-link" href="<c:url value='/party' />">방정보</a>
  </li>
  <li class="nav-item tabWidth">
    <a class="nav-link active" href="<c:url value='/party/${partyInfo.p_num}/ing' />">현재정보</a>
  </li>
  <li class="nav-item tabWidth">
    <a class="nav-link" href="<c:url value='/party/${partyInfo.p_num}/chat' />">채팅</a>
  </li>
</ul>

<hr>

<div class="tab-content">
  
  <div class="tab-pane fade show active" id="partyInfoTab">
  
    <div id="partyInfo" class="font-size-18">
    	    <h2 id="partyTitle" class="marginTop"> [${partyInfo.p_num}] ${partyInfo.p_name}</h2> 
    	    <h4 style="padding:20px 0;"><i class="fas fa-biking blue"></i>&nbsp; 우리의 목표 경로 <i class="fas fa-fire red"></i></h4>
    	    <div id="map_div"></div>
    	    <div class="row">
	    	    <div class="col-md-6"><i class="fab fa-font-awesome-flag gray"></i> 출발지 : ${partyInfo.p_start_info}</div>
	    	    <div class="col-md-6"><i class="fas fa-flag-checkered gray"></i> 도착지 : ${partyInfo.p_end_info}</div>
    	    </div>
    	    <br>
    	    <div class="row"><div class="col-md-12">${partyInfo.p_content}</div></div>
    	    <div class="row"><div class="col-md-12">출발 예정 시각 : ${partyInfo.p_time_f}</div></div>
	    	<p>총 거리 : ${partyInfo.p_riding_km} km , 예상 소요 시간 : ${partyInfo.p_riding_time} 분</p>

    </div>
    
<!-- 시작 후에만 보이는 영역 -->
    <div id="afterStartArea" class="afterStart">
 
    	<!-- 원래는 장소를 체크해서 가까우면 완주 아니면 그냥 종료로 간다. -->
    	<button id="endBtn" class="btn" onclick="endRiding()">종료하기</button>
    	
    	<!-- 방장만 보이게 영역 -->
		<div class="master">
		   	<button id="endBtnMaster" class="btn" onclick="endRidingMaster()" disabled="true">전체 라이딩 종료하기!</button>
		</div>
		<!-- /방장만 보이게 영역 -->
    	
    </div>
<!-- /시작 후에만 보이는 영역 -->
    
    
    
  </div>
  
  
</div>

</div><!-- 컨테이너 끝 -->
<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->
<script>

var xy=${partyInfo.p_XY};

$(document).ready(function() {
	initTmap(xy);
	chkIsStarted();
	showPartyUserList();
	showMasterArea();
	setReady('N');// 어디 갔다오면 처음엔 준비 안된걸로
	
});

var p_num = ${partyInfo.p_num};
var u_idx = $('#u_idx').val();// 아이디 값 세션에서 가져오기. 


var path='http://localhost:8080/runbike';

function chkIsStarted() {
	//alert(p_num);
	$.ajax({
		url : path + '/party/room/' + p_num,
		type : 'GET',
		success : function(data) {
			//alert("시작시간"+data.p_start_time);
			//alert(data.p_start_time!=null);
			if(data.p_start_time!=null){
				$('#beforeStartArea').addClass( 'dispalyNone' );
				$('#partyTitle').append( '<p class="StartP"> [ 라이딩 진행중 ]</p>' );
				
			}
		}
	});
} 

function editParty() {
	if (confirm('방 정보를 수정할까요?')) {
		location.href = '../party/'+p_num+'/edit';
	}
}

function getCurrentPos() {
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    alert("내 현재 위치는 : " + latitude + ", "+ longitude);
	});
}

function getUserCount() {
	var cnt=-2;
	$.ajax({
		url : path+'/party/room/'+p_num+'/usercount',
		type : 'GET',
		async : false,
		success : function(data) {
			cnt = data;
		}
	});
	return cnt;
}

$('#readyChk').change(function() {
    if($("#readyChk").is(":checked")){
        //alert("레디!");
        setReady('Y');
    }else{
        //alert("레디 취소!");
        setReady('N');
    }
});

function setReady(readyYN) {	
 	$.ajax({
		url : path + '/party/ready',
		type : 'POST',
		data : {
			p_num : p_num,
			u_idx : u_idx,
			readyYN : readyYN
		},
		success : function(data) {
			//alert(data);
			//alert(JSON.stringify(data));
			showPartyUserList();
		}
	}); 
}

function showPartyUserList() {
	//alert('야');
	$.ajax({
		url : path+'/party/room/'+p_num+'/user',
		type : 'GET',
		success : function(data) {
			//alert('호');
			//alert(JSON.stringify(data));
			html2='';
			for (var i = 0; i < data.length; i++) {
				html2+=' '+data[i].u_photo+' '+data[i].u_name+' 여기는 상태<br>';
			}
			$('#partyUserInfo2').html(html2);
			
			
			
			
			html1='';
			html1+='<table>\n';
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
				
				if(data[i].pc_readyYN=='Y'){
					readyStr='<p class="ready">준비 완료!</p>';
				}else{
					readyStr='<p class="gray">방 둘러보는 중...</p>';
				}
				
				
				html1+='<tr>\n';
				html1+='<td class="width30">'+data[i].u_photo+'</td>\n';
				html1+='<td class="width30 '+bold+'">' + crown + data[i].u_name + delBtn + '</td>\n';
				html1+='<td class="width30">'+readyStr+'</td>\n';
				html1+='</tr>\n';
				
				//html1+=' '+data[i].u_photo+' '+data[i].u_name+' '+data[i].pc_readyYN+'<br>';
			}
			html1+='</table>\n';
			$('#partyUserInfo1').html(html1);
			$('#capa').html(" "+getUserCount());
			
		}

	});
}

// 내가 파티를 나간다
function exitPartyFn() {
/* 	if(confirm('현재 참여한 방에서 나가시겠습니까?')){
		if(getUserCount()<2){
			if(confirm('인원 1명이야! 너 나가면 방폭 되는데 나갈거야?')){
				exitParty(u_idx);
				// 방삭제
				deleteParty();
			}
		}else{
			if(isMaster()){
				alert('방장이 어딜나가! 나갈거면 위임해');
			}else{
				exitParty(u_idx); // 현재 로그인된 유저를 얌전히 보내준다
			}
		}
	} */
	
	
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
	

// 매개변수로 전해진 유저를 참여테이블에서 delete 하는 함수
function exitParty(idx) {
	// alert(p_num+","+u_idx);
 	 $.ajax({
 		url : path + '/party/room/'+p_num,
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

// 방장이면 보이게
function showMasterArea() {

  	if (isMaster()) {
		$('.master').css('display','block');
	}
	else{
		$('.master').css('display','none');
	}  
	 
}


//방장이면 보이게
function isMaster() {
	var master = 0;
	var chk = false;
	 $.ajax({
	 		url : path + '/party/room/'+p_num+'/master',
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

// 방장 위임
// 타겟 유저의 idx를 받는다
function changeMaster(u_idx_t){
	if (confirm('방장을 위임하시겠습니까?')) {
		//alert('방장을 위임합니다');
	 	 $.ajax({
		 	url : path + '/party/room/'+p_num+'/master',
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

function deletePartyBtn(){
	if (confirm('방을 삭제하시면 복구할 수 없습니다. \n방을 폭파하시겠습니까?')) {
		deleteParty();
	}
}

// 파티삭제
function deleteParty(){
	 $.ajax({
		url : path + '/party/'+p_num,
		type : 'DELETE',
 		contentType : 'application/json; charset=utf-8',
 		//dataType : 'json', //데이터타입
		success : function() {
			//alert('삭제성공');
			location.href="../party";
		}
	 });
}

// 회원정보 계속 업데이트(준비 상태 바로 반영되게)
var refreshReady = setInterval(function() {
		showPartyUserList();
		isAllReady();
		
}, 1000);


function stopRefreshReady() {
	clearInterval(refreshReady);
}

// 이걸 따로 하지 말고 레디할때 그냥 같이 반환시켜줘도 좋겠다
function isAllReady() {
	// 준비 N인 사람이 있으면 -> N / 준비 N인 사람 수가 0이면 -> Y 반환
	var cnt = -2;
	 $.ajax({
	 		url : path + '/party/room/'+p_num+'/notReadyUsercount',
	 		type : 'GET',
			async : false,
	 		success : function(data) {
	 			cnt = parseInt(data);
	 			//alert(cnt);
	 		}
	 }); 
	 
	 if(cnt==0){
		 //alert('모두준비되었다!');
		 // startBtn에 allReady클래스 추가 
		 
		 $('#startBtn').attr('disabled', false);
		 $('#startBtn').addClass('allReady');
	 }else{
		 //alert('준비되지 않은 인원 :'+cnt);
		 $('#startBtn').attr('disabled', true);
		 $('#startBtn').removeClass('allReady');
	 }
}

function startRiding() {
	alert('시작');
	 $.ajax({
	 		url : path + '/party/'+p_num+'/start',
	  		type : 'get',
	 		success : function() {
	 			alert('성공');
	 			location.href="./"+p_num+"/ing";
	 		}
	 }); 
}

function ban(idx) {
	if (confirm('해당 유저를 내보낼까요?')) {
		exitParty(idx+"");
		alert('내보냈습니다!');
	}
}



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

history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>