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

<!--폰트어썸 아이콘  -->
<script src="https://kit.fontawesome.com/ff137eb685.js"
	crossorigin="anonymous"></script>

<!-- 구글 폰트  -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">

<title>라이딩 가이드</title>

<style type="text/css">

.contents{
	margin-bottom: 50px;
	
}
.contentsName{
	font-family: 'Black Han Sans', sans-serif;
	font-size: 30px;
}

.contentsDescribe{
	color: gray;
	font-size: 15px;
	margin-top: -10px;
	margin-bottom: 10px;
}

</style>
</head>
<body>

	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->

	<!-- 하위 탭  -->
	<div class="row mb-md-5">
		<div
			class="list-group list-group-horizontal col-md-4 col-sm-12 mx-auto text-center"
			id="myList" role="tablist">
			<a class="list-group-item list-group-item-action" id="startRiding"
				data-toggle="list" href="#" role="tab">바로 시작</a> <a
				class="list-group-item list-group-item-action active"
				id="ridingGuide" data-toggle="list" id="ridingGuide" href="#"
				role="tab">라이딩 가이드</a> <a
				class="list-group-item list-group-item-action" id="myCourse"
				data-toggle="list" id="myCourse" href="#" role="tab">나의 코스</a>
		</div>
	</div>
	<!-- 하위 탭 끝  -->

	<div class="container">
		<h4 class="font-weight-bold pt-5 mb-4">
			<i class="fab fa-youtube"> 라이딩 가이드</i>
		</h4>
		<div class="page-info-text text-dark"> 라이딩을 즐기는 다양한 방법</div>
		<hr>
		
		<div class="contents">
			<div class="contentsName"> 안전하게 자전거 타기</div>
			<div class="contentsDescribe"> 자전거를 처음타는 사람을 위한 가이드</div>
			<div id="carouselExampleControls" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<iframe class="d-block w-100" width="560" height="550"
							src="https://www.youtube.com/embed/x4WHeVf5DN4" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="carousel-item">
						<iframe class="d-block w-100" width="560" height="550"
							src="https://www.youtube.com/embed/4ssLDk1eX9w" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="carousel-item">
						<iframe class="d-block w-100" width="560" height="550"
							src="https://www.youtube.com/embed/T-aeFsFHmuo" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="contents">
			<div class="contentsName"> 이 달의 라이딩 영상</div>
			<div class="contentsDescribe"> ${loginInfo.u_id}님을 위한 이 달의 라이딩 영상</div>
			<iframe class="d-block w-100" width="560" height="315"
				src="https://www.youtube.com/embed/p2xBsiNca7c" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>

		<div class="contents">
			<div class="contentsName"> 따릉이 이용하기</div>
			<div class="contentsDescribe"> 따릉이를 처음 사용하는 사람들을 위한 10분 따릉이 가이드</div>
			<div id="carouselExampleControls2" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<iframe class="d-block w-100" width="200" height="400"
							src="https://www.youtube.com/embed/WR0_11uK9ao" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="carousel-item">
						<iframe  class="d-block w-100" width="200" height="400"
							src="https://www.youtube.com/embed/aDRz_kVU6Y0" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="carousel-item">
						<iframe  class="d-block w-100" width="200" height="400"
							src="https://www.youtube.com/embed/20dt2sWw72g" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls2"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls2"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>

	<script>
		$('#startRiding').on('click', function() {
			location.href = "startRide"
		});

		$('#ridingGuide').on('click', function() {
			location.href = "ridingGuide"
		});

		$('#myCourse').on('click', function() {
			location.href = "myCourseList"
		});
	</script>

	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->
</body>
</html>