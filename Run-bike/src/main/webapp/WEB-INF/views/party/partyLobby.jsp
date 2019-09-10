<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이 달리기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/8653072c68.js"></script>
<style type="text/css">

.right{
	text-align: right;
}
.width{
	width:60%;
} 
.card-title{
	font-weight: bold;
	font-size: 22px;
}

.mintbtn{
	background-color: #21B2A6;
	color: #fefefe;
	width: 49%;
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
</style>
</head>
<body>
<div class="container">
	<div class="right"><a class="btn" data-toggle="modal" data-target="#createPartyModal">방 만들기</a></div>
	<div id="partyListContainer">
		<div id="partyList" class="row">

		</div><!-- partyList 끝 -->
		
		<p id="pageArea"></p>
		
	</div>

	<!-- 모달시작 -->
	<div class="modal fade" id="createPartyModal" tabindex="-1" role="dialog" aria-labelledby="createPartyTitle" aria-hidden="true">
	  <div class="modal-dialog width">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="createPartyTitle">방만들기</h4>
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
			    <input id="p_start_info" name="p_start_info" type="text" placeholder="시작지 정보" class="form-control" required="required" style="display:inline-block; width:49%">
			    <input id="p_end_info" name="p_end_info" type="text" placeholder="도착지 정보" class="form-control" required="required" style="display:inline-block; width:50%"><br>
			  
			  	<textarea id="p_XY" name="p_XY" class="form-control">{"sX":"123.4", "sY":"789.0"}</textarea>
			  	
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
	        <button id="createPartyBtn" type="submit" class="btn">방 만들기</button>
	      </div>
	      
	     </form>
	    </div>
	  </div>
	</div>
	<!-- 모달끝 -->
	
	
</div><!-- 컨테이너 끝 -->

<script>

$(document).ready(function() {
	list();
});

var path='http://localhost:8080/runbike';

$('#createForm').submit(function() {
	$.ajax({
		//url : 'http://15.164.162.21:8080/culturefork/review/post',
		url : path+'/party',
		type : 'POST',
		data : JSON.stringify({
			p_name : $('#createPartyModal #p_name').val(),
			p_content : $('#createPartyModal #p_content').val(),
			p_start_info : $('#createPartyModal #p_start_info').val(),
			p_end_info : $('#createPartyModal #p_end_info').val(),
			p_XY : $('#createPartyModal #p_XY').val(),
			p_time : $('#createPartyModal #p_time').val(),
			p_capacity : $('#createPartyModal #p_capacity').val(),
			p_password : $('#createPartyModal #p_password').val()
		}),
		contentType : 'application/json; charset=utf-8', //전달해줄 때 타입
		//dataType : 'json', //데이터타입
		success : function(data) {
			alert('성공');
		}
	});
});

function list() {
	
	$.ajax({
		
		url : path+'/party/list',
		type : 'GET',
		success : function(data) {
			//alert(JSON.stringify(data));

			var html = '';

			for (var i = 0; i < data.length; i++) {
				//alert(data[i].p_name);
				html += '<div class="col-sm-6">\n';
				html += '<div class="card card-style">\n';
				html += '<div class="card-body">\n';
				html += '<h5 class="card-title">\n';
				html += data[i].p_name + '('+'현재인원'+'/'+data[i].p_capacity+')\n'
				html += '</h5>\n';
				html += '<p class="card-text">\n';
				html += '<i class="fas fa-map-marked-alt"></i> 출발지 : '+data[i].p_start_info+'<br>\n';
				html += '<i class="fas fa-flag-checkered"></i> 목적지 : '+data[i].p_end_info+' <br>\n';
				html += '<i class="far fa-clock"></i> 출발 예정 시간 : '+data[i].p_time_f+'<br>\n';
				html += '</p>\n';
				html += '<p class="card-text">'+data[i].p_content+'</p>\n';
				html += '<a href="#" class="btn mintbtn"><i class="fas fa-info-circle"></i>방 정보 보기</a>\n';
				html += '<a href="#" class="btn mintbtn"><i class="fas fa-child"></i> 참여하기!!</a>\n';
				html += '</div>\n';
				html += '</div>\n';
				html += '</div>';
			}

			$('#partyList').html(html);
		}

	});
}
</script>
</body>
</html>