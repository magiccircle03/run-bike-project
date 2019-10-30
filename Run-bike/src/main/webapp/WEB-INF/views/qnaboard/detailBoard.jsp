<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
   <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">
    <style>



	td{
	white-space: nowrap;
	}



</style>













</head>
<body>


<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->





<div id="detailFrame" class="container table-responsive">
			<div class="page-header">
		
	     	<h1>문의글 상세보기</h1>
			</div>

	     <!-- 파일 업로드 기능을 구현할 시에는 <form> 태그안에 반드시  enctype="multipart/form-data"를 작성해주어야 하고, 용량이 크기 때문에 method는 반드시 post로 작성해야 합니다. -->
	     <form id="detailForm" method="post" onsubmit="return false;" >           <!-- action="qnaboard/writepro" -->
	            	<!-- user테이블의 u_idx를 임의 지정 -->
	   		
	          <input type="hidden" name="u_idx" id="u_idx" class="form-control" value="${detailData.u_idx}" readonly/>   
	           

	       <table id=detailTable class="table">
		       
		       <tr>
		            <td id="title">글번호</td>
		             <td> <input type="text" name="q_num" id="q_num" class="form-control" value="${detailData.q_num}" readonly/></td>    
	       		 	<td id="title">작성자</td>
		             <td> <input type="text" name="q_writer" id="q_writer" class="form-control" value="${detailData.q_writer}" readonly/></td>    
	       		</tr>
	       		<tr>
	       		  	<td id="title">제목</td>
           			<td> <input type="text" name="q_title" id="q_title" class="form-control" value="${detailData.q_title}" readonly/></td>     
	       		</tr>
	       		<tr>
	       			 <td id="title"> 내용</td>  
	       			 <td> <textarea name="q_content" id="q_content" class="form-control" cols="70" rows="15" readonly>${detailData.q_content}</textarea></td>
	       		</tr>
   			 </table>    
    		</form>


      		</div>
      		
      		
      		
      		
      		
      		
      		
      		
    




<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->



















</body>
</html>