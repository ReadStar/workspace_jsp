<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.high_0{background: yellow;}
		.high_1{background: orange;}
		.high_2{background: blue;}
		.high_3{background: green;}
		.high_4{background: red;}
</style>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			//대상.each() 대상 반복
			//태그대상 반복
// 			$('h2').each(function(index){
// 				alert(index)
// 				$(this).addClass('high_'+index);
// 			});
			//배열대상 반복
			var arr=[
				{name:'naver', link: 'www.naver.com'},
				{name:'daum', link: 'www.daum.net'},
				{name:'jquery', link: 'www.jquery.com'}
				];
			$.each(arr, function(index, item){
// 				alert(index);
// 				alert(item);
// 				alert(item.name);
// 				alert(item.link);
				$('body').append(item.name+","+item.link+"<br>");
			});
			//배열변수 each() table태그 뒷부분에 추가
			$.each(arr,function(index, item){
				$('table').append("<tr><td>"+item.name+"</td><td>"+item.link+"</td></tr>");
			});
	});
		
</script>
</head>
<body>
<h1>js_jQuery/test7.jsp</h1>
<table border="1">
<tr><td>사이트이름</td><td>사이트주소</td></tr>
</table>
<h2>item-0</h2>
<h2>item-1</h2>
<h2>item-2</h2>
<h2>item-3</h2>
<h2>item-4</h2>
</body>
</html>