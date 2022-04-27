<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
table {
	text-align: center;
	margin-left: auto;
	margin-right: auto; 
}
div{
	text-align: center;
	
}
h1{
  color:CORAL; // 종 색상
}

</style>
<body>
	<table border="1">
	<tr><td>제목</td><td>${dto.manbd_title}</td>
	<tr><td>내용</td><td>${dto.manbd_content}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.manbd_regdate}" dateStyle="long"/></td>
	<tr><td>공지사항/이벤트</td><td>${dto.manbd_div}</td>
	<tr><td>극장</td><td>${dto.manbd_cinema}</td>
 <span style="font-size: 3em; color: Tomato;">
    <i class="fas fa-camera"></i>
    <i class="fa-solid fa-arrow-rotate-left"></i>
  </span>

  <span style="font-size: 48px; color: Dodgerblue;">
    <i class="fas fa-camera"></i>
  </span>

  <span style="font-size: 3rem;">
    <span style="color: Mediumslateblue;">
    <i class="fas fa-camera"></i>
    </span>
  </span> 
	</table>	
	
	<table>
	<div>
  <h1>
  <span style= color:red >
   <i class="fas fa-bell"></i> 
  </h1>
</div>
	<div> 
		<sec:authorize access="hasAuthority('ROLE_ADMIN')">
		        <a href="/manbd/update/${dto.manbd_no}">글 수정</a>
		        <a id="${dto.manbd_no}" href="#">글 삭제</a>
		      </sec:authorize>
		      
		      <a href="/../manbd/list">게시글로 이동</a>
	</div>
	</table>
	
	
	<c:if test="${count != 0 }">
		<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>공지사항/이벤트</th>
					<th>극장</th>
				</tr>
				<c:forEach items="${bList}" var="managerbd">
					<tr>
						<td>${managerbd.manbd_no}</td>
						<td><a href ="${managerbd.manbd_no}">${managerbd.manbd_title}</a></td>
						<td><fmt:formatDate value="${managerbd.manbd_regdate }" dateStyle="short"/></td>
						<td>${managerbd.manbd_div}</td>
						<td>${managerbd.manbd_cinema}</td>
					</tr>
				</c:forEach>
			</table>


		<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="?p=${end+1}">[다음]</a>
				</c:if>
			</div>
	</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
		</c:if>
</div>	


<div id="search" align="center" >
<form action="/manbd/search">
<select name="searchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">극장</option>
</select>
<input type="text" name="search" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
</form>	
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");
			$.ajax({url:"/manbd/delete", data:"no="+no, method:"delete"}
			).done(function(){
				location.href="/manbd/list";
			})
			return false;
		})//click
	})//ready

</script>
<!--  cList -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");
			$.ajax({url:"/manbd/delete", data:"no="+no, method:"delete"}
			).done(function(){
				location.href="/manbd/list";
			})
			return false;
		})//click

			
		})//click
	})//ready

</script>
</body>
</html>