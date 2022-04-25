<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<style>
	.item{background-color:#A1BAF5;width:100px; text-align:center; font-size:16px; font-weight:bold;}
	table{border-coppapse:collapse; width:1400px;}
	table tr td input {width:99%; height:20px; margin:auto; font-weight:bold; font-size:16px;}
	table tr td textarea {width:99%; height:500px; margin:auto; resize: none; overflow-x:hidden; overflow-y:scroll;font-weight:bold; font-size:16px; }
</style>
<link rel="stylesheet" type="text/css" href="/css/btn1.css"/>
</head>
<body>
<div id="container">
	<div id="body" align="center">
		<form method="post" id="writeform">
		<table style="border:1 solid black">
			<tr>
				<td class="item">제목</td>
				<td><input name="qnabd_q"></td>
			</tr>
			<tr>
				<td class="item">답변</td>
				<td><textarea name="qnabd_a"></textarea></td>
			</tr> 
		</table>
			<button type="submit" id="save" class="custom-btn btn-5">등록</button>
		</form>
	</div>

</div>

</body>
</html>