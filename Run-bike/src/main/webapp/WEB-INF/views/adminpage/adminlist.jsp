<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
 <script src="<c:url value='/assets/js/layout.js'/>"></script>
   <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">
    <style>

    </style>
</head>
<body>


<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->

		<ul>
		<li><a href="<c:url value='stamp.jsp' />">스탬프관리</a></li>
		<li><a href="<c:url value='badge.jsp' />">뱃지관리</a></li>	
		</ul>


			<div id="memberalllist">
			<h1>회원 리스트</h1>
<!-- 			<div id="memberlistAdmin"></div> -->
			</div>
		<table id="admin_memberlist" class="table"></table>
			





<script>
			$(document).ready(function(){
				list();		
		        
			});
		    
			//회원리스트
		    function list(){
		        
		    	
		    	$.ajax({
					url : 'http://localhost:8080/runbike/adminpage/list',
					type : 'GET',
					success : function(data){
		                
		                var html = '';
		                var table = $('#admin_memberlist');
		                
		                html +='<thead class>';
    					html +='<tr>';
    					html +='<th>idx</th>';
    					html +='<th>아이디</th>';
    					html +='<th>이름(닉네임)</th>';
    					html +='<th>사진</th>';
    					html +='<th>가입일자</th>';
    					html +='<th>이메일 인증 여부 T/F</th>';
    					html +='<th>sns 가입 여부</th>';
    					html +='<th>회원 인증 코드</th>';
    					html +='<th>회원 삭제</th>';
    					html +='</tr>';
    					html +='</thead>';
		                
	    					html+='<tbody>';
			                
				                for(var i=0; i<data.length;i++){
				                	html += '<tr>';
				                	
				                    html += '<div class="card">\n';
				                    html += '<td>' + data[i].u_idx +'</td>';
				                    html += '<td>' + data[i].u_id +'</td>';
				                    html += '<td>' + data[i].u_name +'</td>';
				                    html += '<td>' + data[i].u_photo +' </td>';
				                    html += '<td>' + data[i].regDate + ' </td>';
				                    html += '<td>' + data[i].u_verify + '</td>';
				                    html += '<td>' + data[i].u_sns + ' </td>';
				                    html += '<td>' + data[i].u_code + '</td>';
				                    html += '<td><button onclick="del('+ data[i].u_idx +')">삭제하기</button></td><br>\n';
				                   
				                    html += '</div>\n';
				                    html +='</tr>';
				                }
			                html+= '</tbody>';
			                //$('#memberlistAdmin').html(html);
			                table.html(html);
					}
				
		            });
		         }

					
			
			//삭제
		    function del(u_idx){
		        
		        if(confirm('정말 삭제하시겠습니까?')){
		           $.ajax({
		                url : 'http://localhost:8080/runbike/rest/admin/'+u_idx,
		                type : 'DELETE',
		                success : function(data){
		             
		                    if(data=='SUCCESS'){
		                        alert('삭제가 완료되었습니다');
		                        list();
		                    }          
		                }
		            });
		           
		           
		           }
				
				
				
		    }

			
    
</script>







</body>
</html>