<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>write</title>
<style>
	.orange{background-color: gray; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="user" />
<form method="post" id="writeform" action="write">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table border="1">
		<tr>  
			<td class="orange">글 제목</td>
			<td><input name="movbd_title" placeholder="내용을 입력해주세요"/></td>
		</tr>
		<tr>  
			<td class="orange">관람 영화</td>
			<td><select name="movbd_mov">
			<c:forEach items="${mov_list}" var="mov">
				<option value="${mov}">${mov}</option>
			</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td><input name="movbd_id" value="${user.username}" readonly ></td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td><div id="smarteditor">
        	<textarea name="movbd_content" id="editorTxt" 
                  rows="20" cols="10" 
                  placeholder="내용을 입력해주세요"
                  style="width: 700px"></textarea>
      </div></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="새글 등록"> 
			</td>
		</tr>
	</table>

</form>
</sec:authorize>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
     let oEditors = []

    smartEditor = function() {
      console.log("Naver SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
      })
    } 

    $(document).ready(function() {
  
     	smartEditor() 
      
      $("#save").click(function(){
    	  //여기 
    	  let d = confirm("정말 등록하시겠습니까?");//
			if(d){
    	  	oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	  	$("#writeform").submit();
			}else{
				// ?? 글 입력 안하면 어떻게 할껀지..입력안하면 그냥 그 자리 머무르기..??그럼 아무것도 안해도 되고
			}
      })
      
      
    })
  </script>
</body>
</html>	
