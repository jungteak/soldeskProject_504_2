<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>글 목록</title>
<style>
#center {
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}

</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	$(function(){
		
		$("#write").click(function(){
			
			location.href="insert";
			
		})//click
		
	})//ready
		
	
</script>
<body>
	<div id="center">
		<h1>문의사항</h1>

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>글번호</th>
					<th>구분</th>
					<th>극장</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>답변여부</th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.inqubd_no}</td>
						<td>${list.inqubd_div}</td>
						<td>${list.inqubd_cinema}</td>
						<td><a href ="content/${list.inqubd_no}?p=${nowPage}">${list.inqubd_title}</a></td>
						<td>${list.inqubd_id}</td>
						<td><fmt:formatDate value="${list.inqubd_regdate}" pattern="yy/MM/dd"/> </td>
						<td>${list.inqubd_a}</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>
			<div align="right">
				<sec:authorize access="hasAuthority('ROLE_MEMBER')">
						<button>내가 쓴 문의 글 조회</button>
						<button id="write">새 글 등록</button>
				</sec:authorize>
			</div>
		</c:if>
		<c:if test="${count == 0 }">
			아직 입력한 글이 없습니다.
			<sec:authorize access="hasAuthority('ROLE_MEMBER')">
				<button id="write">새글 등록</button>
			</sec:authorize>
		</c:if>
	</div>
</body>
</html>