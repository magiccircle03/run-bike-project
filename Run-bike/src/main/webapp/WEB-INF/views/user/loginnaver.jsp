<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다.

	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
	// 접근 토큰 값 출력
		var naver_id_login = new naver_id_login("bGcr_qQ18WcY_tp0AIjX", "http://localhost:8080/runbike/user/login/");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain("http://localhost:8080/runbike/user/login");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	
		
	  alert(naver_id_login.oauthParams.access_token);
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
	    alert(naver_id_login.getProfileData('email'));
	  }
	</script>
</body>
</html>