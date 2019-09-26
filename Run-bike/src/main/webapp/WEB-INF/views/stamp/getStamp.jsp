<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--제이쿼리-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- Bootstrap CSS & JS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">

<!--Tmap API-->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9"></script>

<!--폰트어썸 아이콘  -->
<script src="https://kit.fontawesome.com/ff137eb685.js"
	crossorigin="anonymous"></script>

<title>스탬프 투어</title>
</head>
<body>
	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->

	
	<!-- 컨테이너 시작 -->
	<div class="container">
			
			<h4 class="font-weight-bold pt-5 mb-4"><i class="fas fa-map-marked-alt"> 스탬프 투어</i></h4>
			<div class="page-info-text text-dark">스탬프를 투어를 떠나자!</div>
			<hr>
	</div>
	
	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->
</body>
</html>