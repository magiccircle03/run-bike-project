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
					        <h3>로그인</h3>
					        <form id="loginForm" method="post">
					            <div class="row gtr-uniform">
					                <div class="col-12 col-12-xsmall">
                                        <label for="u_id">아이디(이메일)</label><input type="email" name="u_id" id="u_id" value="" placeholder="example@email.com" />
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_pw">비밀번호</label>
					                    <input type="password" name="u_pw" id="u_pw" value="" placeholder="password" />
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
					            <button type="submit"  class="col-4">로그인</button>
					            <a href="">카카오로 로그인</a>
					            <div class="not-user row">
					            	<p class="label-reg">아직 회원이 아니신가요?</p>
					            	<a class="col-12" href="http://localhost:8080/runbike/user/register">회원가입</a>
					            </div>
					        </form>
					    </div>
                </section>
			</div>
			
			<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
			<script>
				$(document).ready(function(){
					
					$('#loginForm').submit(function(){
						
						/* var formData = new FormData();
						formData.append('u_id',$('#u_id').val());
						formData.append('u_pw',$('#u_pw').val()); */
						var form = $('#loginForm').serialize(); 
						$.ajax({			
							type: 'POST',
							data: $('#loginForm').serialize(),
							url: 'http://localhost:8080/runbike/user/login',
							success : function(data){
								console.log(data);
								if(data=='ok'){
									alert("환영합니다.");
									location.href = 'http://localhost:8080/runbike/main';
									
								} else if(data=='yet'){
									location.href='http://localhost:8080/runbike/verify/'+data;
								} else {
									
									alert("로그인에 실패했습니다. 아이디 혹은 비밀번호를 확인해주세요.");
								}
							
							}
						});
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