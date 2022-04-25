<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>극장 등록</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		
		$("#insertCinema").submit(function(){
			
			if($("#cine_name").val()==""){
				$("#name_result").html("이름을 입력해 주세요");
				return false;
			}
			
		})//submit
		
		let areaList = ["서울", "경기", "인천", "대전/충청/세종", "부산/대구/경상", "광주/전라", "강원"];
		for(let i in areaList){
			$("#cine_area").append("<option value="+areaList[i]+" >"+areaList[i]+"</option>");
		}//cine_area 설정
		
	})//ready
	
</script>
<body>
	<div id="container">
		<div id="body">
			<form id="insertCinema" method="post">
				<table>
					<tr>
						<td>극장 이름</td><td><input id="cine_name" name="cine_name"><span id="name_result"></span></td>
					</tr>
					<tr>
						<td>지역</td>
						<td><select id="cine_area" name="cine_area"></select></td>
					</tr>
					<tr>
						<td colspan=2><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>