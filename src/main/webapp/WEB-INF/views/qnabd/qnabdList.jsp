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

hr {
height:1px;
color:black;
background-color:black;
}

#body {
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

.qnabdList strong {
	font-size:30px;
	font-weight:bold;
}
.qnabdList span {
	font-size:20px;
	font-weight:bold;
}

.qnabdList button{
	position:relative;
}

#q #btn {
	display:inline;
}
</style>
</head>
<link href="/css/pager.css" rel="stylesheet">
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
<div id="container">
<div id="body">
	<ul>
		<li><h3>자주묻는 질문</h3></li>
		<li><h3>문의사항</h3></li>
	</ul>
		<div id="qnaboard">
			<c:forEach items="${list}" var="list">
				<div class="qnabdList" title="${list.qnabd_no}">
					<div id="q" title="${list.qnabd_no}"><strong>Q? </strong><span>${list.qnabd_q}</span>
					<sec:authorize access="hasAuthority('ROLE_ADMIN')"><button class="qnaupdate" title="${list.qnabd_no}">수정</button> 
					<button class="qnadelete" title="${list.qnabd_no}">삭제</button></sec:authorize><hr></div>
					<div id="a"><strong>A : </strong><span>${list.qnabd_a}</span><hr></div>
				</div>
			</c:forEach>
		</div>
			<div id="page" align="center" class="pagination-wrapper">
			<div class="pagination">
				<c:if test="${begin > pageNum}">
					<a class="prev page-numbers" href="?p=${begin-1}">이전</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var="i">
					<c:if test="${page==i}"><a aria-current="page" class="page-numbers current" href="?p=${i}">${i}</a></c:if>
					<c:if test="${page!=i}"><a class="page-numbers" href="?p=${i}">${i}</a></c:if>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a class="next page-numbers" href="?p=${end+1}">다음</a>
				</c:if>
			</div>
			</div>
			<sec:authorize access="hasAuthority('ROLE_ADMIN')">
				<div align="right"><button id="qnainsert">글 작성</button></div>
			</sec:authorize>
</div>
</div>
</body>
</html>