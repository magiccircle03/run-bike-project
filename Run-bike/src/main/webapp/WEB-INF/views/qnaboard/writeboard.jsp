<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
	div#page-header{
			width:500px;
        	height:500px;
        	margin:auto;   
	}
	
 	div#boardwriteform{ 
 			width:800px; 
 			margin:auto; 
 	}
	
	#writebtn{
 		width:80px;
 		margin:auto;
 	}
	
/* 	div#form-group{ */
/* 		width:400px; */
/* 	} */
    

    </style>
</head>

<body>




<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->








<div id="boardwriteform">
			<div class="page-header">
		
	     	<h1>게시글 작성</h1>
			</div>
			<hr>

	     <!-- 파일 업로드 기능을 구현할 시에는 <form> 태그안에 반드시  enctype="multipart/form-data"를 작성해주어야 하고, 용량이 크기 때문에 method는 반드시 post로 작성해야 합니다. -->
	     <form id="regform" method="post" onsubmit="return false;" >           <!-- action="qnaboard/writepro" -->
	            	<!-- user테이블의 u_idx를 임의 지정 -->
	          <input type="hidden" value="${loginInfo.u_idx}" name="u_idx" id="u_idx">
	           <input type="hidden" name="q_num" id="q_num" value="1">
	       <table id=writeTable>
		       	<tr>
		            <td id="title">작성자</td>
		             <c:choose>
    				<c:when test="${loginInfo.u_id == 'admin'}">	
		            <td><input type="text" name="q_writer" id="q_writer" class="form-control" value="관리자" readonly/></td>
		            </c:when>
		            <c:when test="${loginInfo.u_id != 'admin'}">
		            <td><input type="text" name="q_writer" id="q_writer" class="form-control" value="회원${loginInfo.u_idx}번" readonly/></td>
	       			</c:when>
   					 </c:choose>
	       		</tr>
	       		<tr>
	       		  	<td id="title">제 목</td>
           			<td> <input type="text" name="q_title" id="q_title" class="form-control" placeholder="제목을 입력하세요" required/></td>     
	       		</tr>
	       		<tr>
	       			  <td id="title"> 내 용</td>
	       			  <td> <textarea name="q_content" id="q_content" class="form-control" cols="70" rows="15" placeholder="내용을 입력하세요" required></textarea></td>
	       		</tr>
		         <tr>
				  <td>&nbsp;</td>
		          <td><input id="writebtn" type="submit" value="등록" onclick="formSubmit();"></td>
		        </tr>
	    
   			 </table>    
    		</form>


      		</div>

	    





<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->



 


    <script>


         $(document).ready(function() {

        });
       
        
        
        
        
	  function formSubmit() {
	        	
	        	
	       
	        	
	            var formData = new FormData();
	            formData.append('u_idx', $('#u_idx').val());
	            formData.append('q_num', $('#q_num').val());
	            formData.append('q_writer', $('#q_writer').val());
	            formData.append('q_title', $('#q_title').val());
	            formData.append('q_content', $('#q_content').val());
	          
	            //alert($('#regform').serialize());
	            

	        	if($("#q_title").val() == ""){
	        		  alert("제목을 입력해주세요.");
	        		  $("q_title").focus();
	        			return false;
	        	}
	        	if($("#q_content").val() == ""){
	        		alert("내용을 입력해주세요.");
	        		 $("q_content").focus();
	          	return false;         
	        		
	        	}        
	            
	            $.ajax({
	                //url: 'http://localhost:8080/runbike/board/writeform',
	                 url: '../board/writeform',
	                type: 'POST',
	                processData: false,  
	                contentType: false,  
	                data: formData,
	                success : function(data){
	

	                	 alert("글 등록이 완료되었습니다");
	                 	//location.href= 'http://localhost:8080/runbike/qnaboard';
	                	 location.href= '../qnaboard';
	                }
	                
	            });
	  }
        
        

        
    </script> 




</body>

</html>