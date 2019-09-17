<%@page import="com.teamrun.runbike.party.domain.PartyInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이 달리기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/8653072c68.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<style type="text/css">
.mint{
	background-color: #21B2A6;
	color: #fefefe;
}

.tabWidth{
	width:33%;
	text-align: center;
}

.width

</style>
</head>
<body>

<div class="container">

<!-- 숨겨진 u_idx -->
<input id="u_idx" name="u_idx" type="text" class="form-control" value="69">
여긴 ${p_num} 번 방이다^^!!! <br>
<button class="btn" onclick="exitParty()">나가기</button> 
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
    <br>
    <button class="btn">시작하기</button> <!-- 방장만 보이게 -->
  </div>
  
  <div class="tab-pane fade" id="curInfoTab">
   	<p>지도 정보</p>
   	<div id="partyUserInfo">
	참여한 사람 이미지 / 사람 이름 / 준비여부
	</div>
  </div>
  
  <div class="tab-pane fade" id="chatTab">
    <p>채팅공간</p>
  </div>
  
</div>

</div><!-- 컨테이너 끝 -->

<script>


$(document).ready(function() {
	showPartyInfo();
	showPartyUserList();
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
	    	html += ''+data.p_name+'</h1><br>\n';
	    	html += '출발지 : '+data.p_start_info+'<br>\n';
	    	html += '목적지 : '+data.p_end_info+'<br>\n';
	    	html += '좌표 : '+data.p_XY+'<br>\n';
	    	html += '방내용 : '+data.p_content+'<br>\n';
	    	html += '참여 인원 : '+getUserCount()+'<br>\n';
	    	html += '방 정원 : '+data.p_capacity+'<br>\n';
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
        alert("레디!");
        setReady('Y');
    }else{
        alert("레디 취소!");
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
			html='';
			for (var i = 0; i < data.length; i++) {
				html+=' '+data[i].u_photo+' '+data[i].u_name+' 여기는 상태<br>';
			}
			$('#partyUserInfo').html(html);
			
		}

	});
}

function exitParty() {
	// 방장은 이 버튼을 못 보게 하자..
	// alert(p_num+","+u_idx);
 	 $.ajax({
 		url : path + '/party/room/'+p_num,
 		type : 'DELETE',
 		data : JSON.stringify({
 			u_idx : u_idx
		}),
		contentType : 'application/json; charset=utf-8',
 		success : function(data) {
 			//alert(data);
 			location.href="../party";
 		}
 		
 	});  
}



</script>
</body>
</html>