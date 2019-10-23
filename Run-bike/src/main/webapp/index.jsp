<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Spectral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<c:url value='/assets/css/main.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>" />
		<style>
			body{
			}
			section#banner{
				position: relative;
				
			}
			section#banner #bgVideo{
				position: fixed;
				right: 0;
				bottom: 0;
				min-width: 100%;
				min-height: 100%;				
			}
			@media screen and (max-width: 736px){
				section#banner{
					min-height: none;
					height: 100vh;
				}
				
			}
			.inner{
				position: absolute;
				left: 50%;
				top: 50%;
				transform: translate(-50%,-50%);
			}
		</style>
	</head>
	<body class="landing is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					

				<!-- Banner -->
					<section id="banner">
						<video autoplay muted loop id="bgVideo">
							<source src="<c:url value='assets/video/Bicycles.mp4'/>" type="video/mp4">
						</video>
						<div class="inner">
							<h2>RUNBIKE</h2>
							<p>Life is like riding a bicycle.<br>
To keep your balance, <br> you must keep moving.</p>
							<ul class="actions special">
							<c:choose>
								<c:when test="${loginInfo ne null}">
									<li><a href="<c:url value='record/startRide'/>" class="button primary">시작하기</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="<c:url value='user/login'/>" class="button primary">시작하기</a></li>
								</c:otherwise>
							</c:choose>
							</ul>
						</div>
					</section>
					
			</div>
			<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
			<script src="<c:url value='assets/js/jquery.scrollex.min.js'/>"></script>
			<script src="<c:url value='assets/js/jquery.scrolly.min.js'/>"></script>
			<script src="<c:url value='assets/js/browser.min.js'/>"></script>
			<script src="<c:url value='assets/js/breakpoints.min.js'/>"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>