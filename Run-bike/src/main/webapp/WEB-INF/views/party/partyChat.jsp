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
body{
	color : #333333;
}
.tabWidth{
	width:33%;
	text-align: center;
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
<input id="p_num" name="p_num" type="hidden" class="form-control" value="${partyInfo.p_num}">



<!-- 같이하기 내비게이션 -->
<ul class="nav nav-pills nav-justified">

  <li class="nav-item tabWidth">
  <a class="nav-link" href="<c:url value='/party/${partyInfo.p_num}' />">방정보</a>
    <!-- http://localhost:8080/runbike/party/69 이런식으로 들어가야하는데 69/ 하고 들어가서 일단 이렇게 해뒀다. 방번호 받아오면 제대로 가능할듯 -->
  </li>
  
  <li class="nav-item tabWidth">
    <a id="curInfoA" class="nav-link" href="<c:url value='./ing' />">현재정보</a>
  </li>
  
  <li class="nav-item tabWidth">
    <a class="nav-link active" href="<c:url value='./chat' />">채팅</a>
  </li>
</ul>

<hr>

<div class="tab-content">
  
  <div class="tab-pane fade show active">
	채팅기능 준비중입니다^^!!!
  </div>
  
</div>

</div><!-- 컨테이너 끝 -->
<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->

<script type="text/javascript">
var p_num = $('#p_num').val();

$(document).ready(function() {
	isStarted = chkIsStarted();
	// 시작되지 않았을 때 현재정보 페이지로 가는 걸 막는다
	$("#curInfoA").on("click",function(event){
		if(!isStarted){
			event.preventDefault();
			alert('라이딩이 시작되면 볼 수 있습니다!');
		}
     });	
	
});

function chkIsStarted() {
	//alert(p_num);
	var chk;
	$.ajax({
		url : '../../party/room/' + p_num,
		type : 'GET',
		async : false,
		success : function(data) {
			chk=(data.p_start_time!=null);
		}
	});
	return chk;
} 
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>