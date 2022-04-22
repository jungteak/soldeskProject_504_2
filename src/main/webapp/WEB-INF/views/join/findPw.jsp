<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		
		$("#input").hide();
		$("#ck_b").hide();
		
		let num = "";
		
		 $("#mail_ck").click(function(){
			 let email = $("#email").val();
			 
			if(!email){
					$("#emailresult").html("메일 주소를 입력하세요");
					return false;
				} 
			
			let mem_name=$("#name").val();
			let mem_email=$("#email").val();
			let mem_id=$("#id").val();
			
			$.ajax({
				url:"/pwCheck",
				data:{
					"mem_name":mem_name,
					"mem_email":mem_email,
					"mem_id":mem_id
					},
				dataType:"text"
			}).done(function(data){
				if(data==0){
					$("#emailresult").html("해당 이름과 아이디,이메일로 가입된 아이디가 없습니다.");
				}else{
					$.ajax({url:"/send",
					 	data:"emailAddress="+email,
						dataType:"json"}
					).done(function(data){
						if(eval(data[1])){
							num = data[0];
							alert("메일이 전송되었습니다. 인증번호를 입력하세요.");
							$("#input").show();
							$("#ck_b").show();
					}
						}); //sendMail
					
				}
			})//nameCheck
			
		 
		})//mail 전송
		
		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				$("#result").html("인증이 확인되었습니다.")
				$("#result").append("<input type='hidden' id='ck' value='1'>");
			}else{
				$("#result").html("인증 실패했습니다. 다시 확인하세요.");
			}
		})//이메일 인증
		
		$("#findPw").submit(function(){
			
			if($("#ck").val() != 1){	
				$("#result").html("이메일 인증 하셔야 합니다.");
				return false;
			}//email 인증
		
		})//submit
		
	})//ready

</script>
<body>
<form id="findPw" method="post">
	<h3>회원 가입시 입력한 이름과 아이디와 이메일을 입력하세요</h3>
	<table>
		<tr><td>이름</td><td><input name="mem_name" id="name"></td></tr>
		<tr><td>아이디</td><td><input name="mem_id" id="id"></td></tr>
		<tr><td>email</td><td><input name="mem_email" id="email"><input type="button" id="mail_ck" value="메일 인증">
		<div id="emailresult"></div>
		<div id="input"><input id="ck_num"> <input type="button" id="ck_b" value="인증 확인"></div>
		<div id="result"></div>
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="다음"></td></tr>
	</table>
</form>
</body>
</html>