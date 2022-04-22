<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
</head>
<body>
<table border="1">
	<tr><td>제목</td><td>${dto.manbd_title}</td>
	<tr><td>내용</td><td>${dto.manbd_content}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.manbd_regdate}" dateStyle="long"/></td>
	<tr><td>공지사항/이벤트</td><td>${dto.manbd_div}</td>
	<tr><td>극장</td><td>${dto.manbd_cinema}</td>
</table>
	<a href="/manbd/update/${dto.manbd_no}">글 수정 </a> 
	<a id="${dto.manbd_no}" href="#">글 삭제</a>
	<a href="../list">목록 이동</a>
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