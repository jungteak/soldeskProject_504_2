<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		
		$("#login").click(function(){
			location.href="/login";
		});
		
	})//ready

</script>
<body>
<h3>해당 이름과 이메일로 가입한 아이디입니다.</h3>
<c:forEach items="${idList}" var="list">
	<div align="center">${list}</div>
</c:forEach>
<button id="login">로그인하기</button>
</body>
</html>