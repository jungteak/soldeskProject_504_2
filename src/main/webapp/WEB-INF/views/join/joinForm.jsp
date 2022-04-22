<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<form:form action="insertMember" modelAttribute="dto" method="post" id="joinform">
	<table>
		<tr><td>아이디</td><td><input name="mem_id" id="id" value="${dto.mem_id}" placeholder="4-13자리로 입력해주세요"><input type="button" id="id_check" value="중복 확인" >
		<div id="id_msg"></div></td></tr>
		<tr><td>비밀번호</td><td><input name="mem_pw" type="password" id="password" placeholder="4-13자리로 입력해주세요"><form:errors path="mem_pw"/>
		<div id="pw_msg"></div></td></tr>
		<tr><td>비밀번호 확인</td><td><input name="password_ck" type="password" id="password_ck" >
		<div id="pwck_msg"></div></td></tr>
		<tr><td>이름</td><td><input name="mem_name" id="name" value="${dto.mem_name}">
		<form:errors path="mem_name"/>
		<div id="name_msg"></div></td></tr>
		<tr><td>생년월일</td><td><input name="mem_birth" id="birth" placeholder="yyyy-MM-dd" value=<fmt:formatDate value="${dto.mem_birth}" pattern="yyyy-MM-dd"/>>
		<form:errors path="mem_birth"/><div id="birth_msg"></div></td></tr>
		<tr><td>핸드폰번호</td><td><input name="mem_phone" id="phone" placeholder="000-0000-0000" value="${dto.mem_phone}">
		<form:errors path="mem_phone"/></td></tr>
		<tr><td>주소</td><td><input name="mem_address" id="address" value="${dto.mem_address}">
		<input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()">
		<form:errors path="mem_address"/></td></tr>
		<tr><td>email</td><td><input name="mem_email" id="email" value="${dto.mem_email}"><input type="button" id="mail_ck" value="메일 인증"><form:errors path="mem_email"/>
		<div id="emailresult"></div>
		<div id="input"><input id="ck_num"> <input type="button" id="ck_b" value="인증 확인"></div>
		<div id="result"></div>
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
	</table>
</form:form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
		function addPost(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            document.querySelector("#address").value = data.address;
		            alert("나머지 주소도 입력하세요.");
		        }
		    }).open();
		}//addPost

			let num = "";
		$(function(){
			
			$("#input").hide();
			$("#ck_b").hide();
			
			 $("#mail_ck").click(function(){
				 let email = $("#email").val();
				if(!email){
						$("#emailresult").html("메일 주소를 입력하세요");
						return false;
					} 
			 $.ajax({url:"/send",
				 	data:"emailAddress="+email,
					dataType:"json"}
				).done(function(data){
					if(eval(data[1])){
						num = data[0];
						alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
						$("#input").show();
						$("#ck_b").show();
					}
				}); 
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
	
		
		$("#id_check").click(function(){
			let mem_id = $("#id").val();
			if(!(mem_id.length>3&&mem_id.length<14)){
				$("#id_msg").html("4~13자리로 아이디를 입력해주세요.");
				return false;
			}
			if(!mem_id){
				$("#id_msg").html("아이디를 입력하세요")
				return false;
			}
			$.ajax({
				url:"/idCheck",
				data:"mem_id="+mem_id,
				dataType:"text"
			}).done(function(data){
				if(data == ""){
					$("#id_msg").html("사용 가능한 아이디입니다.");
					$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
				}else{
					$("#id_msg").html("이미 사용중인 아이디입니다.")
				}
			})
		})//id중복확인
		
		
		
		$("#joinform").submit(function(){
			
			let pw = $("#password").val();
			let pwck = $("#password_ck").val();
			const reg = /^(19[0-9][0-9]|20\\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			let birth = $("#birth").val();
			
			if($("#id_ck").val()!=1){
				$("#id_msg").html("아이디 중복 체크 하셔야 합니다.");
				return false;
			}//id 중복체크
			
			if(pw!=pwck){
				$("#pwck_msg").html("입력한 번호와 일치하지 않습니다.");
				return false;
			}//비밀번호 확인
			
			if(!(reg.test(birth))){
				$("#birth_msg").html("형식에 맞게 입력 해 주세요");
				return false;
			}

			 if($("#ck").val() != 1){
				$("#result").html("이메일 인증 하셔야 합니다.");
				return false;
			}
			
			alert("회원가입이 완료되었습니다!");
			 
		})//submit
		
	})//ready
</script>

</body>
</html>