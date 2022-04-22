<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>영화 정보</title>
<style>
	
	td {padding:10px;}
	
	.poster {padding:10px;}
	
	#movieMenu ul li{display:inline-block;}
	
	#gallery_wrap{ margin: 0 auto; width: 450px;}
	#gallery_wrap .bx-wrapper{margin-bottom: 20px;}
	#gallery_wrap ul li {list-style:none;}
	.slider-pager{text-align: center;}
	.slider-pager li{display: inline;}
	
	
	
	/* div #img {
    	overflow: scroll;
    	border:solid 1px green;
    	height: 300px;
    	width: 1400px;
	} */

</style>
</head>
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="/css/jquery.bxslider.min.css">
<link rel="stylesheet" href="/css/summary.css">
<script>
	$(function(){
			
			let api_key = "3f1a9babda761564c4e03796bac0c3e9";
		
			$.ajax({
				url:"https://api.themoviedb.org/3/movie/"+${id}+"?api_key="+api_key+"&language=ko-KR",
				type:"get",
				dataType:"json"
			}).done(function(data){
				
				let genres = "";
				for(let i in data.genres){
					if(data.genres!=""){
						if(i == data.genres.length-1){
							genres += data.genres[i].name;
						}else{
							genres += data.genres[i].name+"/";
						}//if
					}//if
				}//for
				
				if(data.poster_path!=null){
					img = "https://image.tmdb.org/t/p/original/"+data.poster_path;
				}else{
					img = "/images/noImg.JPG";
				}//if
				
				let str = "<table border='1'><tr><td><img width=300 height=400 margin=50 src="+img+" onerror=this.src='/images/noImg.JPG'></td>";
				str += "<td><ul style='list-style-type:none;'><li>제목 : "+data.title+"</li>";
				if(data.release_date!=""){
					str += "<li>개봉일 : "+data.release_date+"</li>";
				}
				if(genres!=""){
					str += "<li>장르 : "+genres+"</li>";
				}
				if(data.runtime!=0&&data.runtime!=null){
					str += "<li>상영 시간 : "+data.runtime+"</li><br>";
				}
				if(data.tagline!=""){
					str += "<li>"+data.tagline+"</li>";
				}
				if(data.overview!=""){
					str += "<li>줄거리 : "+data.overview+"</li><br>";
				}
				
				str += "<li>평점 : "+data.vote_average+"</li>";
				if(data.vote_count==0){
					str += "<li>평점 참여 인원이 없습니다.</li>";
				}
				
				str += "</ul></td></tr></table>";
				
				$("#posterNinfo").append(str);
				
			})//infoAjax 

			$.ajax({
				url:"https://api.themoviedb.org/3//movie/"+${id}+"/credits?api_key="+api_key+"&language=ko-KR",
				type:"get",
				dataType:"json"
			}).done(function(data){
				
				let str = "";
				if(data.cast!=""){
					str += "<h3>등장인물</h3><table border='1'><tr>";
					
					for(let i in data.cast){
						if(i==8){
							break;
						}
						let img = "";
						if(data.cast[i].profile_path!=null){
							img = "https://image.tmdb.org/t/p/original/"+data.cast[i].profile_path;
						}else{
							img = "/images/noImg.JPG";
						}//if
						str += "<td><img class='peopleImg' width=100 height=133 margin=50 src="+img+"><div class='name'>"+data.cast[i].name+"</div></td>";
					}//for
				}//if 등장인물 정보 출력
				
				str += "</tr></table>";
				$("#actors").append(str);
				
					if(data.crew!=""){
						for(let i in data.crew){
							let chk = 0;
							let img = "";
							if(data.crew[i].department=="Directing"&&data.crew[i].job=="Director"){
								if(chk==0){
									str = "";
									str += "<h3>감독</h3><table border='1'><tr>";
									chk = 1;
								}
								if(data.crew[i].profile_path!=null){
									img = "https://image.tmdb.org/t/p/original/"+data.crew[i].profile_path;
								}else{
									img = "/images/noImg.JPG";
								}//if
								str += "<td><img width=100 height=133 margin=50 src="+img+"><div class='name'>"+data.crew[i].name+"</div></td>";
							}
						}//for
					str += "</tr></table>";
					$("#director").append(str);
				}//if 감독 정보 출력
				
				
				
			})//CreditAjax
		

			/* $.ajax({
				url:"https://api.themoviedb.org/3/movie/"+${id}+"/images?api_key="+api_key,
				type:"get",
				dataType:"json"
			}).done(function(data){
				
				if(data.posters!=""){
				$("#img").prepend("<h3>사진</h3>");
				let str = "";
				let str_pager = "";
				
				for(let i in data.posters){
					let img = "https://image.tmdb.org/t/p/original/"+data.posters[i].file_path;
					str += "<li><img class='poster' width=250 height=400 margin=5 src="+img+"></li>";
					str_pager += "<li><a href='#' data-slide-index="+i+"><img src="+img+" width=54 height=72></a></li>";
				}//for
				
				
				$(".slider-gallery").append(str);
				$(".slider-pager").append(str_pager);
					
				}//if
				
			})//img Ajax
			
		
			
			$('.slide_gallery').bxSlider({
				auto: true,
				autoControls: false,
				pagerCustom: '.slider-pager'
			});//bxSlider */
				
			
			
				
			
			
		
		
			$.ajax({
				url:"https://api.themoviedb.org/3/movie/"+${id}+"/videos?api_key="+api_key+"&language=ko-KR",
				type:"get",
				dataType:"json"
			}).done(function(data){
				if(data.results!=""){
					$("#trailer").append("<h3>예고편</h3>");
					let str = "";
					for(let i in data.results){
						let url = "https://www.youtube.com/embed/"+data.results[0].key+"?mute=0";
						str += "<details><summary>"+data.results[i].name+"<hr></summary>";
						str += "<iframe width='1195' height='672' src="+url+
						" frameborder='0' gesture='media' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe><hr></details>";
					}
			
					$("#trailer").append(str);
				}//if
				
			})//trailerAjax
			
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
		<div id="posterNinfo">
		</div>
		<div id="people">
			<table>
				<tr>
					<td><div id="actors"></div></td>
					<td><div id="director"></div></td>
				</tr>
			</table>
		</div>
		<div id="img">
			<div id="gallery_wrap">
				<ul class="slider-gallery">
					<li><img src="/images/pic_1.jpg" alt="사진1"></li>
					<li><img src="/images/pic_2.jpg" alt="사진2"></li>
					<li><img src="/images/pic_3.jpg" alt="사진3"></li>
					<li><img src="/images/pic_4.jpg" alt="사진4"></li>
					<li><img src="/images/pic_5.jpg" alt="사진5"></li>
				</ul>
				<ul class="slider-pager">
					<li><a href="#" data-slide-index="0">
						<img src="/images/pic_t1.jpg" alt="사진1"></a>
					</li>
					<li><a href="#" data-slide-index="1">
						<img src="/images/pic_t2.jpg" alt="사진2"></a>
					</li>
					<li><a href="#" data-slide-index="2">
						<img src="/images/pic_t3.jpg" alt="사진3"></a>
					</li>
					<li><a href="#" data-slide-index="3">
						<img src="/images/pic_t4.jpg" alt="사진4"></a>
					</li>
					<li><a href="#" data-slide-index="4">
						<img src="/images/pic_t5.jpg" alt="사진5"></a>
					</li>
				</ul>
			</div>
		</div>
		<div id="trailer">
		</div>
	</div>
</div>
</body>
</html>