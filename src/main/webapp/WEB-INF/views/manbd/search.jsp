<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>검색 글 목록</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
	text-align: center;
}

th {border: 1px solid black;
	background-color: pink;
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
</head>
<body>
	<div id="center">
		<h1>${search}로 검색한 결과입니다. <c:if test="${searchn==0}">(제목)  </c:if>
		<c:if test="${searchn==1}">(내용)  </c:if>
		<c:if test="${searchn==2}">(지점)  </c:if>
		</h1>
		
		<div align="right">
			<a href="/mainpage">메인페이지</a> <a href="list">게시글로 이동</a> <a href="write">글 작성</a>
		</div>

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>공지사항,이벤트</th>
					<th>지점</th>

				</tr>
				<c:forEach items="${bList}" var="managerbd">
					<tr>
						<td>${managerbd.manbd_no}</a></td>
						<td><a href ="content/${managerbd.manbd_no}">${managerbd.manbd_title}</a></td>
						<td><fmt:formatDate value="${managerbd.manbd_regdate }" dateStyle="short"/> </td>
						<td>${managerbd.manbd_div}</a></td>
						<td>${managerbd.manbd_cinema}</a></td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="search?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="search?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="search?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>
		</c:if>
		<c:if test="${count == 0 }">
	검색 조건에 맞는 글이 없습니다.
</c:if>
<div id="search" align="center">
<form action="search">
<select name="searchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">지점</option>
</select>
<input type="text" name="search" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
</form>	
	</div>
	</div>
</body>
</html>

