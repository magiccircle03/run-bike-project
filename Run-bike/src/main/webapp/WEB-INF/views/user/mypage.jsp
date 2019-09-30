<%@page import="com.teamrun.runbike.user.domain.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<link href="https://fonts.googleapis.com/css?family=Anton|Exo&display=swap" rel="stylesheet">
<title>Hello, world!</title>
<style>
	
	#list-tab a{
		padding: .5rem
	}
	.img-wrapper{
		overflow:hidden;
		width: 200px;
		height: 200px;
		margin: 0 auto;
		border-radius:100px;
	}
	#updateBtn{
		margin: 0 auto;
	}
	
	.tab-pane.fade{
		display: none;
		transition: all .1s;
	}
	.tab-pane.show{
		display: block;
	}
	.none-record-status{
		text-align: center;
	}
	
	.none-record-status{
		padding: 50px 10px
	}
	#record-wrapper h4{
		margin: 20px 0;
	}
	
	
	.none-record-status a{
		display: inline-block;
		padding: 10px;
		text-align:center;
		margin-top: 80px;
		background-color: #007bff;
		width: 60%;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		
	}	
	#record-wrapper .row .card{
		border: none;
		text-align: center;
	}
	#record-status strong{
		font-family: 'Anton', sans-serif;
		font-size: 50px;
		height: 200px;
		line-height: 200px;
	}
	#record-status .card:first-child strong{
		font-size: 60px;
		
	}
	
	#record-status strong span{
		padding-left: 15px;
		font-size: 35px;
	}
	#record-status .card p{
		font-family: 'Exo', sans-serif;
	}
	
	@media screen (max-width: 767px){
		#record-status strong{
			font-size: 40px;
		}
		
		#record-status strong span{
			padding-left: 5px;
			font-size: 20px;
		}
	}
