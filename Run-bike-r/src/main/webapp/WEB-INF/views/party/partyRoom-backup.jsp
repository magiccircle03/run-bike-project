<%@page import="com.teamrun.runbike.party.domain.PartyInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이 달리기-지도 넣기 전</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
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
	background-color: pink;
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
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

<div class="container">

<!-- 숨겨진 u_idx -->
<input id="u_idx" name="u_idx" type="text" class="form-control" value="70">
여긴 ${p_num} 번 방이다^^!!! <br>
<button class="btn" onclick="exitPartyFn()">나가기</button> 
<hr>

<!-- 탭 클릭시마다 새로고침되게 하기 -->
<ul class="nav nav-tabs">
  <li class="nav-item tabWidth">
    <a class="nav-link active" data-toggle="tab" href="#partyInfoTab" onclick="showPartyInfo()">방정보</a>
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
    </div>
    
    <input id="readyChk" type="checkbox" data-toggle="toggle" data-on="준비완료!" data-off="준비하기" data-offstyle="" data-onstyle="primary mint">

    <!-- 방장만 보이게 영역 -->
	<div id="partyInfoMaster" class="master">
	   	<button id="startBtn" class="btn" onclick="startRiding()" disabled="true">시작하기</button>
	   	<!-- 그냥 종료버튼 -->
	   	<!-- 방장 종료버튼  -->
	    <button class="btn" onclick="editParty()">방 정보 수정</button> 
	    <button class="btn" onclick="deleteParty()">방 삭제</button> 
	</div>
    <!--  -->
    
    <hr>
    <h5><i class="fas fa-child"></i> 함께 달릴 동료들</h5>
    <div id="partyUserInfo1">
    <!-- 참가자 사진 / 이름 / 준비여부-->
	</div>
	

    
    
  </div>
  
  <div class="tab-pane fade" id="curInfoTab">
   	<p>지도 정보</p>
   	<div id="partyUserInfo2">
	참여한 사람 이미지 / 사람 이름 / 준비여부
	</div>
  </div>
  
  <div class="tab-pane fade" id="chatTab">
    <p>채팅공간</p>
  </div>
  
</div>

</div><!-- 컨테이너 끝 -->
<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->
<script>


$(document).ready(function() {
	showPartyInfo();
	showPartyUserList();
	showMasterArea();
	setReady('N');// 어디 갔다오면 처음엔 준비 안된걸로
});

var p_num = ${p_num};
var u_idx = $('#u_idx').val();// 아이디 값 세션에서 가져오기. 

var path='http://localhost:8080/runbike';

function showPartyInfo() {
	//alert(p_num);
	$.ajax({
		url : path + '/party/room/' + p_num,
		type : 'GET',
		success : function(data) {
			//alert(JSON.stringify(data));
			html = '';
	    	html += '<h2>['+data.p_num+'번]\n';
	    	html += ''+data.p_name+' ( '+getUserCount()+' / '+data.p_capacity+'명 )</h1><br>\n';
	    	html += '출발지 : '+data.p_start_info+'<br>\n';
	    	html += '목적지 : '+data.p_end_info+'<br>\n';
	    	html += '좌표 : '+data.p_XY+'<br>\n';
	    	html += '방내용 : '+data.p_content+'<br>\n';
	    	html += '출발예정시간 : '+data.p_time_f+'<br>\n';
	    	html += '방 개설 시간 : '+data.p_generate_date_f+'<br>\n';
	    	$('#partyInfo').html(html);
		}
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
			
		}

	});
}

// 내가 파티를 나간다
function exitPartyFn() {
	if(confirm('현재 참여한 방에서 나가시겠습니까?')){
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
}

function ban(idx) {
	if (confirm('해당 유저를 내보낼까요?')) {
		exitParty(idx+"");
		alert('내보냈습니다!');
	}
}


</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>