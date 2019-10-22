<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	h1{
		text-align:center;
	}
	div#sub{
		text-align:right;
	}

	table {
/* 		border-collapse: collapse; */
/* 		border: 0;	 */
/* 		margin: auto; */
		table-layout:fixed;
		word-break:break-all;
	}
/* 	td { */
/* 		padding : 3px 10px;		 */
/*         height:50px; */

/* 	} */
	
	#searchBox{
		display: inline-block;
	}
	
	
	div#pagingBox {	
		overflow: hidden;
		/* margin-top:15px; */
		/* margin : 15px 1000px; */
	}
	div#pagingBox>div {
		float: left;
		width: 30px;	
	}
	


	
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->



<!-- 컨텐츠 시작 -->
<div class="container table-responsive table-hover">
	<h1>문의글 리스트</h1> 
	<div id="sub">
	<a class="btn btn-outline-primary" href="../board/writeform">글쓰기</a>  
	<a class="btn btn-primary" href="../qnaboard">문의글 관리 및 답글</a>
	</div>	
	<hr>
	<table class="table table-sm">
		<tr class="table-primary">
			<td style="width:8%">no</td>
			<td style="width:8%">글번호</td>
			<td style="width:35%">글제목</td>
			<td style="width:15%">작성자</td>
			<td style="width:15%">회원번호</td>
			<td>작성일자</td>
			
		</tr>
		<c:forEach items="${boardData.boardlistList}" var="boardInfo" varStatus="stat" >
		<tr>
			<td>${boardData.no-stat.index}</td>
			<td>${boardInfo.q_num}</td>
			<td><a href="../testdetail/${boardInfo.q_num}">${boardInfo.q_title}</a></td>   <!-- 상세보기 페이지로 이동 -->
			<td>${boardInfo.q_writer}</td>
			<td>${boardInfo.u_idx}</td>
			<td>${boardInfo.regdate}</td>
		
		</tr>
		</c:forEach>
		<tr>
		</table>
		
		<div class="searchBox float-right">
		<form>
			<select name="stype" style="width:100px;height:29px;">
				<option value="q_title">글제목</option>
				<option value="q_writer">글 작성자</option>
			</select>
			<input type="text" name="keyword"><br>
			<input type="submit" class="btn btn-outline-dark float-right" id="searchbtn" value="검색">
		</form>
		</div>
		
		<br>

		
	
	


	
			  <div class="pagination float-center">
		      <c:if test="${boardData.pageTotalCount>0}">
			      	 
			    <ul class="pagination justify-content-center">
			      <li>
			        <a class="page-link" href="boardlist?p=1&stype=${param.stype}&keyword=${param.keyword}">
			          <span>처음</span>
			        </a>
			      </li>	    
			            <div id="pagingBox">
							<c:forEach begin="1" end="${boardData.pageTotalCount}" var="num">
								<div><a class="page-link" href="boardlist?p=${num}&stype=${param.stype}&keyword=${param.keyword}">${num}</a></div>
							</c:forEach>
						</div>
			      <li>
			        <a class="page-link" href="boardlist?p=${boardData.pageTotalCount}&stype=${param.stype}&keyword=${param.keyword}">
			          <span>마지막</span>
			        </a>
			      </li>
			    </ul>
		 	</c:if>
		 </div>	
		 	
		<div style="text-align:center"><a href="../board/boardlist">전체목록으로 돌아가기</a></div>	 	
		 	
	
</div>



<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->






<script>



</script>














</body>
</html>