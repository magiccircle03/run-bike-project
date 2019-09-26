<%@page import="com.teamrun.runbike.user.domain.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">
<title>Hello, world!</title>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/header.jsp"%>
	<div class="row mb-md-5">
		<div
			class="list-group list-group-horizontal col-md-4 col-sm-12 mx-auto text-center"
			id="list-tab" role="tablist">
			<a class="list-group-item list-group-item-action active"
				id="list-home-list" data-toggle="list" href="" role="tab"
				aria-controls="home">바로 시작</a> <a
				class="list-group-item list-group-item-action"
				id="list-profile-list" data-toggle="list" href="#list-profile"
				role="tab" aria-controls="profile">러닝 가이드</a> <a
				class="list-group-item list-group-item-action"
				id="list-messages-list" data-toggle="list" href="#list-messages"
				role="tab" aria-controls="messages">나의 코스</a>
		</div>
	</div>
	<div class="container">
		<h4 class="font-weight-bold pt-5 mb-4">라이딩 시작하기</h4>
		<div class="page-info-text text-dark">어쩌고 저쩌고</div>
		<hr>
		<div class="card-deck mb-3 text-center">
			<div class="card mb-4 shadow-sm">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">Free</h4>
				</div>
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						$0 <small class="text-muted">/ mo</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>10 users included</li>
						<li>2 GB of storage</li>
						<li>Email support</li>
						<li>Help center access</li>
					</ul>
					<button type="button"
						class="btn btn-lg btn-block btn-outline-primary">Sign up
						for free</button>
				</div>
			</div>
			<div class="card mb-4 shadow-sm">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">Pro</h4>
				</div>
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						$15 <small class="text-muted">/ mo</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>20 users included</li>
						<li>10 GB of storage</li>
						<li>Priority email support</li>
						<li>Help center access</li>
					</ul>
					<button type="button" class="btn btn-lg btn-block btn-primary">Get
						started</button>
				</div>
			</div>
			<div class="card mb-4 shadow-sm">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">Enterprise</h4>
				</div>
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						$29 <small class="text-muted">/ mo</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>30 users included</li>
						<li>15 GB of storage</li>
						<li>Phone and email support</li>
						<li>Help center access</li>
					</ul>
					<button type="button" class="btn btn-lg btn-block btn-primary">Contact
						us</button>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/views/frame/footer.jsp"%>
	
	</div>
	<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/assets/js/layout.js'/>"></script>
</body>
</html>