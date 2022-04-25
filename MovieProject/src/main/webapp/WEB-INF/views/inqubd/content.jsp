<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#center {
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
	}
	
	#page {
		text-align: center;
	}

	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: blue; text-decoration: underline;}
</style>
<title>글 상세보기</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		
		$("#write").click(function(){
			
			location.href="../insert";
			
		})//click
		
		$("#updateBtn").click(function(){
			let page=${nowPage};
			let inqubd_no = ${dto.inqubd_no};
			location.href="../update/"+inqubd_no+"/"+page;
		})//click
		
		$("#delBtn").click(function(){
			let inqubd_no = ${dto.inqubd_no};
			let select = confirm("정말 삭제하시겠습니까?");
			
			if(select==true){
				$.ajax({
					url:"/inqubd/delete",
					data:"inqubd_no="+inqubd_no,
					method:"delete"
				}).done(function(){
					alert("삭제가 완료되었습니다.");
					location.href="/inqubd/list";
				})
			}
		})//click
		
		$("#input").click(function(){
			let inqubd_no = ${dto.inqubd_no};
			let inqubd_comm = $("#inqubd_comm").val();
			
			$.ajax({
				url:"/inqubd/comm",
				data:{
					"inqubd_no":inqubd_no,
					"inqubd_comm":inqubd_comm
					},
				method:"put"
			}).done(function(){
				location.reload();
			}) 
			
		})//click
		
		$("#delComm").click(function(){
			let inqubd_no = ${dto.inqubd_no};
			let select = confirm("정말 삭제하시겠습니까?");
			if(select==true){
				$.ajax({
					url:"/inqubd/delComm",
					data:"inqubd_no="+inqubd_no,
					method:"put"
				}).done(function(){
					alert("삭제가 완료되었습니다.")
					location.reload();
				})
			}
		})//click
		
	})//ready
		
</script>
<body>
<div id="center">
		<table border="1">
			<tr><td>제목</td><td>${dto.inqubd_title}</td></tr>
			<tr><td>구분/극장</td><td>${dto.inqubd_div} / ${dto.inqubd_cinema}</td></tr>
			<tr><td>내용</td><td>${dto.inqubd_content}</td></tr>
			<tr><td>등록일</td><td><fmt:formatDate value="${dto.inqubd_regdate}" pattern="yy/MM/dd"/></td></tr>
			<sec:authorize access="hasAuthority('ROLE_ADMIN')">
				<c:if test="${dto.inqubd_comm==null}">
					<tr><td>답변</td><td><textarea id="inqubd_comm" name="inqubd_comm"></textarea></td><td><button id="input">등록</button></td></tr>
				</c:if>
				<c:if test="${dto.inqubd_comm!=null}">
					<tr><td>답변</td><td>${dto.inqubd_comm}</td><td><button id="delComm">삭제</button></td></tr>
				</c:if>
				<tr><td colspan="2" align="right">
					<button id="delBtn">글 삭제</button>
				</td></tr>
			</sec:authorize>
			<sec:authorize access="hasAuthority('ROLE_MEMBER')">
			<sec:authentication property="principal" var="user" />
			<c:if test="${dto.inqubd_comm!=null}">
				<tr><td>답변</td><td>${dto.inqubd_comm}</td></tr>
				<tr><td>답변등록일</td><td><fmt:formatDate value="${dto.inqubd_comm_reg}" pattern="yy/MM/dd"/></td>
			</c:if>
			<c:if test="${user.username==dto.inqubd_id}">
				<tr><td colspan="2" align="right">
					<button id="updateBtn">글 수정</button>
					<button id="delBtn">글 삭제</button>
				</td></tr>
			</c:if>
			</sec:authorize>
		</table>
		<!-- content -->
		
		<h1>문의사항</h1>
		
			<table>
				<tr>
					<th>글번호</th>
					<th>구분</th>
					<th>극장</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>답변여부</th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.inqubd_no}</td>
						<td>${list.inqubd_div}</td>
						<td>${list.inqubd_cinema}</td>
						<td><a href ="../content/${list.inqubd_no}?p=${nowPage}">${list.inqubd_title}</a></td>
						<td>${list.inqubd_id}</td>
						<td><fmt:formatDate value="${list.inqubd_regdate}" pattern="yy/MM/dd"/> </td>
						<td>${list.inqubd_a}</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="../list?p=${begin-1}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var="i">
					<a href="../list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="../list?p=${end+1}">[다음]</a>
				</c:if>
			</div>
			<sec:authorize access="hasAuthority('ROLE_MEMBER')">
				<div align="right">
					<button id="write">새글 등록</button>
				</div>
			</sec:authorize>
			<!-- list -->
	</div>
</body>
</html>