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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<!--폰트어썸 아이콘  -->
<script src="https://kit.fontawesome.com/ff137eb685.js"
	crossorigin="anonymous"></script>

<title>나의 스탬프 보기</title>

<style type="text/css">

.row{
	text-align: center;
}
#stampArea{
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
} 
p{
	margin: 10px;
	font-size: 13px;
}

#stampArea{
	margin-bottom: 10px;
}
</style>

</head>
<body>
	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->
	
	<div class="row mb-md-5" >
		<div class="list-group list-group-horizontal col-md-4 col-sm-12 mx-auto text-center" id="myList" role="tablist">
			<a class="list-group-item list-group-item-action" id="myBadge" data-toggle="list" id="ridingGuide" href="#" role="tab">나의 뱃지</a> 
			<a class="list-group-item list-group-item-action active" id="myStamp" data-toggle="list" id="myCourse" href="#" role="tab">나의 스탬프</a>
		</div>
	</div>
	
	<!-- 컨테이너 시작 -->
	<div class="container">
		<h4 class="font-weight-bold pt-5 mb-4"><i class="fas fa-stamp"> 나의 스탬프</i></h4>
		<div class="page-info-text text-dark">내가 모은 스탬프를 볼 수 있습니다.</div>
		<hr>		
	
	
		<div class="row">
			<c:forEach var="myStamp" items="${myStampList}" varStatus="status">
				<c:set var="serial" value="${myStamp.serial}"/>						
					<c:choose>				
						<c:when test="${1 eq serial}">
							<div class="col-4" id="stampArea">
								<img alt="myStamp" src="<c:url value='/uploadfile/color_stampPhoto/${myStamp.s_photo}'/>" style="width: 150px; height: 147px;">
								<p id="stampName">${myStamp.s_name}</p>
							</div>
						</c:when>
						<c:when test="${0 eq serial}">
							<div class="col-4" id="stampArea">
								<img alt="myStamp" src="<c:url value='/uploadfile/cs_stampPhoto/${myStamp.cs_photo}'/>" style="width: 150px; height: 147px;">
								<p id="stampName">${myStamp.s_name}</p>
							</div>
						</c:when>						 									
					</c:choose>
			</c:forEach>
		</div>
		
	</div>
	
	<script>
	
	$('#myBadge').on('click', function(){
    	location.href="<c:url value='/badge/user' />";
    });
    
    $('#myStamp').on('click', function(){
    	location.href="<c:url value='/stamp/user' />"
    });  
   
    
	</script>
	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->
</body>
</html>