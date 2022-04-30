<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!--  bList begin end count pageNum totalPages -->
<title>글 목록</title>
<!--<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: gray;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
-->
</head>
<body>
	<div id="container">
		<h1>후기 게시판</h1>


		<c:if test="${count != 0 }">
			<table class="table table-hover">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${bList}" var="board">
					<tr>
						<td>${board.movbd_no}</td>
						<td><a href ="content/${board.movbd_no}">${board.movbd_title}</a></td>
						<td>${board.movbd_id}</td>
						<td><fmt:formatDate value="${board.movbd_regdate}" dateStyle="short"/> </td>
						<td>${board.movbd_readcnt}</td>
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
	<sec:authorize access="hasAuthority('ROLE_MEMBER')">
		<div align="right">
			<a href="write">글 작성</a>
		</div>
	</sec:authorize>
<div id="search" align="center">
<form action="search">
<select name="searchn">
<option value="0">글제목</option>
<option value="1">작성자</option>
</select>
<input type="text" name="search" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
</form>	
</div>
</body>
</html>
