<%@page import="com.teamrun.runbike.party.domain.PartyInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

.StartP{
	display : inline;
	color: red;
}

/* 메인 */
#main {
  margin: auto;
  margin-top: 40px;
  border-radius: 5px;
  box-shadow: 5px 5px lightgray;
  background-color: #efefef;
  text-align: left;
  width: 90%;
  height: 650px;
  padding: 10px;
}

/* 채팅 영역 */
#chat {
  height: 90%;
  width: 100%;
  overflow-y: auto;
}

/* 접속 알림 */
.join {
  width: 90%;
  margin: auto;
  background-color: Aquamarine;
  text-align: center;
  margin-top: 10px;
  padding: 5px;
}

/* 접속 종료 알림 */
.disconnect {
  width: 90%;
  margin: auto;
  background-color: #e0e0e0;
  text-align: center;
  margin-top: 10px;
  padding: 5px;
}

/* 상대방이 보낸 메시지 */
.other {
  width: 45%;
  margin-left: 5%;
  background-color: #fefefe;
  border-radius: 5px;
  margin-top: 10px;
} 

/* 말풍선 감싸는 div */
.balloon_me{
	width: 90%;
	margin: auto;
	text-align: right;
	margin-top: 10px;
}

.balloon_other{
	width: 90%;
	margin: auto;
	margin-top: 10px;
}

.ballon_span{
	background-color: #fefefe; 
	border-radius: 5px;
	display: inline-block;
	padding: 5px;
}

/* 메시지 입력 부분 */
#msgArea{
	width: 90%;
	margin: 0 auto;
}
#msg_process{
	background-color: #fafafa;
	width: 100%;
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
	<input id="p_num" name="p_num" type="hidden" class="form-control" value="${partyInfo.p_num}">
	
	<!-- 같이하기 내비게이션 -->
	<ul class="nav nav-pills nav-justified">
	  <li class="nav-item">
	 	 <a class="nav-link" href="<c:url value='/party/${partyInfo.p_num}' />">방정보</a>
	  </li>
	  
	  <li class="nav-item">
	    <a id="curInfoA" class="nav-link" href="<c:url value='./ing' />">현재정보</a>
	  </li>
	  
	  <li class="nav-item">
	    <a class="nav-link active" href="<c:url value='./chat' />">채팅</a>
	  </li>
	</ul>
	
	<hr>

	<h3 id="partyTitle" class="marginTop"> [${partyInfo.p_num}] ${partyInfo.p_name} <p id="startStat" class="StartP"></p></h3>
	<div id="main"> 
      <div id="chat">
        <!-- 채팅 메시지 영역 -->
      </div><!-- "chat" -->
      <div id="msgArea" class="row">
      	<div class="col-md-10"><input type="text" id="input_msg" class="form-control" placeholder="메시지를 입력해주세요✿*:･ﾟ"></div>
      	<div class="col-md-2"><button id="msg_process" class="btn" onclick="send()">전송</button></div>
      </div><!-- msgArea -->
      
   	</div>

</div><!-- 컨테이너 끝 -->
<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
<!-- <script src="http://54.180.26.199:3000/socket.io/socket.io.js"></script> -->

<script type="text/javascript">
var p_num = $('#p_num').val();
var user_name = $('#u_name').val();
var socket = io('http://localhost:3000');
/* var socket = io('http://54.180.26.199:3000'); */

$(document).ready(function() {
    //msg에서 키를 누를떄
    $("#input_msg").keydown(function(key){
        //해당하는 키가 엔터키(13) 일떄
        if(key.keyCode == 13){
            //msg_process를 클릭해준다.
            msg_process.click();
        }
    });

	/* 접속 되었을 때 실행 */
	socket.on('connect', function() {
	  /* 서버에 새로운 유저가 왔다고 알림 (join) */
	  socket.emit('join', {'name':user_name,'room_num':p_num});
	});

	/* 서버로부터 데이터 받은 경우 */
	socket.on('update', function(data) {
		
	  var node;
	  
	  if(data.name=="SERVER"){
		  node = data.message;
	  }else{
		  node = data.name+": "+data.message;
	  }

	  var divClassName = '';
	  var spanClassName='';

	  // 타입에 따라 적용할 클래스를 다르게 지정
	  switch(data.type) {
	    case 'message':
	   	  divClassName = 'balloon_other';
	      spanClassName = 'ballon_span';
	      break;

	    case 'join':
	        divClassName = 'join';
	    break;

	    case 'disconnect':
	      divClassName = 'disconnect';
	      break;
	  }

	  $('#chat').append('<div class="'+divClassName+'"><span class="'+spanClassName+'">'+node+'</span></div>');
	  
	});
	
	
	//=========
		
	isStarted = chkIsStarted();
	// 시작되지 않았을 때 현재정보 페이지로 가는 걸 막는다
	$('#curInfoA').on('click',function(event){
		if(!isStarted){
			event.preventDefault();
			alert('라이딩이 시작되면 볼 수 있습니다!');
		}
     });	

});

/* 라이딩이 진행중인지 체크한다 */
function chkIsStarted() {
	//alert(p_num);
	var chk;
	$.ajax({
		url : '../../party/room/' + p_num,
		type : 'GET',
		async : false,
		success : function(data) {
			chk=(data.p_start_time!=null);
			if(chk){
				$('#startStat').html(' [ 라이딩 진행중 ]');
			}else{
				$('#startStat').html(' [ 대기중 ]');
			}
		}
	});
	return chk;
} 


/* 메시지 전송 함수 */
function send() {
	// 입력되어있는 데이터 가져오기
	var message = $('#input_msg').val();
	
	if(message.length>0){
		// 가져왔으니 데이터 빈칸으로 변경
		$('#input_msg').val('');
		
		// 내가 전송할 메시지 클라이언트에게 표시
		$('#chat').append('<div class="balloon_me"><span class="ballon_span">'+message+'</span></div>');
			
		// 서버로 message 이벤트 전달 + 데이터와 함께
		socket.emit('message', {type: 'message', message: message});
	}
}



</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>