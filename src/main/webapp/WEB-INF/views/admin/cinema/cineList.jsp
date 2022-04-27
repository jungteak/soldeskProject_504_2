<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>극장 정보</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		
		$(".cine_up").click(function(){
			let cine_no = $(this).attr("title");
			location.href="../../admin/cinema/updateCinema/"+cine_no;
		})//cine_upBtn click
		
		$(".cine_del").click(function(){
				let cine_no = $(this).attr("title");
				let select = confirm("정말 삭제하시겠습니까?");
				
				if(select==true){
					$.ajax({
						url:"/admin/cinema/deleteCinema",
						data:"cine_no="+cine_no,
						method:"delete"
					}).done(function(){
						alert("삭제가 완료되었습니다.")
						location.reload();
					})//ajax
				}//if
			})//cine_delBtn click
			
		$(".th_up").click(function(){
			let title = $(this).attr("title");
			let arr = title.split(",");
			let cine_no = arr[0];
			let th_no = arr[1];
			location.href="../../admin/theater/updateTheater/"+cine_no+"/"+th_no;
		})//th_upBtn click
			
		$(".th_del").click(function(){
			let title = $(this).attr("title");
			let arr = title.split(",");
			let cine_no = arr[0];
			let th_no = arr[1];
			
			let select = confirm("정말 삭제하시겠습니까?");
					
			if(select==true){
				$.ajax({
					url:"/admin/theater/deleteTheater",
					data:{"cine_no":cine_no,"th_no":th_no},
					method:"delete"
				}).done(function(){
					alert("삭제가 완료되었습니다.")
					location.reload();
				})//ajax
			}//if
			})//th_delBtn click
		
		$("#insertCinema").click(function(){
			location.href="../../admin/cinema/insertCinema";
		})//insertCinema
		
		$(".insertTheater").click(function(){
			let cine_no=$(this).attr("title");
			location.href="../../admin/theater/insertTheater/"+cine_no;
		})//insertTheater
		
	})//ready
	
</script>
<body>
	<div id="container">
		<div id="body">
			<div id="select_area">
				<ul>
					<li><a href="cineList?cineArea=서울">서울</a></li>
					<li><a href="cineList?cineArea=경기">경기</a></li>
					<li><a href="cineList?cineArea=인천">인천</a></li>
					<li><a href="cineList?cineArea=대전/충청/세종">대전/충청/세종</a></li>
					<li><a href="cineList?cineArea=부산/대구/경상">부산/대구/경상</a></li>
					<li><a href="cineList?cineArea=광주/전라">광주/전라</a></li>
					<li><a href="cineList?cineArea=강원">강원</a></li>
				</ul>
			</div>
			<c:forEach items="${dto}" var="dto">
				<c:if test="${cineArea==dto.cine_area}">
				<details>
					<summary>
						극장명 : ${dto.cine_name} / 지역 : ${dto.cine_area} 
						<button class="cine_up" title="${dto.cine_no}">수정</button>
						<button class="cine_del" title="${dto.cine_no}">삭제</button>
					</summary>
					<c:forEach items="${th_dto}" var="th_dto">
						<c:if test="${dto.cine_no==th_dto.cine_no}">
							<div>상영관 번호 : ${th_dto.th_no}
							<button class="th_up" title="${dto.cine_no},${th_dto.th_no}">수정</button>
							<button class="th_del" title="${dto.cine_no},${th_dto.th_no}">삭제</button></div>
							<div>열 : ${th_dto.th_col} / 행 : ${th_dto.th_row}</div>
						</c:if>
					</c:forEach>
					<button class="insertTheater" title="${dto.cine_no}">상영관 추가</button>
				</details>
				</c:if>
			</c:forEach>
			<div><button id="insertCinema">극장 등록</button></div>
		</div>
	</div>
</body>
</html>