<%@page import="com.teamrun.runbike.user.domain.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">
    <title>Hello, world!</title>
  </head>
  <body>
<header class="d-flex align-items-center flex-md-row px-3 py-4 px-md-4 mb-md-5 bg-white border-bottom shadow-sm">
   <button class="toggle-menu-btn" id="toggle-menu">
        <span class="hamburger-bar"></span>
    </button>
    <h5 class="logo my-0 font-weight-normal">RUNBIKE</h5>
      <h5 class="page-select-name font-weight-bold mt-1">
          혼자 달리기
      </h5>
  <div class="navbar-toggle navbar-collapse" data-toggle="collapse" id="navbar">
  <nav class="mx-md-auto font-weight-bold my-2 my-md-0">
    <a class="pt-md-2 p-3-xs mx-md-3" href="#"><i class="fas fa-biking"></i>혼자 라이딩</a>
    <a class="pt-md-2 mx-md-3" href="#"><i class="fas fa-users"></i>같이 달리기</a>
    <a class="pt-md-2 mx-md-3" href="#"><i class="far fa-laugh"></i>스탬프</a>
    <a class="pt-md-2 mx-md-3" href="#"><i class="fas fa-crown"></i>나의 리워드</a>
    <a class="pt-md-2 mx-md-3" href="#"><i class="fas fa-headset"></i>문의하기</a>
  </nav>
  <div class="user-info text-primary mr-2"><a href="mypage" class="">${loginInfo.u_name} 님</a></div>
  <small><a href="logout" class="text-muted"><i class="fas fa-signout"></i>로그아웃</a></small>
    </div>
</header>
<div class="row mb-md-5">
    <div class="list-group list-group-horizontal col-md-4 col-sm-12 mx-auto text-center" role="tablist">
          <a class="list-group-item  list-group-item-action active" id="list-home-list" data-toggle="list" href="#footer" role="tab" aria-controls="">내 정보</a>
          <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="user/record" role="tab" aria-controls="">나의 기록</a>
    </div>
</div>
<div class="container">
  <h4 class="font-weight-bold pt-5 mb-4">마이 페이지</h4>
  <hr>
  <h5 class="font-weight-bold">내 정보</h5>
  <div class="row">
  	<div class="">
  		<img src="<c:url value='/uploadfile/userphoto/${loginInfo.u_photo}'/>" width="200" height="auto">
  	</div>
  	<div class="col-6">
  		${loginInfo.u_name} 님 <br>
  		${loginInfo.u_id}
  	</div>
  	<div class="col-2">
  		<button id="updateBtn" class="btn btn-primary" >정보 수정</button>
  		<button id="deleteBtn" class="btn btn-danger" data-target="#deleteChkPw" data-toggle="modal">회원 탈퇴</button>
  	</div>
  </div>
  <div id="modalUpdate" style="display: none">
  	<form id="userUpdateForm" class="form border" method="post" enctype="multipart/form-data">
  	<h5 class="font-weight-bold text-center">정보 수정</h5>
  		<div class="form-group">
  			<input type="hidden" id="u_idx" name="u_idx" value="${loginInfo.u_idx}">
  			<label>아이디 ${loginInfo.u_id}<input type="hidden" id="u_id" name="u_id" value="${loginInfo.u_id}"></label>
  			
  		</div>
  		<div class="form-group">
  			<label>이름 <input type="text" id="u_name" name="u_name" value="${loginInfo.u_name}"></label>
  		</div>
  		<div class="form-group">
  			<label>새 비밀번호 <input type="password" id="u_pw" name="u_pw"></label>
  		</div>
  		<div class="form-group">
  			<label>새 비밀번호 확인 <input type="password" id="u_repw"></label>
  		</div>
  		<div class="form-group">
  			<input type="hidden" id="oldFile" name="oldFile" value="${loginInfo.u_photo}" readonly>
  			<label>사진 <input type="file" id="u_photo" name="u_photo" value="${loginInfo.u_photo}"></label>
  		</div>
  		<div class="form-group">
  			<input type="submit" class="btn btn-sm btn-primary" value="수정완료">
  			<input type="submit" class="btn btn-sm btn-secondary" value="취소">
  		</div>
  	</form>
  </div>
