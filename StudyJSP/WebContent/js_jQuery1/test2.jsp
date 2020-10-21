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
		//jQuery : 자바스크립트를 이용해서 함수들 모음
		//대상.함수()
		//전체대상.함수()
		$('*').css('color','red');
		//특정태그.함수()
		$('h1').css('color','blue');
		//태그표시.함수()
		$('h1#ta').css('color','green');
		//태그class 표시.함수()
		$('h1.ta2').css('color','orange');
		//태그[속성=값].함수()
		$('input[type=text]').css('color','skyblue');
		//반복태그 홀수 짝수 첫 마지막
		//태그:odd 태그:even 태그:frist 태그:last
		$('tr:odd').css('background','pink');
		$('tr:even').css('background','yellow');
		$('tr:first').css('background','green');
	});
</script>
</head>
<body>
<table border="1">
<tr><td>번호</td><td>제목</td></tr> <!-- 0 -->
<tr><td>1</td><td>제목1</td></tr> <!-- 1 -->
<tr><td>2</td><td>제목2</td></tr> <!-- 2 -->
<tr><td>3</td><td>제목3</td></tr> <!-- 3 -->
<tr><td>4</td><td>제목4</td></tr>  <!-- 4 -->
</table>
<input type="text" value="글자">
<input type="password" value="123">
<h1>js_jQuery/test2.jsp</h1>
<h1 id="ta">제목1</h1>
<h1 class="ta2">제목2</h1>
내용
</body>
</html>