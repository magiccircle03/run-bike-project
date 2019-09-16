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
여긴 ${p_num} 번 방이다^^!!!
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

var p_num = ${p_num};
var u_idx = 2; // 아이디 값 세션에서 가져오기. 

$(document).ready(function() {
	showPartyInfo();
});

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
</script>
</body>
</html>