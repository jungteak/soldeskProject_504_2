<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title>메인페이지</title>
<style>

	*{padding:0;margin:0}
	li{list-style:none}
	a{text-decoration:none;font-size:14px}
		
	.menu {
	  width: 800px;
	  overflow: hidden;
	  margin: 50px auto 50px auto;
	}
	
	.menu > li {
	  width: 20%; /*20*5=100%*/
	  float: left;
	  text-align: center;
	  line-height: 40px;
	  background-color: #5778ff;
	}
	
	.menu a {
	  color: #fff;
	}
	
	.submenu > li {
	  line-height: 50px;
	  background-color: #94a9ff;
	}
	
	.submenu {
	  height: 0; /*ul의 높이를 안보이게 처리*/
	  overflow: hidden;
	}

	
	.menu > li:hover {
	  background-color: #94a9ff;
	  transition-duration: 0.5s;
	}
	
	.menu > li:hover .submenu2 {
	  height: 100px; /*서브메뉴 li한개의 높이 50*5*/
	  transition-duration: 1s;
	}
	
	.menu > li:hover .submenu4 {
	  height: 200px; /*서브메뉴 li한개의 높이 50*5*/
	  transition-duration: 1s;
	}
	
	#footer {width:1000px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	function gotoMain() {
	  location.href="/mainpage";
	}//gotoMain
	
	$(function(){
		
	
	})//ready
	
</script>
</head>
<body>
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
		</div>
		<div id="logoImg" align="center">
			<img id="logo" onclick="gotoMain()" src="/images/logo.JPG">
		</div>
		<div id="nav">
			<ul class="menu">
		      <li>
		        <a href="#">영화</a>
		        <ul class="submenu">
		          <li><a href="#">영화</a></li>
		          <li><a href="#">추천영화</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">예매</a>
		        <ul class="submenu">
		          <li><a href="#">영화별 예매</a></li>
		          <li><a href="#">극장별 예매</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">게시판</a>
		        <ul class="submenu">
		          <li><a href="#">영화 후기 게시판</a></li>
		          <li><a href="#">이벤트/공지사항</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">고객센터</a>
		        <ul class="submenu">
		          <li><a href="#">자주 묻는 질문</a></li>
		          <li><a href="#">문의 게시판</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">마이페이지</a>
		        <ul class="submenu">
		          <li><a href="#">내 정보 확인/수정</a></li>
		          <li><a href="#">예매 확인/취소</a></li>
		          <li><a href="#">포인트 적립/사용 내역</a></li>
		          <li><a href="#">내 활동 내역</a></li>
		        </ul>
		      </li>
		    </ul>
		</div>
		<div align="center">hellohello</div>
	</div>
	<div id="body">
	</div>
	<div id="footer">
		<img src="/images/footer1.jpg">
		<img src="/images/footer2.jpg">
		<img src="/images/footer3.jpg">
	</div>
</div>
</body>
</html>