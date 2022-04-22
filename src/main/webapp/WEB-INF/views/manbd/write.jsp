<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<style>
	.pink{background-color: pink ; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
</style>
</head>
<body>
<form method="post" id="writeform">
	<table border="1">
		<tr>  
			<td class="pink">제목</td>
			<td><input name="manbd_title"/></td>
		</tr>
		<tr>
			<td class="pink">구분</td>
			<td><select name="manbd_div">
				<option value="이벤트">이벤트</option>
				<option value="공지사항">공지사항</option>
			</select></td>
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
			<td>
        	<textarea id="test" name="manbd_content"
                  rows="20" cols="10" 
                  placeholder="내용을 입력해주세요"
                  style="width: 700px"></textarea>
     		</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="save" value="새글 등록"> 
			</td>
		</tr>
	</table>

</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
</script>
</body>
</html>	