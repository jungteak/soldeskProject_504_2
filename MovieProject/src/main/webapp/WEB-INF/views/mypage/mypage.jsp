<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<link href="/css/mypage.css" rel="stylesheet">
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	function gotoMain() {
		location.href = "/mainpage";
	}//gotoMain

	$(function() {

	})//ready
</script>

</head>
<body>
	<div id='wrapper'>
		<div id="container">
			<div id="header">
				<div id="login/join" align="right">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="user" />
						<a>${user.username}님</a>
						<a href="/logout">로그아웃</a>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<a href="/login">로그인</a>
						<a href="/insertMember">회원가입</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="user" />
						<li><a href="/mypage">마이페이지</a>
					</sec:authorize>
					<br>
				</div>
				<div id="logoImg" align="center">
					<img id="logo" onclick="gotoMain()" src="/images/logo.JPG">
				</div>
				<div id="nav">
					<ul class="menu">
						<li><a href="/updateMember">내 정보 확인 / 수정</a></li>
						<li><a href="/mytkList">예매 확인 / 취소</a></li>
						<li><a href="/myboardList">내 활동내역</a></li>
					</ul>
				</div>
		</div>
	</div>

	<footer>
		<table id="serviceCenter">
			<tr>
				<td>
					<div>
						<ul>
							<a href="/inqubd/inqubdList">
							<li><img src="/images/service.png" width="100" height="100">
							</li>고객 센터</a>
							<li>								
							</li>
						</ul>
					</div>
				</td>
				<td>
					<div>
						<ul>
							<a href="/qnabd/qnabdList">
							<li><img src="/images/qnabd.png" width="100" height="100">
							</li>자주 묻는 질문</a>
						</ul>
					</div>
				</td>
				<td>
					<div>
						<ul>
							<a href="/inqubd/inqubdList">
							<li><img src="/images/inqubd.png" width="100" height="100">
							</li>
							<li>
								<div>문의 게시판</div>
							</li>
						</ul>
					</div>
				</td>
			</tr>
		</table>
	</footer>
</body>
</html>