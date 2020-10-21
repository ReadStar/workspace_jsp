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
		//대상.html() : 대상에 내용을 가져오거나 넣기
		var ht=$('h2').html();
// 		alert(ht);
// 		$('h2').html("내용");
// 		$('h2').html(function(index){
// 			return "내용-"+index;
// 		});
		$('h2').html(function(index,oldhtml){
// 			alert(oldhtml);
			return oldhtml + "*"; 
		});
	});
		
</script>
</head>
<body>
<h1>js_jQuery/test5.jsp</h1>
<h2>head-0</h2>
<h2>head-1</h2>
<h2>head-2</h2>
</body>
</html>