<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<title>로그인</title>
</head>

<body align="center">
<h1>로그인</h1>
<form method="post">
<table align="center" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="orange">아이디</td>
		<td><input type="text" name="username"/></td>
	</tr>
	<tr>
		<td bgcolor="orange">비밀번호</td>
		<td><input type="password" name="password"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="로그인"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<a href="insertMember">회원가입</a>
			<a href="findId">아이디 찾기</a> 
			<a href="findPw">비밀번호 찾기</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
