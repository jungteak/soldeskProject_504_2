<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		
		$("#updatePW").submit(function(){
			
			let pw = $("#mem_pw").val();
			
			if(!pw){
				$("#msg").html("바꿀 비밀번호를 입력하세요");
				return false;
			}
			
			if(!(pw.length>3&&pw.length<14)){
				$("#msg").html("4~13자리로 아이디를 입력해주세요.");
				return false;
			}
			
			alert("비밀번호가 변경되었습니다.");
		})//submit
		
	})
</script>
<body>

<form id="updatePW" method="post" action="updatePw">

	<div align="center"><h3>변경할 비밀번호를 입력하세요</h3></div>
	<div align="center"><input type="password" id="mem_pw" name="mem_pw" placeholder="4~13글자 사이로 입력하세요."></div>
	<div id="msg" align="center"></div>
	<input type="hidden" name="mem_name" value="${mem_name}">
	<input type="hidden" name="mem_email" value="${mem_email}">
	<input type="hidden" name="mem_id" value="${mem_id}">
	<div align="center"><input type="submit" value="변경"></div>
	
</form>

</body>
</html>