<div class="modal fade" id="deleteChkPw" tabindex="-1" role="dialog" aria-labelledby="deleteUserLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteUserLabel">탈퇴하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="deleteForm" method="post">
          <div class="form-group">
            <label for="delete_u_pw" class="col-form-label">현재 비밀번호를 입력해주세요.</label>
            <input type="password" class="form-control" id="delete_u_pw" name="delete_u_pw">
          </div>
          
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-danger">탈퇴</button>
	      </div>
        </form>
      </div>
    </div>
  </div>
</div>
  <footer id="footer" class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
      <div class="col-12 col-md">
        <img class="mb-2" src="{{ site.baseurl }}/docs/{{ site.docs_version }}/assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
        <small class="d-block mb-3 text-muted">&copy; 2017-{{ site.time | date: "%Y" }}</small>
      </div>
      <div class="col-6 col-md">
        <h5>Features</h5>
        <ul class="list-unstyled text-small">
          <li><a class="text-muted" href="#">Cool stuff</a></li>
          <li><a class="text-muted" href="#">Random feature</a></li>
          <li><a class="text-muted" href="#">Team feature</a></li>
          <li><a class="text-muted" href="#">Stuff for developers</a></li>
          <li><a class="text-muted" href="#">Another one</a></li>
          <li><a class="text-muted" href="#">Last time</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>Resources</h5>
        <ul class="list-unstyled text-small">
          <li><a class="text-muted" href="#">Resource</a></li>
          <li><a class="text-muted" href="#">Resource name</a></li>
          <li><a class="text-muted" href="#">Another resource</a></li>
          <li><a class="text-muted" href="#">Final resource</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>About</h5>
        <ul class="list-unstyled text-small">
          <li><a class="text-muted" href="#">Team</a></li>
          <li><a class="text-muted" href="#">Locations</a></li>
          <li><a class="text-muted" href="#">Privacy</a></li>
          <li><a class="text-muted" href="#">Terms</a></li>
        </ul>
      </div>
    </div>
  </footer>
</div>
   <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 <script src="<c:url value='/assets/js/layout.js'/>"></script>
 
   <script src="https://kit.fontawesome.com/8653072c68.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    <script>
    
    	$(document).ready(function(){
    		var opened = false;
    		
    		
    		$('#userUpdateForm').on('submit',function(){
    			var formData = new FormData();
    			var file = $('#u_photo')[0].files[0];
    			
    			formData.append('u_idx',$('#u_idx').val());
    			formData.append('u_id',$('#u_id').val())
    			formData.append('u_name',$('#u_name').val());
    			formData.append('u_pw',$('#u_pw').val());
    			formData.append('oldFile',$('#oldFile').val());
    			if(file != undefined){
					formData.append('u_photo',file);
				}
    			
    			$.ajax({
    				enctype:'multipart/form-data',
    				type: 'POST',    				
    				url: '/runbike/user/edit',
    				data: formData,
    				contentType: false,
    				processData : false,
    				success: function(data){
    					if(data==1){
    						alert("정보가 수정되었습니다");
    						location.reload();
    					} else {
    						alert("정보 수정에 실패하였습니다.");
    					}
    				}
    			});
    			    			
    			return false;
    		});
    		
    		
    		$('#updateBtn').on('click',function(){
    			if(opened == false){
    				$('#modalUpdate').css('display','block');
    				opened = true;
    				
    			} else{
    				$('#modalUpdate').css('display','none');
    				opened = false;
    			}
    			console.log(opened);
    		});
    		
    		$('#deleteForm').on('submit',function(){
    			
    			$.ajax({
    				type: 'post',
    				url: '/runbike/user/delete',
    				data: {'delete_u_pw': $('#delete_u_pw').val()},
    				success: function(data){
    					if(data==1){
	    					if(confirm("정말로 탈퇴하시겠습니까?")){
	    						alert("탈퇴를 완료했습니다.");
	    						location.href="/runbike";
	    					} else{
	    						alert("탈퇴를 취소했습니다");
	    					}
    					} else{
    						alert("비밀번호를 다시 확인하세요.");
    					}
    				},
    				error: function(data){
    					console.log("안ㅠ됨");
    				}
    			});
    			
    			return false;
    			
    		});
    		
    	});
    </script>
  </body>
</html>