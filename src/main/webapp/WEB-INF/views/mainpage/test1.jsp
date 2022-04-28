<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.cssl@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
</style>
<body>
<div>
  <select name="location">
  <option value="1">one</option>
  <option value="22">two</option>
  <option value="3">three</option>
  </select>
</div>
<div id="output">
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$("select[name=location]").change(function(){
  console.log($(this).val()); //value값 가져오기
  console.log($("select[name=location] option:selected").text()); //text값 가져오기
});
</script>
</body>
</html>