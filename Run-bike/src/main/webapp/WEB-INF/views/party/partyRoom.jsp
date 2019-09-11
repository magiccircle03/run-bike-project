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
</head>
<body>

<div class="container">
여긴 ${p_num} 번 방이다^^!!!

<hr>

<div id="partyInfo">

</div>

<div id="partyMemberInfo">

</div>

동적인 정보를 ajax로

여기엔 탭으로
목표 경로라던가 이 방에 참여한 사람 리스트
기타 방의 정보가 쓰여질거야!

방장이 아닌 사람에겐
[준비하기 버튼] 만 보이고
방장에겐 [시작하기 버튼] 도 보일거야!

</div><!-- 컨테이너 끝 -->

<script>
$(document).ready(function() {
	showPartyInfo();
});


</script>
</body>
</html>