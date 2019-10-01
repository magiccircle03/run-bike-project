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
		<style>
			input[type="checkbox"] + label,
		input[type="radio"] + label, input, select, label{
				color: #000;
			}
		</style>
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
					        <h2>회원가입</h2>
					        <form id="regform" method="post" enctype="multipart/form-data">
					            <div class="row gtr-uniform">
					                <div class="col-12 col-12-xsmall">
                                        <label for="u_id">아이디(이메일) *필수</label><input type="email" name="u_id" id="u_id" placeholder="example@email.com" />
                                        <input type="checkbox" id="idChkBox">
                                        <p id="idChkMsg"></p>
                                        <button type="button" id="idCheck">아이디 중복 체크</button>
                                        
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_pw">비밀번호 *필수</label>
					                    <input type="password" name="u_pw" id="u_pw" placeholder="password" />
					                    <input type="checkbox" id="pwChkBox">
					                    <p id="pwChkMsg"></p>
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_repw">비밀번호 확인 *필수</label>
					                    <input type="password" id="u_repw" name="u_repw" placeholder="confirm password" />
					                    <input type="checkbox" id="repwChkBox">
					                    <p id="repwChkMsg"></p>
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_name">이름 *필수</label>
					                    <input type="text" name="u_name" id="u_name" placeholder="name" />
					                    <input type="checkbox" id="nameChkBox">
					                    <p id="nameChkMsg"></p>
					                </div>
					                <div class="col-12 col-11-xsmall">
                                        <label for="u_photo">사진</label>
					                    <input type="file" name="u_photo" id="u_photo" placeholder="confirm password" />
					                </div>
					                <div class="col-12 col-11-xsmall">
					                	<button type="submit" class="col-6 btn-submit" style="width: 49%">회원가입</button>
					            		<button type="reset" id="btnReset" class="col-6 btn-reset" style="width: 49%">취소</button>
					                </div>
					            </div>
					            
					        </form>
					    </div>
                </section>
			</div>
			
			<script src="../assets/js/jquery.min.js"></script>
			<script>
				$(document).ready(function(){
					// 정규식
					// @ & /.com/.net/.co.kr
                    var idChk = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
                    // 8~16 대소문자, 숫자, 특수문자
                    var pwChk = /^[A-Za-z0-9가-힣~!@#$%^&*()_]{8,20}$/;
                    // 특수기호, 공백 X
                    var nameChk = /^[가-힣A-Z]{0,30}$/;
					
                    var idChkBox = $('#idChkBox');					
					var pwChkBox = $('#pwChkBox');
					var repwChkBox = $('#repwChkBox');
					var nameChkBox = $('#nameChkBox');
                    
                    
                   	// 유효성 
					function bdcRed(e){
						$(e.target).css('border','1px solid red');
					};
					
					function bdcGreen(e){
						$(e.target).css('border','1px solid green');
					}

	
					$('#u_id').on('focusout',function(e){
						if($(this).val().length > 0){
							if(!idChk.test($(this).val())){
								bdcRed(e);
								$('#idChkMsg').html('이메일 주소를 다시 확인하세요.');
								$('#idChkMsg').css('color','red');
								idChkBox.prop('checked',false);
							} else{
								bdcGreen(e);
								$('#idChkMsg').html("");
							}
						} else {
							bdcRed(e);
							$('#idChkMsg').html("필수 사항입니다.");
							$('#idChkMsg').css('color','red');
							idChkBox.prop('checked',false);
						}
					});

					$('#idCheck').click(function(){
						var u_id = $('#u_id').val();
						if($('#u_id').val() != "" && $('#u_id').val() != undefined || $('#u_id').val().length>0){
							console.log("id 들어옴");
							console.log(u_id);
							$.ajax({
								type:'GET',
								url:'http://15.164.162.21:8080/runbike/user/register/idCheck?u_id='+u_id,
								success: function(data){
									console.log(data);
									if(data == 'Y'){									
										alert("사용 가능한 아이디 입니다.");
										idChkBox.prop('checked',true);
									} else if(data == 'N') {
										alert("이미 존재하거나 탈퇴한 아이디 입니다.");
										idChkBox.prop('checked',false);
									}
								},
								error: function(data){
									console.log("실패쓰");
								}
							
							});
						} else{
							alert("아이디를 입력해주세요.");
						}
						return false;
					});
					
					
					$('#u_pw').on('focusout',function(e){
						if($(this).val().length > 0){
							if(!pwChk.test($(this).val())){
								bdcRed(e);
								$('#pwChkMsg').html('8자~20자 사이에 영어 대 소문자, 특수문자, 숫자가 반드시 포함되어야 합니다.');
								$('#pwChkMsg').css('color','red');
								pwChkBox.prop('checked',false);
							} else{
								bdcGreen(e);
								$('#pwChkMsg').html("");
								pwChkBox.prop('checked',true);
							}
						} else{
							bdcRed(e);
							$('#pwChkMsg').html("필수 사항입니다.");
							$('#pwChkMsg').css('color','red');
							pwChkBox.prop('checked',false);
						}
					});

					$('#u_repw').on('focusout',function(e){
						if($(this).val().length>0){
							if($(this).val() != $('#u_pw').val()){
								bdcRed(e)
								$('#repwChkMsg').html('입력한 비밀번호와 일치하지 않습니다. 다시 확인해주세요.');
								$('#repwChkMsg').css('color','red');
								repwChkBox.prop('checked',false);
							} else{
								bdcGreen(e);
								$('#repwChkMsg').html("");
								repwChkBox.prop('checked',true);
							}
						}
					});
					$('#u_name').on('focusout',function(e){
						if($(this).val().length>0){
							if(!nameChk.test($(this).val())){
								bdcRed(e)
								$('#nameChkMsg').html('한글 또는 영문 이름만 가능합니다.');
								$('#nameChkMsg').css('color','red');
								nameChkBox.prop('checked',false);
							} else{
								bdcGreen(e);
								$('#nameChkMsg').html("");
								nameChkBox.prop('checked',true);
							}
						} else {
							bdcRed(e);
							$('#nameChkMsg').html("필수 사항입니다.");
							$('#nameChkMsg').css('color','red');
							nameChkBox.prop('checked',false);
						}
					});
					
					
					
					$('#regform').submit(function(){
						console.log("하이 id"+idChkBox.is(':checked'));
						console.log("하이 pw"+pwChkBox.is(':checked'));
						console.log("하이 repw"+repwChkBox.is(':checked'));
						console.log("하이 name"+nameChkBox.is(':checked'));
						if(idChkBox.is(':checked') && pwChkBox.is(':checked') && repwChkBox.is(':checked') && nameChkBox.is(':checked')){	
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
								url: 'http://15.164.162.21:8080/runbike/user/register',
								contentType: false,
								processData: false,
								data : formData,
								success : function(data){
									console.log(data);
									if(data=='ok'){
										alert("회원가입이 완료되었습니다. 이메일 인증 후 이용하시기 바랍니다.");
										location.href = 'http://15.164.162.21:8080/runbike/';
										
									} else {
										alert("회원가입에 실패했습니다. 관리자에게 문의하세요.");
										history.go(-1);
									}
								}
							});
							
							
						} else{
							if(!idChkBox.is(':checked')){
								$('#u_id').css('border','1px solid red');
								$('#idChkMsg').html('이메일 주소를 다시 확인하세요.');
								$('#idChkMsg').css('color','red');
								idChkBox.prop('checked',false);
							}
							if(!pwChkBox.is(':checked')){
								$('#u_pw').css('border','1px solid red');
								$('#pwChkMsg').html('비밀번호를 다시 확인하세요.');
								$('#pwChkMsg').css('color','red');
								pwChkBox.prop('checked',false);
							}
							
							if(!repwChkBox.is(':checked')){
								$('#u_repw').css('border','1px solid red');
								$('#repwChkMsg').html('비밀번호가 일치하지 않습니다.');
								$('#repwChkMsg').css('color','red');
								repwChkBox.prop('checked',false);
							}
							
							if(!nameChkBox.is(':checked')){
								$('#u_name').css('border','1px solid red');
								$('#nameChkMsg').html('이름을 확인해주세요.');
								$('#nameChkMsg').css('color','red');
								nameChkBox.prop('checked',false);
							}
						}
						return false;
					});
					


					$('#btnReset').on('click',function(){
						location.href="http://15.164.162.21:8080/runbike/";
					})
					
					


						
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