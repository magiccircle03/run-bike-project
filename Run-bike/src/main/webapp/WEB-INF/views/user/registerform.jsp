<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	</head>
	<body class="landing is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					

				<!-- Banner -->
					<section id="banner">
						<div class="inner">
							<h2>Spectral</h2>
							<p>Another fine responsive<br />
							site template freebie<br />
							crafted by <a href="http://html5up.net">HTML5 UP</a>.</p>
							<ul class="actions special">
								<li><a href="#" class="button primary">Activate</a></li>
							</ul>
						</div>
					</section>
					<section id="modal-register">
					    <div class="inner">
					        <h3>회원가입</h3>
					        <form id="regform" method="post" action="#" enctype="multipart/form-data">
					            <div class="row gtr-uniform">
					                <div class="col-12 col-12-xsmall">
                                        <label for="u_id">아이디(이메일)</label><input type="email" name="u_id" id="u_id" value="" placeholder="example@email.com" />
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_pw">비밀번호</label>
					                    <input type="password" name="u_pw" id="u_pw" value="" placeholder="password" />
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_repw">비밀번호 확인</label>
					                    <input type="password" name="u_repw" id="u_repw" value="" placeholder="confirm password" />
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_name">이름</label>
					                    <input type="text" name="u_name" id="u_name" value="" placeholder="name" />
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_photo">사진</label>
					                    <input type="file" name="u_photo" id="u_photo" value="" placeholder="confirm password" />
					                </div>
					                <div class="col-4 col-12-small">
					                    <label for="chkid">아이디 저장</label>
					                    <input type="checkbox" name="chkid" id="chkid" />
					                    
					                </div>
					                <div class="col-4 col-12-small">
					                    <input type="checkbox" name="rememberid" id="rememberid" />
					                    <label for="rememberid">아이디 기억하기</label>
					                    
					                </div>
					                
					                
					            </div>
					            <button type="submit" class="col-4">회원가입</button>
					            <button type="reset" class="col-4">취소</button>
					        </form>
					    </div>
                </section>
			</div>

			<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
			
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>