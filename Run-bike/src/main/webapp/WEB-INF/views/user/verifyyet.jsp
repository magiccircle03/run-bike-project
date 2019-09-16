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
	<h1>이메일 인증이 되지 않았습니다. 인증 후 서비스를 이용해주세요.</h1>
	<p>혹시 이메일 인증 메일을 받지 못하셨나요? 아래 버튼을 눌러 다시 재인증 해주세요.</p>
	<button type="button" id="resend" onclick="reSend('${email}')">이메일 재인증</button>
	<a href="http://localhost:8080/runbike/user/login">로그인 페이지로 이동</a>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script>

function reSend(email){
	$.ajax({			
		type: 'get',
		url: 'resend',
		data : {email: email},
		success : function(){
			alert("이메일을 보냈습니다.");
		},
		error: function(){
			alert("이메일을 보내는 데 실패했습니다. 잡시 후에 다시 이용하세요.");
		}
	});
}
</script>
</body>

</html>