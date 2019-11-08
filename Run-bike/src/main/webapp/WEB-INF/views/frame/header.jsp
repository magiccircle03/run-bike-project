<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<c:url value='/assets/js/layout.js'/>"></script>
<script src="https://kit.fontawesome.com/8653072c68.js"></script>

<header class="d-flex align-items-center flex-md-row px-3 py-4 px-md-4 mb-md-5 bg-white border-bottom shadow-sm">
   <button class="toggle-menu-btn" id="toggle-menu">
        <span class="hamburger-bar"></span>
    </button>
     <c:choose>
    	<c:when test="${loginInfo.u_id == 'admin'}">
   	 		<h5 class="logo my-0 font-weight-normal"><a href="<c:url value='/record/startRide' />">RUNBIKE</a></h5>
   	 	</c:when>
   	 	<c:when test="${loginInfo.u_id != 'admin'}">
   	 		<h5 class="logo my-0 font-weight-normal"><a href="<c:url value='/adminpage/managelist' />">RUNBIKE</a></h5>
   	 	</c:when>
   	 </c:choose>
      <h5 class="page-select-name font-weight-bold mt-1">
          	
      </h5>
  <div class="navbar-toggle navbar-collapse" data-toggle="collapse" id="navbar">
  <nav class="mx-md-auto font-weight-bold my-2 my-md-0">   
    <c:choose>
    	<c:when test="${loginInfo.u_id == 'admin'}">
        <a class="pt-md-2 mx-md-3" href="<c:url value='/adminpage/managelist' />"><i class="fas fa-headset"></i>회원 관리</a> 
        <a class="pt-md-2 mx-md-3" href="<c:url value='/board/boardlist' />"><i class="fas fa-headset"></i>문의하기</a>   	
    	</c:when>
    	<c:when test="${loginInfo.u_id != 'admin'}">
    	 <a class="pt-md-2 p-3-xs mx-md-3" href="<c:url value='/record/startRide' />"><i class="fas fa-biking"></i>혼자 라이딩</a>
   		 <a class="pt-md-2 mx-md-3" href="<c:url value='/party' />"><i class="fas fa-users"></i>함께 라이딩</a>
    	<a class="pt-md-2 mx-md-3" href="<c:url value='/stamp/getStamp' />"><i class="far fa-laugh"></i>스탬프</a>
    	<a class="pt-md-2 mx-md-3" href="<c:url value='/badge/user' />"><i class="fas fa-crown"></i>나의 리워드</a>
    	 <a class="pt-md-2 mx-md-3" href="<c:url value='/board/boardlist' />"><i class="fas fa-headset"></i>문의하기</a>   	
    	
    	</c:when>
    </c:choose>
  </nav>
  <div class="user-info text-primary mr-2"><a href="<c:url value='/user/mypage' />" class="">${loginInfo.u_name} 님</a></div>
  <small><a href="<c:url value='/user/logout' />" class="text-muted"><i class="fas fa-signout"></i>로그아웃</a></small>
    </div>
</header>