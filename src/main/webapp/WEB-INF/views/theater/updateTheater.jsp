<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		
		$("#updateTheater").submit(function(){
			
			const reg = /^[0-9]*$/;
			
			if($("#th_no").val()==""){
				$("#no_result").html("상영관 번호를 입력해 주세요");
				return false;
			}//null chk
			
			if(!(reg.test($("#th_no").val()))){
				$("#no_result").html("숫자로 입력해 주세요");
				return false;
			}
			
		})//submit
		
	})//ready
	
</script>
<title>극장 수정</title>
</head>
<body>
	<div id="container">
		<div id="body">
			<form action="../" id="updateTheater" method="post">
			<input type="hidden" name="_method" value="put">
				<table>
					<tr>
						<td>상영관 번호</td><td><input id="th_no" name="th_no" value="${dto.th_no}"><span id="no_result"></span></td>
					</tr>
					<tr>
						<td>상영관 열</td>
						<td><select name="th_col">
						<c:forEach begin="1" end="9" var="i">
							<option value="${i}" <c:if test="${dto.th_col==i}">selected</c:if>>${i}</option>
						</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>상영관 행</td>
						<td><select name=th_row>
						<c:forEach begin="1" end="9" var="i">
							<option value="${i}" <c:if test="${dto.th_row==i}">selected</c:if>>${i}</option>
						</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td colspan=2><input type="submit" value="등록"></td>
					</tr>
				</table>
				<input name="cine_no" type="hidden" value="${dto.cine_no}">
			</form>
		</div>
	</div>
</body>
</html>