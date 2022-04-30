<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<style>
.submenu {
  list-style-type: none;
  position: right;
  display: none; <!--로드했을 때 submenu가 안보이게 하기 위함 -->
}
</style>
</head>
<body>
<h1>대분류 항목에 반응해 목록이 바뀌는 중분류</h1>
<select id="productSelect">
   <option value="0" selected="selected">제품군 선택</option>
   <option value="1">TGD클리너 500ml</option>
   <option value="2">TGD클린키트</option>
   <option value="3">TGD클린팩</option>
</select>
>
<select id="mallSelect">
   <option value="0">판매몰 선택</option>
   <option value="500-OWN" class="mall1">트라움샵</option>
   <option value="500-WM" class="mall1">위메프</option>
   <option value="kit-OWN" class="mall2">트라움샵</option>
   <option value="pack-OWN" class="mall3">트라움샵</option>
</select>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var malls = false;

function update_selected() {
  $("#mallSelect").val(0);
  $("#mallSelect").find("option[value!=0]").detach();

  $("#mallSelect").append(malls.filter(".mall" + $(this).val()));
}

$(function() {
  malls = $("#mallSelect").find("option[value!=0]");
  malls.detach();

  $("#productSelect").change(update_selected);
  $("#productSelect").trigger("change");
});
	
</script>
</html>