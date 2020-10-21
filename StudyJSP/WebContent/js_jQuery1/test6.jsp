<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('body').append("<h2>추가내용</h2>");
		$('div').append(function(index){
			return "내용" + index;3
		});
		//p태그 안에서 기존 img태그를 뒤부분에 추가
		$('p').append($('img').first());
		setInterval(function(){
			//2초마다 함수 실행
		}, 20000);
	});
		
</script>
</head>
<body>
<h1>js_jQuery/test6.jsp</h1>
<p>
<img src="../img/1.jpg" width = 300 height = 200>
<img src="../img/1.jpg" width = 300 height = 200>
<img src="../img/1.jpg" width = 300 height = 200>
<img src="../img/1.jpg" width = 300 height = 200>
<img src="../img/1.jpg" width = 300 height = 200>
</p>
<div></div>
<div></div>
<div></div>
</body>
</html>