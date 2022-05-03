<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>글 수정</title>
<style>
	.orange{background-color: orange; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
</style>
</head>
<body>
<form method="post" id="updateform" action="/movbd/update" >
<input type="hidden" name="_method" value="put">
	<table border="1">
		<tr>	
			<td class="orange">제목</td>
			<td><input name="movbd_title" value="${dto.movbd_title }"/>
				<input name="movbd_no" value="${dto.movbd_no}" type="hidden"> 
			</td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td><input name="movbd_id" value="${dto.movbd_id}" readonly></td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td><div id="smarteditor">
        	<textarea name="movbd_content" id="editorTxt" 
                  rows="20" cols="10" 
                  style="width: 100%"></textarea></div></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="글 수정 완료"> 
			</td>
		</tr>
	</table>

</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
    let oEditors = []

    smartEditor = function() {
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fOnAppLoad : function(){
            oEditors.getById["editorTxt"].exec("PASTE_HTML", ['${dto.movbd_content}']);
        },
        fCreator: "createSEditor2"
      })
    }

    $(document).ready(function() {
      smartEditor() 
      
      $("#save").click(function(){
    	  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	  $("#updateform").submit();
      });
      
    })
  </script>
</body>
</html>