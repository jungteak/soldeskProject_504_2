<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	 #movieMenu ul li{display:inline-block;}
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	$(function(){
		
			let api_key = "3f1a9babda761564c4e03796bac0c3e9";
			let totalPages= 0;
			
			$.ajax({
				url:"https://api.themoviedb.org/3/search/movie?api_key="+api_key+"&query=${key}&language=ko-KR&page=${page}",
				type:"get",
				dataType:"json"
			}).done(function(data){
				
				let list = "<div id='searchList'><table>";
				
				for (let i in data.results){
					let img = "";
					if(data.results[i].poster_path!=null){
						img = "https://image.tmdb.org/t/p/original/"+data.results[i].poster_path;
					}else{
						img = "/images/noImg.JPG";
					}
					let id = data.results[i].id;
					let title = data.results[i].title;
					let reg_date = data.results[i].release_date;
					let overview = data.results[i].overview;
					
					list += "<tr><td><img width=80 height=100 src="+img+" id="+id+" class='poster'></td>";
					list += "<td><ul><li>"+title+"</li>";
					if(reg_date!=""){
						list += "<li>"+reg_date+"</li>";
					}
					if(overview!=""){
						list += "<li>"+overview+"</li>";
					}
				}
				
				list += "</ul></td></tr></table></div>";
				
				$("#searchList").append(list);
				
				
			});//ajax
			
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
			
			$("#searchList").on("click",".poster",function(){
				let id = $(this).attr("id");
				location.href="../../movieInfo/"+id;
			});//posterclick
			
	});
</script>
<script>
//
</script>
<title>검색 결과</title>
</head>
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
	<c:if test="${totalPages==0}">
		<h3>검색 결과가 없습니다.</h3>
	</c:if>
	<c:if test="${totalPages!=0}">
		<div align="center"><h3>포스터를 클릭하면 상세정보로 이동합니다.</h3></div>
		<div id="searchList">
			
		</div>
		<div id="page" align="center">
			<c:if test="${begin > pageNum }">
				<a href="?p=${begin-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin }" end="${end}" var="i">
				<a href="?p=${i}">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages }">
				<a href="?p=${end+1}">[다음]</a>
			</c:if>
		</div>
	</c:if>
</div>
</div>
</body>
</html>