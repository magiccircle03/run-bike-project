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

</style>
</head>
<body>

<div class="container">
<!-- 숨겨진 u_idx -->
<input id="u_idx" name="u_idx" type="text" class="form-control" value="69">
	
여긴 ${p_num} 번 방이다^^!!! <br>
<button onclick="exitParty()">나가기</button> 
<hr>

	<div id="partyInfo">
	출발지: / 목적지:
	[지도엔 목표 경로]
	<input id="readyChk" type="checkbox" data-toggle="toggle" data-on="준비완료!" data-off="준비하기" data-onstyle="primary mint">
	
	</div>
	
	<div id="partyMemberInfo">
	<a onclick="showPartyInfo(${p_num});">새로고침 <i class="fas fa-sync-alt"></i></a>
	참여한 사람 이미지 / 사람 이름 / 준비여부
	[채팅]
	</div>

</div><!-- 컨테이너 끝 -->

<script>


$(document).ready(function() {
	showPartyInfo();
});

var p_num = ${p_num};
var u_idx = $('#u_idx').val();// 아이디 값 세션에서 가져오기. 

var path='http://localhost:8080/runbike';

function showPartyInfo() {
	alert(p_num);
	$.ajax({
		url : path + '/party/room/' + p_num,
		type : 'GET',
		success : function(data) {
			alert(JSON.stringify(data));
			
		}
	});
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
			alert(data);
			//alert(JSON.stringify(data));
		}
	}); 
}

function showParticipationUserInfo() {
	
}

function exitParty() {
	// 방장은 이 버튼을 못 보게 하자..
	alert(p_num+","+u_idx);
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