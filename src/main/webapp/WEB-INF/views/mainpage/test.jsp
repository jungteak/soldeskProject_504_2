<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:600&display=swap');
body{
  margin: 0;
  padding: 0;
  display: flex;
  height: 100vh;
  align-items: center;
  justify-content: center;
  background:#fff;
}
span{
  position: relative;
  display: inline-flex;
  width: 180px;
  height: 55px;
  margin: 0 15px;
  perspective: 1000px;
}
span a{
  font-size: 19px;
  letter-spacing: 1px;
  transform-style: preserve-3d;
  transform: translateZ(-25px);
  transition: transform .25s;
  font-family: 'Montserrat', sans-serif;
  
}
span a:before,
span a:after{
  position: absolute;
  content: "BUTTON";
  height: 55px;
  width: 180px;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 5px solid black;
  box-sizing: border-box;
  border-radius: 5px;
}
<%--
span a:before{
  color: #fff;
  background: #000;
  transform: rotateY(0deg) translateZ(25px);
}
span a:after{
  color: #000;
  transform: rotateX(90deg) translateZ(25px);
}
span a:hover{
  transform: translateZ(-25px) rotateX(-90deg);
}
--%>
</style>
</head>
<body>
<section>
<span><a href="#"></a></span>
	<article>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
	</article>
</section>
</body>
</html>