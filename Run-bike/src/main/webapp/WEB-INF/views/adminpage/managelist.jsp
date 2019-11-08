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
   <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">
<style>
	h1{
		text-align:center;
	}

	table {
		table-layout:fixed;
		word-break:break-all;
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
	
/* 	div.searchBox { */
/* 		margin : 15px 243px; */
/* 		width : 500px; */
/* 		padding : 15px; */
/* 	} */

	.container {
	width:1000px;
/*   margin-right: auto; */
/*   margin-left: auto; */
}
	


	
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->



<!-- 컨텐츠 시작 -->
<div class="container table-responsive">
	<h1>회원 리스트</h1>
	<hr>
	<table class="table table-condensed table-sm">
		<tr class="table-primary">
			<td style="width:4%">no</td>
			<td style="width:9%">회원번호</td>
			<td style="width:20%">아이디</td>
			<td style="width:9%">이름</td>
			<td>사진</td>
			<td>가입일</td>
			<td>이메일 인증여부 T/F</td>
			<td>sns 가입 여부</td>
			<td>회원 인증 코드</td>
			<td style="text-align:center">회원삭제</td>
		</tr>
		
		<c:forEach items="${viewData.memberList}" var="userInfo" varStatus="stat" >
		<tr>
			<td>${viewData.no-stat.index}</td>
			<td style="text-align:center">${userInfo.u_idx}</td>
			<td>${userInfo.u_id}</td>
			<td>${userInfo.u_name}</td>
			<td>${userInfo.u_photo}</td>
			<td>${userInfo.regdate}</td>
			<td style="text-align:center">${userInfo.u_verify}</td>
			<td>${userInfo.u_code}</td>
			<td style="text-align:center">${userInfo.u_sns}</td>	
			<td style="text-align:center"><a class="btn btn-outline-primary" href="#" onclick="del(${userInfo.u_idx})">삭제</a></td>
		</tr>
		</c:forEach>
			<tr>
		<td colspan="8">&nbsp;</td>
		<td colspan="2">
		<div class="searchBox">
		<form>
			<select name="stype">
				<option value="both">아이디+이름</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="keyword"><input type="submit" class="btn btn-outline-dark float-right" value="검색">
		</form>
		</div>
		</td>
		
		</tr>
		
		
		
	</table>
	

			  
		      <c:if test="${viewData.pageTotalCount>0}">
			      	 
			    <ul class="pagination justify-content-center">
			      <li>
			        <a class="page-link" href="managelist?p=1&stype=${param.stype}&keyword=${param.keyword}">
			          <span>처음</span>
			        </a>
			      </li>	    
			            <div id="pagingBox">
							<c:forEach begin="1" end="${viewData.pageTotalCount}" var="num">
								<div><a class="page-link" href="managelist?p=${num}&stype=${param.stype}&keyword=${param.keyword}">${num}</a></div>
							</c:forEach>
						</div>
			      <li>
			        <a class="page-link" href="managelist?p=${viewData.pageTotalCount}&stype=${param.stype}&keyword=${param.keyword}">
			          <span>마지막</span>
			        </a>
			      </li>
			    </ul>
		 	</c:if>
		 	
	

	<div style="text-align:center"><a href="../adminpage/managelist">목록으로 돌아가기</a></div>	
	
</div>



<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->






<script>




//삭제
function del(u_idx){
    
    if(confirm('정말 삭제하시겠습니까?')){
       $.ajax({
            //url : 'http://localhost:8080/runbike/rest/admin/'+u_idx,
            url : '../rest/admin/'+u_idx,
            type : 'DELETE',
            success : function(data){
         
                if(data=='SUCCESS'){
                    alert('삭제가 완료되었습니다');
                   // location.href= 'http://localhost:8080/runbike/adminpage/managelist';
                    location.href= '../adminpage/managelist';
                }          
            }
        });
       
       }
	
	
	
}





</script>














</body>
</html>