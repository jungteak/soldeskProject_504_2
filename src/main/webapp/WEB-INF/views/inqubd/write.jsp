<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<style>
	.orange{background-color:orange;width:50px}
	table{border-coppapse:collapse; width:800px}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="user" />
	<form method="post" id="writeform">
	<table border="1">
		<tr>
			<td class="orange">제목</td>
			<td><input name="inqubd_title"/></td>
		</tr>
		<tr>
			<td class="orange">분류</td>
			<td>
				<select name="inqubd_div">
				 	<option value="분실물">분실물</option>
				 	<option value="예매">예매</option>
				 	<option value="기타">기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="orange">극장</td>
			<td>
				<select name="inqubd_cinema">
					<option value="전체">전체</option>
				 	<c:forEach items="${cineList}" var="list">
				 		<option value="${list.cine_name}">${list.cine_name}</option>
				 	</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
				<td class="orange">작성자</td>
				<td><input name="inqubd_id" value="${user.username}" readonly/></td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td>
				<textarea name="inqubd_content" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 700px"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" id="save" value="새글 등록"> 
			</td>
		</tr>
	</table>
</form>
</sec:authorize>
</body>
</html>