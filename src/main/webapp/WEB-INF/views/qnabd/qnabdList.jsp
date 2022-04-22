<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>자주 묻는 질문</title>
<style>
#center {
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

#page {
	text-align: center;
}

ul li {
	 display:inline-block;
}

.qnabdList h5 {
	display:inline-block;
}
#q #btn {
	display:inline;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	$(function(){
		
		$(".qnabdList #a").hide();
		
		$(".qnabdList #q").click(function(){
			let no = $(this).attr("title");
			$("[title='"+no+"'] #a").toggle();
		})//click
		
		$(".qnadelete").click(function(){
			let no = $(this).attr("title");
			let select = confirm("정말 삭제하시겠습니까?");
			
			if(select==true){
				$.ajax({
					url:"/qnabd/delete",
					data:"no="+no,
					method:"delete"
				}).done(function(){
					alert("삭제가 완료되었습니다.")
					location.reload();
				})//ajax
			}
		})//click
		
		$(".qnaupdate").click(function(){
			let qnabd_no = $(this).attr("title");
			location.href="update/"+qnabd_no;
		})//click
		
		$("#qnainsert").click(function(){
			
			location.href="insert";
			
		})//click
		
	})//ready
		
	
</script>
<body>
	<div id="center">
	<ul>
		<li><h3>자주묻는 질문</h3></li>
		<li><h3>문의사항</h3></li>
	</ul>
		<div id="qnaboard">
			<c:forEach items="${list}" var="list">
				<div class="qnabdList" title="${list.qnabd_no}">
					<div id="q" title="${list.qnabd_no}"><h5>${list.qnabd_q}</h5>
					<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="user" />
						<c:if test="${user.username=='admin'}"><button class="qnaupdate" title="${list.qnabd_no}">수정</button> 
					<button class="qnadelete" title="${list.qnabd_no}">삭제</button></c:if></sec:authorize><hr></div>
					<div id="a">${list.qnabd_a}<hr></div>
				</div>
			</c:forEach>
		</div>
			<div id="page">
				<c:if test="${begin > pageNum}">
					<a href="list?p=${begin-1}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="user" />
				<c:if test="${user.username=='admin'}"><div align="right"><button id="qnainsert">글 작성</button></div></c:if>
			</sec:authorize>
	</div>
</body>
</html>