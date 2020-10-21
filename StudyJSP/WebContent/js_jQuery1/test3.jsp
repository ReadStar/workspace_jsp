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
	//대상.css()
	//대상.css(속성) : 속성에 대한 값을 가져오기
	var col=$('h2').css('color');
	alert(col);
	//대상.css(속성, 값) : 속성에 대한 값을 변경
	$('h2').css('color','red');
	// .css(propertyName, function)
	var color=['red', 'blue','green'];
	$('h2').css('color',function(index){
		alert(color[index]);
		return color[index];
// 		if(index==0){
// 			return 'blue';
// 		}
// 		if(index==1){
// 			return 'green';
// 		}if(index==2){
// 			return 'yellow';
// 		}
	});
	//대상.css(properties)
	$('h2').css('color','red').css('background','pink');
	$('h2').css({
		color:'blue',
		background:'skyblue'
	});
	var bakcolor=['pink','skyblue','yellow']
	$('h2').css({
		color:function(index){
			return color[index];
		},
		background:function(index){
			return bakcolor[index];
		}
	});
	});
</script>
</head>
<body>
<h1>js_Query1_test3.jsp</h1>
<h2>head-0</h2>
<h2>head-1</h2>
<h2>head-2</h2>
</body>
</html>