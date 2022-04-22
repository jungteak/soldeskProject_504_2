<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>글 수정</title>
<style>
	.pink{background-color: pink; width: 50px;}
	.red{background-color: red; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
</style>
</head>
<body>
<form method="post" id="updateform" action="/manbd/update" >
<input type="hidden" name="_method" value="put">
	<table border="1">
		<tr>	
			<td class="pink">제목</td>
			<td><input name="manbd_title" value="${dto.manbd_title}"/>
				<input name="manbd_no" value="${dto.manbd_no}" type="hidden"> 
			</td>
		</tr>
		<tr>	
			<td class="pink">구분</td>
			<td>
				<select name="manbd_div">
					<c:forEach items="${divi}" var="divi">
						<option value="${divi}" <c:if test="${dto.manbd_div==divi}">selected</c:if>>${divi}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
				<tr>
			<td class="pink">극장</td>
			<td><select name="manbd_cinema">
				<option value="전체">전체</option>
			<c:forEach items="${cList}" var="cinema">
				<option value="${cinema.cine_name}">${cinema.cine_name}</option>
			</c:forEach>		
			</select></td>
		</tr>
		<tr>
			<td class="pink">내용</td>
			<td><div id="smarteditor">
        	<textarea name="manbd_content" id="editorTxt" 
                  rows="20" cols="10" 
                  style="width: 99%">${dto.manbd_content}</textarea></div></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="save" value="글 수정 완료"> 
			</td>
			
		</tr>
	</table>

</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  
  </script>
</body>
</html>