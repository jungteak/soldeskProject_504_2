<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title>인기순 영화</title>
</head>
<link href="/css/nav.css" rel="stylesheet">
<link href="/css/pager.css" rel="stylesheet">
<style>

	img {
		
	 }
	 
	#movieMenu ul li {display:inline-block;}
	
	#movieMenu ul li div {display:inline-block;}
	
	#movieMenu ul li div a {color:white; font-weight:bold; font-family:Nanum Gothic;}
	
	#movieMenu {width:1100px; overflow:hidden; margin:30px auto; background-color:#27385F;}
	
	#selectBoxoffice , #selectUpcomming {width:400px;}
	#searchWrap {width:200px;}
	#movTable {margin:auto;}
	 
	 .ticekting{
	 display:block;
	 margin:auto;
	 }
	 
	#boxOffice ul li{list-style:none;}
	  
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	$(function(){
		
			let api_key = "3f1a9babda761564c4e03796bac0c3e9";
		
			$.ajax({
				url:"https://api.themoviedb.org/3/movie/popular?api_key="+api_key+"&language=ko-KR&page=${page}",
				type:"get",
				dataType:"json"
			}).done(function(data){
				
				let str = "";
				str += "<table id='movTable'>"
				for(let i in data.results){
					let b = Number(i)+1;
					
					if(b%4==1){
						str += "<tr>";
					}
					
					if(data.results[i].poster_path!=null){
						img = "https://image.tmdb.org/t/p/original/"+data.results[i].poster_path;
					}else{
						img = "/images/noImg.JPG";
					}
					let id = data.results[i].id;
					str += "<td><ul><li><img class='poster' id="+id+" width=270 height=355 margin=50 src="+img+"></il>";
					str += "<li><button class='ticekting' title="+id+">예매하기</button></li></ul></td>";
					
					if(b%4==0){
						str += "</tr>";
					}
				}//for
				
				str += "</table>";
				$("#boxOffice").append(str);
				
			});//ajax
			
			$("#boxOffice").on("click",".poster",function(){
				let id = $(this).attr("id");
				location.href="../movie/movieInfo/"+id;
			});//posterclick
			
			$("#search").click(function(){
				let key = $("#key").val();
				if(!key){
					alert("검색어를 입력하세요!");
				}else{
					
					$.ajax({
						url:"https://api.themoviedb.org/3/search/movie?api_key="+api_key+"&query="+key+"&language=ko-KR",
						type:"get",
						dataType:"json"
					}).done(function(data){
						let totalPages = data.total_pages;
						location.href="/movie/searchList/"+key+"/"+totalPages;
					});//ajax
					
				}//if
			})//search click
			
	});
</script>
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
	<div id="movieMenu">
		<ul>
			<li id="selectBoxoffice"><div><a href="/movie/boxOffice">박스오피스</a></div></li>
			<li id="selectUpcomming"><div><a href="/movie/upComming">최신 개봉 영화</a></div></li>
			<li id="searchWrap"><div><input id="key" class="search-input" name="key" size="10"><button id="search" class="main-search-button">검색</button></div></li>
		</ul>
	</div>
	
	<div id="boxOffice">
	</div>
	<div class="pagination-wrapper">
  		<div class="pagination">
			<c:forEach begin="1" end="5" var="i">
				<c:if test="${page==i}"><a aria-current="page" class="page-numbers current" href="?p=${i}">${i}</a></c:if>
				<c:if test="${page!=i}"><a class="page-numbers" href="?p=${i}">${i}</a></c:if>
			</c:forEach>
		</div>
	</div>
</div>
</div>
</body>
</html>