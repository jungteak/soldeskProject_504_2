<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title>메인페이지</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400');

#header {margin-bottom:30px;}
#body {margin-bottom:30px;}
#footer {border-width:1px 0px 0px 0px; border-style:solid; border-color:gray;}
#footer #serviceCenter {padding-top:20px;}
#footer #serviceCenter ul li {list-style:none; text-align:center;}
#footer #serviceCenter ul li div {font-weight:bold; font-family:Nanum Gothic;}
#footer #serviceCenter {width:100%; margin:auto;}
#footer #serviceCenter tr td {width:33%;}
#footer #serviceCenter tr td div ul{width:150px; margin:auto;}
#footer #serviceCenter tr td div ul li{cursor:pointer;}

.menu {
  background: #8DA9EA;
  height: 4rem;
}
.menu ol {
  list-style-type: none;
  margin: 0 auto;
  padding: 0;
}
.menu > ol {
  max-width: 1400px;
  padding: 0 2rem;
  display: flex;
}
.menu > ol > .menu-item {
  flex: 1;
  padding: 0.75rem 0;
}
.menu > ol > .menu-item:after {
  content: "";
  margin:auto;
  position: absolute;
  left:0;
  right:0;
  margin:auto;
  width: 100%;
  height: 4px;
  bottom: 5px;
  background: #FFF;
  will-change: transform;
  transform: scale(0);
  transition: transform 0.2s ease;
}
.menu > ol > .menu-item:hover:after {
  transform: scale(1);
}
.menu-item {
  position: relative;
  line-height: 2.5rem;
  text-align: center;
}
.menu-item a {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  display: block;
  color: #FFF;
  font-weight:bold;
  font-family: "Nanum Gothic", sans-serif;
}
.sub-menu .menu-item {
  padding: 0.75rem 0;
  background: #C3D1F1;
  opacity: 0;
  transform-origin: bottom;
  animation: enter 0.2s ease forwards;
}
.sub-menu .menu-item:nth-child(1) {
  animation-duration: 0.2s;
  animation-delay: 0s;
}
.sub-menu .menu-item:nth-child(2) {
  animation-duration: 0.3s;
  animation-delay: 0.1s;
}
.sub-menu .menu-item:nth-child(3) {
  animation-duration: 0.4s;
  animation-delay: 0.2s;
}
.sub-menu .menu-item:hover {
  background: #355EBC;
}
.sub-menu .menu-item a {
  padding: 0 0.75rem;
}
@media screen and (max-width: 600px) {
  .sub-menu .menu-item {
    background: #C3D1F1;
  }
}

@media screen and (max-width: 600px) {
  .menu {
    position: relative;
  }
  .menu:after {
    content: "";
    position: absolute;
    top: calc(50% - 2px);
    right: 1rem;
    width: 30px;
    height: 4px;
    background: #FFF;
    box-shadow: 0 10px #FFF, 0 -10px #FFF;
  }
  .menu > ol {
    display: none;
    background: #8DA9EA;
    flex-direction: column;
    justify-content: center;
    height: 100vh;
    animation: fade 0.2s ease-out;
  }
  .menu > ol > .menu-item {
    flex: 0;
    opacity: 0;
    animation: enter 0.3s ease-out forwards;
  }
  .menu > ol > .menu-item:nth-child(1) {
    animation-delay: 0s;
  }
  .menu > ol > .menu-item:nth-child(2) {
    animation-delay: 0.1s;
  }
  .menu > ol > .menu-item:nth-child(3) {
    animation-delay: 0.2s;
  }
  .menu > ol > .menu-item:nth-child(4) {
    animation-delay: 0.3s;
  }
  .menu > ol > .menu-item:nth-child(5) {
    animation-delay: 0.4s;
  }
  .menu > ol > .menu-item + .menu-item {
    margin-top: 0.75rem;
  }
  .menu > ol > .menu-item:after {
    left: auto;
    right: 1rem;
    bottom: calc(50% - 2px);
  }
  .menu > ol > .menu-item:hover {
    z-index: 1;
  }
  .menu:hover > ol {
    display: flex;
  }
  .menu:hover:after {
    box-shadow: none;
  }
}

.sub-menu {
  position: absolute;
  width: 100%;
  top: 100%;
  left: 0;
  display: none;
  z-index: 1;
}
.menu-item:hover > .sub-menu {
  display: block;
}

