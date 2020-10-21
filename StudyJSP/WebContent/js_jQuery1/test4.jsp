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
		//대상.attr(속성) : 대상태그의 속성을 가져오고 변경
		//.attr(attributeName) 
		var wid=$('img').attr('width');
		alert(wid);
		//.attr(attributeName, value)
		//이미지태그 속성width 500변경
		$('img').attr('width','500');
		//.attr(attributeName, function)
		var width=['100','200','300'];
		$('img').attr('width',function(index){
			alert(width[index]);
					return (index+1)*100;
		});
		//.attr(attributes)
		
	});
</script>
</head>
<body>
<h1>js_jQuery/test4.jsp</h1>
<img src="../img/1.jpg" width="300" height="200">
<img src="../img/1.jpg" width="300" height="200">
<img src="../img/1.jpg" width="300" height="200">
</body>
</html>