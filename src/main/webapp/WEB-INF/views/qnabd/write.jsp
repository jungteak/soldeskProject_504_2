<%@ page contentType="text/html; charset=UTF-8"%>
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
<form method="post" id="writeform">
	<table border="1">
		<tr>
			<td class="orange">제목</td>
			<td><input name="qnabd_q"></td>
		</tr>
		<tr>
			<td class="orange">답변</td>
			<td><textarea name="qnabd_a"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="save" value="등록"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>