@media screen and (max-width: 600px) {
  .sub-menu {
    width: 100vw;
    left: -2rem;
    top: 50%;
    transform: translateY(-50%);
  }
}

html, body {
  font-size: 16px;
  font-family: "Fira Mono", monospace;
  margin: 15px;
}

* {
  box-sizing: border-box;
}
*:before, *:after {
  box-sizing: inherit;
}

a {
  text-decoration: none;
}

@keyframes enter {
  from {
    opacity: 0;
    transform: scaleY(0.98) translateY(10px);
  }
  to {
    opacity: 1;
    transform: none;
  }
}
@keyframes fade {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
	#loginMenu {margin:2px;}
	#loginMenu a,span {color:black; font-size:15px; padding-bottom: 5px;}
	#loginMenu a:link {text-decoration: none;}
	#loginMenu a:visited {text-decoration: none;}
	#loginMenu a:hover {text-decoration:underline;}
	#loginMenu a:active {text-decoration:underline;}
	
	#loginMenu span {font-weight:bold};
	#loginMenu a:hover #loginMenu a {text-decoration:underline;}
	#logoImg {margin:5px; cursor:pointer;}
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
		<div id="loginMenu" align="right">
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="user" />
				<span>${user.username} 님</span>
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
		<nav class="menu">
			<ol>
		      <li class="menu-item">
		        <a href="#">영화</a>
		        <ol class="sub-menu">
		          <li class="menu-item"><a href="#">영화</a></li>
		          <li class="menu-item"><a href="#">추천영화</a></li>
		        </ol>
		      </li>
		      <li class="menu-item">
		        <a href="#">예매</a>
		        <ol class="sub-menu">
		          <li class="menu-item"><a href="#">영화별 예매</a></li>
		          <li class="menu-item"><a href="#">극장별 예매</a></li>
		        </ol>
		      </li>
		      <li class="menu-item">
		        <a href="#">게시판</a>
		        <ol class="sub-menu">
		          <li class="menu-item"><a href="#">영화 후기 게시판</a></li>
		          <li class="menu-item"><a href="#">이벤트/공지사항</a></li>
		        </ol>
		      </li>
		      <li class="menu-item">
		        <a href="#">고객센터</a>
		        <ol class="sub-menu">
		          <li class="menu-item"><a href="#">자주 묻는 질문</a></li>
		          <li class="menu-item"><a href="#">문의 게시판</a></li>
		        </ol>
		      </li>
		      <sec:authorize access="!hasAuthority('ROLE_ADMIN')">
		      <li class="menu-item">
		        <a href="#">마이페이지</a>
		        <ol class="sub-menu">
		          <li class="menu-item"><a href="#">내 정보 확인/수정</a></li>
		          <li class="menu-item"><a href="#">예매 확인/취소</a></li>
		          <li class="menu-item"><a href="#">내 활동 내역</a></li>
		        </ol>
		      </li>
		      </sec:authorize>
		      <sec:authorize access="hasAuthority('ROLE_ADMIN')">
		      <li class="menu-item">
		        <a href="#">관리자메뉴</a>
		        <ol class="sub-menu">
		          <li class="menu-item"><a href="#">극장정보 관리</a></li>
		          <li class="menu-item"><a href="#">예매정보 관리</a></li>
		          <li class="menu-item"><a href="#">회원정보 관리</a></li>
		        </ol>
		      </li>
		      </sec:authorize>
		    </ol>
		</nav>
	</div>
	<div id="body">
	hellohello
	</div>
	<div id="footer">
		<table id="serviceCenter">
			<tr>
			<td>
				<div>
					<ul>
						<li>
							<img src="/images/service.png" width="100" height="100">
						</li>
						<li>
							<div>고객 센터</div>
						</li>
					</ul>
				</div>
			</td>
			<td>
				<div>
					<ul>
						<li>
							<img src="/images/qnabd.png" width="100" height="100">
						</li>
						<li>
							<div>자주 묻는 질문</div>
						</li>
					</ul>
				</div>
			</td>
			<td>
				<div>
					<ul>
						<li>
							<img src="/images/inqubd.png" width="100" height="100">
						</li>
						<li>
							<div>문의 게시판</div>
						</li>
					</ul>
				</div>
			</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>