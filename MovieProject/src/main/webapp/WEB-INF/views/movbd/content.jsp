<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
</head>
<body>
<table border="1">
	<tr><td>제목</td><td>${dto.movbd_title}</td>
	<tr><td>작성자</td><td>${dto.movbd_id}</td>
	<tr><td>내용</td><td>${dto.movbd_content}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.movbd_regdate }" dateStyle="long"/></td>
	<tr><td>조회수</td><td>${dto.movbd_readcnt}</td>
	<tr><td colspan="2" align="right">
	<c:if test="${ user.mem_id == dto.movbd_id }">
	<a href="/movbd/update/${dto.movbd_no}">글 수정 </a> 
	<a id="${dto.movbd_no}" href="#">글 삭제</a>
	</c:if>
	<a href="../list">목록 이동</a> 
	</td></tr>
</table>
<!--  cList -->
<div>
	<c:forEach items="${cList}" var="comm">
		<div>${comm.comm_id} / <fmt:formatDate value="${comm.comm_regdate }" dateStyle="short"/></div>
		<div>${comm.comm_content} 
		<c:if test="${comm.comm_id == user.mem_id }">
		<button class="dbtn" id="${comm.comm_no}">삭제</button>
		</c:if>
		</div>
		<hr>
	</c:forEach>
	<input name="content" id="content"><button id="add">등록</button><jsp:include page="like.jsp"/>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let d = confirm("정말 삭제하나요?");
			//alert(typeof(d))
			 if(eval(d)){
			let movbd_no = $(this).attr("id");
			$.ajax({url:"/movbd/delete", data:"movbd_no="+movbd_no, method:"delete"}
			).done(function(){
				location.href="/movbd/list";
			})
			}
			return false;
		})//click
		
		$("#add").click(function(){
			let id = '${user.mem_id}';
			let content = $("#content").val();
			let movbd_no = ${dto.movbd_no};
			
			$.ajax({url:"/comm/insert",
					data:"movbd_no="+movbd_no+"&comm_id="+id+"&comm_content="+content,
					method:"get"
			}).done(function(){
					location.reload();		
				});
			
		})//click
		$(".dbtn").click(function(){
			let comm_no = $(this).attr("id");
			$.ajax({url:"/comm/delete/"+comm_no,
				method:"get"
		}).done(function(){
				location.reload();		
			});
			
		})//click
	})//ready

</script>

</body>
</html>