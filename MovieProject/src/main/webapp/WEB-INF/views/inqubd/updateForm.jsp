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
<form method="post" id="updateform">
<input type="hidden" name="_method" value="put">
	<table border="1">
		<tr>
			<td class="orange">제목</td>
			<td><input name="inqubd_title" value="${dto.inqubd_title}"></td>
		</tr>
		<tr>
			<td class="orange">분류</td>
			<td>
				<select name="inqubd_div">
				 	<c:forEach items="${divi}" var="divi">
				 		<option value="${divi}" <c:if test="${divi==dto.inqubd_div}">selected</c:if>>${divi}</option>
				 	</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td class="orange">극장</td>
			<td>
				<select name="inqubd_cinema">
				 	<option value="전체">전체</option>
				 	<c:forEach items="${cineList}" var="list">
				 		<option value="${list.cine_name}" <c:if test="${list.cine_name==dto.inqubd_cinema}">selected</c:if>>${list.cine_name}</option>
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
				<textarea name="inqubd_content" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 700px">${dto.inqubd_content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" id="update" value="수정"> 
			</td>
		</tr>
	</table>
</form>
</sec:authorize>
</body>
</html>