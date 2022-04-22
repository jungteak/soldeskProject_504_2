<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>글 목록</title>
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
	background-color: PowderBlue ;
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
		<h1>게시글 목록</h1>
		<h4><span style="color:Gold">
		영화관의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.
		</span></h4>
		<div align="right">
			<a href="/mainpage">메인페이지</a> <a href="write">새글 등록</a>
		</div>
		
		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>공지사항,이벤트</th>
					<th>극장</th>
				</tr>
				<c:forEach items="${bList}" var="managerbd">
					<tr>
						<td><span style="color:red">${managerbd.manbd_no}</span></td>
						<td><a href ="content/${managerbd.manbd_no}">${managerbd.manbd_title}</a></td>
						<td><span style="color:Fuchsia"><fmt:formatDate value="${managerbd.manbd_regdate }" dateStyle="short"/></span></td>
						<td><span style="color:Orange">${managerbd.manbd_div}</span></td>
						<td><span style="color:blue">${managerbd.manbd_cinema}</span></td>
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
		<div id="search" align="center">
<form action="search">
<select name="searchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">극장</option>
</select>
<input type="text" name="search" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
</form>	
</div>
</body>
</html>