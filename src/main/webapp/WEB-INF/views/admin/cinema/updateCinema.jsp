<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>극장 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		
		$("#updateCinema").submit(function(){
			
			if($("#cine_name").val()==""){
				$("#name_result").html("이름을 입력해 주세요");
				return false;
			}
			
		})//submit
		
	})//ready
	
</script>
</head>
<body>
	<div id="container">
		<div id="body">
			<form id="updateCinema" method="post">
				<input type="hidden" name="_method" value="put">
				<table>
					<tr>
						<td>극장 이름</td><td><input id="cine_name" name="cine_name" value="${dto.cine_name}"><span id="name_result"></span></td>
					</tr>
					<tr>
						<td>지역</td>
						<td><select id="cine_area" name="cine_area"><c:forEach items="${areaList}" var="list">
							<option value="${list}" <c:if test="${list==dto.cine_area}">selected</c:if>>${list}</option>				
						</c:forEach></select></td>
					</tr>
					<tr>
						<td colspan=2><input type="submit" value="수정"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>