<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이 달리기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.right{
	text-align: right;
}
</style>
</head>
<body>
<div class="container">
	<div class="right"><a class="btn" data-toggle="modal" data-target="#createPartyModal">방 만들기</a></div>
	<div id="partyListContainer">
		<div id="partyList">
		* 만들어진 방의 리스트
		</div>
		<p id="pageArea"></p>
	</div>

	<!-- 모달시작 -->
	<div class="modal fade" id="createPartyModal" tabindex="-1" role="dialog" aria-labelledby="createPartyTitle" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="createPartyTitle">방만들기</h4>
	      </div>
		  <form id="createForm">
	      <div class="modal-body">
	        
	        	<input id="p_name" name="p_name" type="text" placeholder="방 제목"><br>
	        	<input id="p_content" name="p_name" type="text" placeholder="방 내용"><br>
	        	<!-- 여기에 지도 띄우기 -->
	        	
	        	<input id="p_start_info" name="p_start_info" type="text" placeholder="시작지 정보"> 
	        	<input id="p_end_info" name="p_end_info" type="text" placeholder="도착지 정보"><br>
	        	출발 예정 시간 <input id="p_time" name="p_time" type="datetime-local"> <br>
				<input id="p_capacity" name="p_name" type="number" placeholder="최대 인원"><br>
				<input id="p_password" name="p_password" type="text" placeholder="비밀번호(최대16자)"><br>
	        	
	      </div>
	      <div class="modal-footer">
	        <button id="createPartyBtn" type="button" class="btn">방 만들기</button>
	      </div>
	      
	     </form>
	    </div>
	  </div>
	</div>
	<!-- 모달끝 -->
	
	
</div><!-- 컨테이너 끝 -->

<script>

</script>
</body>
</html>