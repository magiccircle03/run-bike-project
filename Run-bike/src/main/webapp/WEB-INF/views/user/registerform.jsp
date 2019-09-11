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
					        <form id="regform" method="post" enctype="multipart/form-data">
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
					                    <input type="password" id="u_repw" value="" placeholder="confirm password" />
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_name">이름</label>
					                    <input type="text" name="u_name" id="u_name" value="" placeholder="name" />
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_photo">사진</label>
					                    <input type="file" name="u_photo" id="u_photo" value="" placeholder="confirm password" />
					                </div>
					                <div class="col-12 col-11-xsmall">
					                	<button type="submit" class="col-6 btn-submit">회원가입</button>
					            		<button type="reset" class="col-6 btn-reset">취소</button>
					                </div>
					            </div>
					            
					        </form>
					    </div>
                </section>
			</div>
			
			<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
			<script>
				$(document).ready(function(){
					
					$('#regform').submit(function(){
						var formData = new FormData();
						var file = $('#u_photo')[0].files[0];
						
						formData.append('u_id',$('#u_id').val());
						formData.append('u_pw',$('#u_pw').val());
						formData.append('u_name',$('#u_name').val());
						if(file != undefined){
							formData.append('u_photo',file);
						}
						
						$.ajax({			
							type: 'POST',
							enctype: 'multipart/form-data',
							url: 'http://localhost:8080/runbike/user/register',
							contentType: false,
							processData: false,
							data : formData,
							success : function(data){
								console.log(data);
								if(data=='ok'){
									alert("회원가입이 완료되었습니다. 이메일 인증 후 이용하시기 바랍니다.");
									location.href = 'http://localhost:8080/runbike/';
									
								} else {
									alert("회원가입에 실패했습니다. 관리자에게 문의하세요.");
									history.go(-1);
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