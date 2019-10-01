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
	table {
		border-collapse: collapse;
		border: 0;	
	}
	td {
		padding : 3px 10px;		
        height:50px;
   		border: 1px solid #999;

	}
	
	div#pagingBox {	
		overflow: hidden;
		margin-top:15px;
	}
	div#pagingBox>div {
		float: left;
		width: 30px;
		height: 30px;
		line-height: 30px;
		text-align: center;
		border : 1px solid #333;
		
		border-radius:10px;
		
		margin: 0 5px;
	}
	
	div.searchBox {
		margin : 15px 0;
		width : 500px;
		padding : 15px;
	}
	
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





<!-- 컨텐츠 시작 -->
<div id="contents">
	<h1>회원 리스트</h1>
	<hr>
	<table>
		<tr bgcolor="#81BEF7">
			<td>no</td>
			<td>회원번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>사진</td>
			<td>가입일</td>
			<td>이메일 인증여부 T/F</td>
			<td>sns 가입 여부</td>
			<td>회원 인증 코드</td>
			<td>회원삭제</td>
		</tr>
		
		<c:forEach items="${viewData.memberList}" var="userInfo" varStatus="stat" >
		<tr>
			<td>${viewData.no-stat.index}</td>
			<td>${userInfo.u_idx}</td>
			<td>${userInfo.u_id}</td>
			<td>${userInfo.u_name}</td>
			<td>${userInfo.u_photo}</td>
			<td>${userInfo.regdate}</td>
			<td>${userInfo.u_verify}</td>
			<td>${userInfo.u_code}</td>
			<td>${userInfo.u_sns}</td>	
			<td><a href="#" onclick="del(${userInfo.u_idx})">삭제</a></td>
		</tr>
		</c:forEach>
		
	</table>
	
	
		<div class="searchBox">
		<form>
			<select name="stype">
				<option value="both">아이디+이름</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="keyword"> <input type="submit" value="검색">
		</form>
		</div>
	
	
	
	
	<c:if test="${viewData.totalCount>0}">
	<div id="pagingBox">
		<c:forEach begin="1" end="${viewData.pageTotalCount}" var="num">
			<div><a href="managelist?p=${num}&stype=${param.stype}&keyword=${param.keyword}">${num}</a> </div> 
		</c:forEach>
		
	</div>
	</c:if>
	
</div>



<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->






<script>




//삭제
function del(u_idx){
    
    if(confirm('정말 삭제하시겠습니까?')){
       $.ajax({
            url : 'http://15.164.162.21:8080/runbike/rest/admin/'+u_idx,
            type : 'DELETE',
            success : function(data){
         
                if(data=='SUCCESS'){
                    alert('삭제가 완료되었습니다');
                    location.href= 'http://15.164.162.21:8080/runbike/adminpage/managelist';
                }          
            }
        });
       
       }
	
	
	
}





</script>














</body>
</html>