</style>
</head>
<body>
	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->
	<!-- 페이지 tab 시작 -->
	<div class="mb-md-5">
		<div
			class="list-group list-group-horizontal col-md-4 col-sm-12 mx-auto text-center pr-0"
			role="tablist">
			<a class="list-group-item list-group-item-action active"
				id="list-profile-list" data-toggle="tab" href="#myprofile" role="tab"
				aria-controls="">내 정보</a> 
			<a
				class="list-group-item list-group-item-action" role="tab"
				id="list-record-list" data-toggle="tab" href="#myrecord"
				aria-controls="">나의 기록</a>
		</div>
	</div>
	<!-- 페이지 tab 끝 -->
	<!-- container 시작 -->
	<div class="container px-1">
		<div id="myprofile" class="tab-pane active fade show pb-5" role="tabpanel" aria-labelledby="list-profile-list">
			<h4 class="font-weight-bold pt-5 mb-4">마이 페이지</h4>
			<h5 class="font-weight-bold">내 정보</h5>
			<hr>
			<div>
				<div class="img-wrapper text-center">
					<c:choose>
					<c:when test = "${fn : contains(loginInfo.u_id, '@naver.com')}">
						<img
						src="${loginInfo.u_photo}" align="center" width="auto" height="200px">
					</c:when>
					<c:otherwise>
						<img
						src="<c:url value='/uploadfile/userphoto/${loginInfo.u_photo}'/>" align="center" width="auto" height="200px">
					</c:otherwise>
					</c:choose>
				</div>
				<div class="row-profile-name text-center pt-4 gtr-uniform">
					<strong>${loginInfo.u_name} 님</strong>
					<p> ${loginInfo.u_id}</p>
					<p> 회원 가입일 : ${loginInfo.regdate}</p>
				</div>
				<div class="text-center">
					<button id="updateBtn" class="btn btn-outline-secondary col-6" data-target="#modalUpdate" data-toggle="modal">프로필 편집</button>
					<button id="deleteBtn" class="btn btn-danger"
						data-target="#deleteChkPw" data-toggle="modal">회원 탈퇴</button>
				</div>
			</div>
			
			<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="updateUserLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="updateUserLabel">프로필 편집</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
						</div>
						<div class="modal-body">
							<form id="userUpdateForm" class="form" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<input type="hidden" id="u_idx" name="u_idx"
										value="${loginInfo.u_idx}"> 
									<label class="col-form-label" for="u_id">아이디
									</label>
									<input type="text" id="u_id" class="form-control" name="u_id"
										value="${loginInfo.u_id}" readonly>
				
								</div>
								<div class="form-group">
									<label class="col-form-label" for="u_name">이름 </label>
									<input type="text" id="u_name" class="form-control" name="u_name"
										value="${loginInfo.u_name}">
								</div>
								<div class="form-group">
									<label class="col-form-label" for="u_pw">새 비밀번호 </label>
									<input type="password" id="u_pw" class="form-control" name="u_pw">
								</div>
								<div class="form-group">
									<label class="col-form-label" for="u_repw">새 비밀번호 확인 </label>
									<input type="password" id="u_repw" class="form-control">
								</div>
								<div class="form-group">
									<input type="hidden" id="oldFile" class="form-control" name="oldFile"
										value="${loginInfo.u_photo}" readonly> <label class="col-form-label" for="u_photo">사진</label>
									<input
										type="file" id="u_photo" name="u_photo"
										value="${loginInfo.u_photo}">
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" value="저장">
									<input type="reset" data-dismiss="modal" class="btn btn-outline-black" value="취소">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="deleteChkPw" tabindex="-1" role="dialog"
				aria-labelledby="deleteUserLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="deleteUserLabel">탈퇴하기</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="deleteForm" method="post">
								<div class="form-group">
									<label for="delete_u_pw" class="col-form-label">현재 비밀번호를
										입력해주세요.</label> <input type="password" class="form-control"
										id="delete_u_pw" name="delete_u_pw">
								</div>
	
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-danger">탈퇴</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="myrecord" class="tab-pane fade" role="tabpanel" aria-labelledby="list-record-list">
			<h4 class="font-weight-bold pt-5 mb-4">나의 기록</h4>
			<hr>
			<section id="record-wrapper">
				
				<div id="user-record-wrapper">
					<h4 class="col-12"><i class="fas fa-biking"></i> 혼자 라이딩</h4>
					<div id="user-record">
						<div class="row col-12 gtr-uniform">
							<div class="col-12">
								<div class="card card-record-view"><strong id="totalKM"><span>KM</span></strong><p>라이딩 총 KM</p></div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-3"><div class="card card-record-view"><strong id="totalCount"><span>회</span></strong><p>라이딩 총 횟수</p></div></div>
							<div class="col-sm-12 col-md-6 col-lg-3"><div class="card card-record-view"><strong id="totalTime"><span>분</span></strong><p>라이딩 총 시간</p></div></div>
							<div class="col-sm-12 col-md-6 col-lg-3"><div class="card card-record-view"><strong id="avgKM"><span>KM</span></strong><p>라이딩 평균 KM</p></div></div> 
							<div class="col-sm-12 col-md-6 col-lg-3"><div class="card card-record-view"><strong id="avgTime"><span>분</span></strong><p>라이딩 평균 시간</p></div></div> 
							
							<div class="row col-12 gtr-uniform">
								<h4 class="col-12">최근 기록</h4>
								<table id="recent-record" class="table">
									
								</table>
							</div>
						</div>
					</div>
					<div class="none-record-status" id="user-record-status">
						<h3 class="font-weight-bold mx-auto mt-3 text-center">아직 기록이 없습니다.</h3>
						<p class="text-center">새롭게 달려보는 건 어떠세요?</p>
						<a href="<c:url value='/record/startRide'/>" class="">라이딩 시작!</a>
					</div>					
				</div>
				<div id="party-record-wrapper" style="border-top: 1px dotted #ccc">
					<h4 class="col-12"><i class="fas fa-users"></i> 같이 달리기</h4>
					<div id="party-record">
						
						<!-- 	
						<table class="table" id="party-list"></table> -->
					</div>
					<div class="none-record-status" id="party-record-status">
						<h3 class="font-weight-bold mx-auto mt-3 text-center">아직 기록이 없습니다.</h3>
						<p class="text-center">다른 회원님과 함께 달려보는 건 어떠세요?</p>
						<a href="<c:url value='/party'/>" class="">같이 달리기 시작!</a>
					</div>
				</div>	
			</section>
		</div>
		<footer id="footer" class="pt-4 my-md-5 pt-md-5 border-top">
			<div class="row">
				<div class="col-12 col-md">
					<img class="mb-2"
						src="{{ site.baseurl }}/docs/{{ site.docs_version }}/assets/brand/bootstrap-solid.svg"
						alt="" width="24" height="24"> <small
						class="d-block mb-3 text-muted">&copy; 2017-{{ site.time |
						date: "%Y" }}</small>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/assets/js/layout.js'/>"></script>

	<script src="https://kit.fontawesome.com/8653072c68.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<script>
    
    	$(document).ready(function(){
    		var u_idx = ${loginInfo.u_idx};
    		var datalist = "";
    		
    		// 회원 기록 가져오기
    		$.ajax({
    			type: 'GET',
    			url: '/runbike/user/record/'+u_idx,
    			success: function(data){
    				if(data.userRecord.total_count>0){
    					$('#user-record-status').css('display','none');
    					$('#user-record').css('display','block');
    					$('#totalCount').prepend(data.userRecord.total_count);
    					$('#totalKM').prepend(data.userRecord.total_KM);
    					$('#totalTime').prepend(data.userRecord.total_time);
    					$('#avgKM').prepend(data.userRecord.avg_KM);
    					$('#avgTime').prepend(data.userRecord.avg_time);
    					
    				
    					var table = $('#recent-record');
    					var html = '';
    					
    					html +='<thead class="thead-dark ">';
    					html +='<tr>';
    					html +='<th>idx</th>';
    					html +='<th>라이딩 거리</th>';
    					html +='<th>라이딩 시간</th>';
    					html +='<th>완주 여부</th>';
    					html +='<th>라이딩 날짜</th>';
    					html +='</tr>';
    					html +='</thead>';
    					html+='<tbody>';
    					
    					
    					var idx = data.recentRecord.length;
    					
    					for(var i in data.recentRecord){
    						
    						html +='<tr>';
    						html +='<td>'+ (idx--) +'</td>';
        					html +='<td>';
        					html += data.recentRecord[i].r_riding_km;
        					html += '</td>';
        					html +='<td>'+ data.recentRecord[i].r_riding_time +'</td>';
        					html +='<td>'+data.recentRecord[i].r_finish+'</td>';
        					html +='<td>'+data.recentRecord[i].r_riding_date+'</td>';
        					html +='</tr>';
    					}
    					
    					html +='</tbody>';
    					
    					table.html(html);
    					
    					
    				} else{
    					$('#user-record-status').css('display','block');
    					$('#user-record').css('display','none');
    				}
    				console.log(data.partyRecord[0].cnt);
    				if(data.partyRecord[0].cnt>0){
    					$('#party-record-status').css('display','none');
    					$('#party-record').css('display','block');
    					
    					var html = '';
    					
    					var ix = data.partyRecord.length;
    					
    					for(var j in data.partyRecord){
    						$('#party-record-status').css('display','none');
        					$('#party-record').css('display','block');
    						html+='<h5>총 러닝 횟수 '+data.partyRecord[j].cnt+'</h5>';
    						html+='<p>참여했던 방 정보입니다.</p>'
    						html += '<div class="card">';
    						html += '<div class="row no-gutters">';
    						html+='<div class="col-1 pt-5">'+(ix--)+'</div>'
    						html+=	'<div class="card-body col-11">';
    						html+=	'<small class="text-mute">'+data.partyRecord[j].p_time+'</small>';
    						html+=	'<h5 class="card-title bold">'+data.partyRecord[j].p_name+'</h5>';
    						html+=	'<p class="card-title">출발지 - '+data.partyRecord[j].p_start_info+'</p>';
    						html+=	'<p>도착지 - '+data.partyRecord[j].p_end_info+'</p>';
    						html+=	'<p class="card-text">총 거리 - '+data.partyRecord[j].p_riding_km+'km</p>';
    						html+=	'<small class="text-mute text-info">'+data.partyRecord[j].pc_finishYN+'</small>';
    						html+=	'</div>';
    						html+=  '</div>';
    						
    					}
    					
    					
    					$('#party-record').html(html);
    					
    					
    				} else{
    					$('#party-record-status').css('display','block');
    					$('#party-record').css('display','none');
    				}
    			}
    		});
    		
    		
    		
    		// 회원 정보 업데이트 기능
    		$('#userUpdateForm').on('submit',function(){
    			if($('#u_name').val()!= "" && $('#u_pw').val != "" && $('#u_repw').val() == $('#u_pw').val()){
	    			var formData = new FormData();
	    			var file = $('#u_photo')[0].files[0];
	    			formData.append('u_idx',$('#u_idx').val())
	    			formData.append('u_id',$('#u_id').val())
	    			formData.append('u_name',$('#u_name').val());
	    			formData.append('u_pw',$('#u_pw').val());
	    			formData.append('oldFile',$('#oldFile').val());
	    			console.log(formData);
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
	    					console.log(data);
	    					if(data==1){
	    						alert("정보가 수정되었습니다");
	    						location.reload();
	    					} else {
	    						alert("정보 수정에 실패하였습니다.");
	    					}
	    				}
	    			});
    			} else{
    				
    			}   
    			return false;
    		});
    		
    		
    		
    		
    		// 회원 탈퇴 기능
    		$('#deleteForm').on('submit',function(){
    			$.ajax({
    				url: '/runbike/user/chkMaster/'+u_idx,
    				success: function(data){
    					console.log(data);
    					if(data !='Y'){
    						if(confirm("정말로 탈퇴하시겠습니까?")){
    							$.ajax({
        		    				type: 'post',
        		    				url: '/runbike/user/delete/'+u_idx,
        		    				data: {'delete_u_pw': $('#delete_u_pw').val()},
        		    				success: function(data){
        		    					if(data==1){
        			    					alert("탈퇴를 완료했습니다.");
        			    					location.href="/runbike/";
        		    					} else{
        		    						alert("비밀번호를 다시 확인하세요.");
        		    					}
        		    				},
        		    				error: function(data){
        		    					console.log("안ㅠ됨");
        		    				}
        		    			});
    						} else{
    							alert("탈퇴를 취소했습니다.")
    						}
    						
    					} else if (data =='Y'){
    						alert('방장은 탈퇴가 불가능합니다. 다른 회원에게 위임 또는 라이딩을 종료한 후에 탈퇴하실 수 있습니다.');
    					}
    				}
    			});
    			return false;
    		});
    		
    		$('.modal').on('hidden.bs.modal', function(){
    		    $(this).find('form')[0].reset();
    		});
    		
    	});
    </script>
</body>
</html>