<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>최신 개봉작</title>
</head>
<style>
	img { 
		padding:10px;
	 }
	 
	 #movieMenu ul li{display:inline-block;}
	 
	 li{list-style:none}
	 
	 .ticekting{
	 display:block;
	 margin:auto;
	 }
	 
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	$(function(){
		
			let api_key = "3f1a9babda761564c4e03796bac0c3e9";
		
			$.ajax({
				url:"https://api.themoviedb.org/3/movie/upcoming?api_key="+api_key+"&language=ko-KR&page=${page}",
				type:"get",
				dataType:"json"
			}).done(function(data){
				
				let str = "";
				str += "<table>"
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
					str += "<td><ul><li><img class='poster' id="+id+" width=300 height=400 margin=50 src="+img+"></il>";
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
					
				}
			})//search click
			
	});
</script>
<body>
<div id="container">

<div id="body">
	<div id="movieMenu">
		<ul>
			<li><a href="/movie/boxOffice">박스오피스</a></li>
			<li><a href="/movie/upComming">최신 개봉 영화</a></li>
			<li><a href="/movie/nowPlaying">현재 상영중</a></li>
			<li><input id="key" name="key" size="10"><button id="search">검색</button></li>
		</ul>
	</div>
	<div id="boxOffice" align="center">
	
	</div>
	<div id="page" align="center">
			<c:forEach begin="1" end="5" var="i">
				<a href="?p=${i}">${i}</a>
			</c:forEach>
	</div>
</div>
</div>
</body>
</html>