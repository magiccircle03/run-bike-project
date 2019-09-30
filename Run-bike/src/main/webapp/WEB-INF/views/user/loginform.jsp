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
		 
		<style>
		
			
			html,body{
				font-size: 14px;
			}
			
			button{
				border: none;
				box-shadow: none;
				background-color: initial;
				max-width: none;
			}
			input[type="checkbox"] + label,
		input[type="radio"] + label, input, select, label{
				color: #000;
			}
			input[type=""]
			.header-section {
				height: 142px;
				position: absolute;
				width: 100%;
				z-index: 9;
			}
			
			.header-section:after {
				position: absolute;
				left: 0;
				top: 0;
				width: 100%;
				height: 100%;
				background: rgba(0, 0, 0, 0.5);
				content: "";
				z-index: -1;
			}
			
			.main-menu {
				position: relative;
				padding-top: 55px;
			}
			
			.main-menu .logo {
				position: absolute;
				left: 50%;
				top: 30px;
				margin-left: -42.5px;
			}
			
			.main-menu .logo a {
				display: block;
				width: 85px;
				height: 85px;
			}
			
			.main-menu ul {
				list-style: none;
				text-align: right;
				margin-left: 200px;
			}
			
			.main-menu ul li {
				float: none;
				display: inline-block;
				padding: 4px;
			}
			
			.main-menu ul li a {
				color: #fff;
				display: block;
				font-size: 13px;
				font-weight: 500;
				text-transform: uppercase;
			}
			
			.main-menu ul li:nth-child(1) {
				float: left;
				margin-right: 40px;
				padding: 4px;
			}
			
			.main-menu ul li:nth-child(2) {
				float: left;
				margin-right: 20px;
				padding: 4px;
			}
			
			.main-menu ul li:nth-child(3) {
				float: left;
				padding: 4px;
			}
			
			.main-menu ul li:nth-child(4) {
				margin-right: 35px;
				padding: 4px;
			}
			
			.main-menu ul li:nth-child(5) {
				margin-right: 35px;
				padding: 4px;
			}
			
			.main-menu ul .search-btn {
				color: #fff;
				cursor: pointer;
				margin-left: 152px;
			}
			
			.slicknav_menu {
				display: none;
			}
			
			#page-wrapper{
			    position: relative;
			}
			section#modal-register{
			    position: absolute;
			    left: 50%;
			    top: 10%;
			    transform: translatex(-50%);
			    z-index: 500;
			    background-color: #fff;
			    border-radius: 8px;
			    color: #000;
			}
			
			section#modal-register button{
				width: 100%;
				font-size: 16px;
				transition: all 0.2s;
			}
			
			section#modal-register button:hover, section#modal-register button:active{
				opacity: 0.8;
			}
			
			#modal-register h2{
			    text-align: center;
			    margin-bottom: 30px;
			}
			
			section#modal-register .inner{
			    padding: 20px;
			}
			
			section#modal-register form{
			    color: #000;
			}
			section#modal-register form input[type="text"]{
				box-shadow: none;
			}
			#regform #idCheck{
				background-color: #555;
			}
			
			#regform button.btn-submit,#loginForm button.btn-submit{
				background-color: #555;
			}
			
			#regform button.btn-reset{
				background-color: #f00;
			}
			
			section.loginbox{
				display: none;
			}
			
			.not-user a{
				display: block;
				text-align: center;
				padding: 1em;
				font-size: 16px;
				letter-spacing: 2px;
				color: #fff;
				border-radius: 5px;
				background-color: #ccc;
			}
			.submit-wrapper{
				margin: 20px 0;
			}
			#naver_id_login{
				margin-top: 12px;
			}
			#naver_id_login::before{
				display: inline-block;
				float: left;
				content:'네이버로 간편 로그인 하세요.';
				font-size: 14px;
				
			}
			
			#naver_id_login a{
				float: right;
			}
			@media screen and (max-width: 767px){
			    section#modal-register{			
			        width: 80%;
			        transform: translateX(-50%);
			    }
			    
			    section#modal-register button{
					width: 100%;
					font-size: 14px;
				}
			}
			
						
		</style>
	</head>
	<body class="landing is-preload">
	<script>
				
			</script>
		
		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					

				<!-- Banner -->
					<section id="banner">
						<div class="inner">
							<h2>RUN BIKE</h2>
							<p>Another fine responsive<br />
							site template freebie<br />
							crafted by <a href="http://html5up.net">HTML5 UP</a>.</p>
							<ul class="actions special">
								<li><a href="#" class="button primary">시작하기</a></li>
							</ul>
						</div>
					</section>
					<section id="modal-register">
					    <div class="inner">
					        <h2 class="pb-2">로그인</h2>
					        <form id="loginForm" method="post">
					            <div class="row gtr-uniform">
					                <div class="col-12 col-12-small">
                                        <label for="u_id">아이디(이메일)</label><input type="text" name="u_id" id="u_id" value="" placeholder="example@email.com" />
					                </div>
					                <div class="col-12 col-12-small">
                                        <label for="u_pw">비밀번호</label>
					                    <input type="password" name="u_pw" id="u_pw" value="" placeholder="password" />
					                </div>
					                <div class="col-12 col-12-small">
					                    <input type="checkbox" name="rememberid" id="rememberid" />
					                    <label for="rememberid">아이디 기억하기</label>
					                </div> 
					                <div class="col-12 submit-wrapper">
					                	<button type="submit" class="btn btn-secondary btn-submit" style="">로그인</button>
					                	<div id="naver_id_login"></div>
					                </div>
					            </div>
					            <div class="not-user">
					            	<p class="label-reg" style="text-decoration: underline">아직 회원이 아니신가요?</p>
					            	<a class="btn btn-reg" href="http://localhost:8080/runbike/user/register">회원가입</a>
					            </div>
					        </form>
					    </div>
                </section>
			</div>
			<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
			<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
			
			<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
			<script type="text/javascript">
			
				var naver_id_login = new naver_id_login("bGcr_qQ18WcY_tp0AIjX", "http://localhost:8080/runbike/user/login");
			  	var state = naver_id_login.getUniqState();
			  	
			  	naver_id_login.setButton("green",2, 45);
			  	naver_id_login.setDomain("http://localhost:8080/runbike/user/login");
			  	naver_id_login.setState(state);
			  	naver_id_login.init_naver_id_login();
			  	
			  	
			    // 네이버 사용자 프로필 조회
			    naver_id_login.get_naver_userprofile("naverSignInCallback()");
			    
			    
			    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
			    function naverSignInCallback() {
			    	var email = naver_id_login.getProfileData('email');
			    	var name = naver_id_login.getProfileData('name');
			    	var image = naver_id_login.getProfileData('profile_image');
			    	
			    	$.ajax({
			    		type:'GET',
						url:'http://localhost:8080/runbike/user/register/idCheck?u_id='+email,
						success: function(data){
							console.log(data);
							// 기존 아이디가 없을 경우 회원가입
							if(data == 'Y'){			
								$.ajax({
									type:'POST',
									url: 'http://localhost:8080/runbike/user/login/naver',
									data: {u_id: email, u_pw: "naverPassword123",u_name: name, image: image},
									success: function(data){
										if(data == 'Y'){
											location.href = 'http://localhost:8080/runbike/record/startRide';
										} 
									},
									error: function(data){
										console.log("실패");
									}
								});
							// 기존 아이디가 있을 경우 로그인
							} else if(data == 'N') {
								$.ajax({			
									type: 'POST',
									data: {u_id: email, u_pw: "naverPassword123"},
									url: 'http://localhost:8080/runbike/user/login',
									success : function(data){
										console.log(data);
										if(data=='ok'){
											location.href = 'http://localhost:8080/runbike/record/startRide';									
										} else {
											alert("로그인에 실패했습니다. 아이디 혹은 비밀번호를 확인해주세요.");
										}
									}
								});
							}
						},
						error: function(data){
							console.log("실패쓰");
						}
			    	})
			    }
			</script>
			
			<script>
				$(document).ready(function(){
					
					
					
					$('#loginForm').submit(function(){
						
						var uId = $('#u_id');
						var uPw = $('#u_pw');
						
						if(uId != "" && uPw !="" ){
							var form = $('#loginForm').serialize(); 
							$.ajax({			
								type: 'POST',
								data: $('#loginForm').serialize(),
								url: 'http://localhost:8080/runbike/user/login',
								success : function(data){
									console.log(data);
									if(data=='ok'){
										location.href = 'http://localhost:8080/runbike/record/startRide';									
									} else if(data=='yet'){
										location.href='http://localhost:8080/runbike/verify/'+data;
									} else if(data == 'leave'){
										alert("이미 탈퇴한 회원입니다.");
									} else if(data =='admin'){
										//location.href='http://localhost:8080/runbike/verify/'+data;
									} else {
										alert("로그인에 실패했습니다. 아이디 혹은 비밀번호를 확인해주세요.");
									}
								}
							});
						}
						return false;
					});
						
					
					
				});
			</script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>