<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html>
<head>
<title>내가쓴 글 목록</title>
<style>
#center {
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

#page {
	text-align: center;
}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}

</style>
</head>
<body>
    <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="user" />
		<a>${user.username}님</a>
		<a href="/logout">로그아웃</a>
	</sec:authorize>
	<div id="container">
		<h1>내가 쓴 후기</h1>


		<c:if test="${count != 0 }">
			<table class="table table-hover">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.movbd_no}</td>
						<td><a href ="/board/content/${list.movbd_no}">${list.movbd_title}</a></td>
						<td>${list.movbd_id}</td>
						<td><fmt:formatDate value="${list.movbd_regdate}" dateStyle="yy/MM/dd"/> </td>
						<td>${list.movbd_readcnt}</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>
		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>

	</div>
			<div align="right">
			<a href="/main">main</a><a href="write">글 작성</a>
		</div>
	
<div id="search" align="center">
<form action="search">
<select name="searchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">작성자</option>
</select>
<input type="text" name="search" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
</form>	
</div>
</body>
</html>
